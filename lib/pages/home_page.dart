import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:smart_money_app/widgets/modal_home_values.dart';
import 'package:smart_money_app/widgets/transaction_tile.dart';

import '../assets/colors/colors_smart_money.dart';
import '../entities/transaction.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final fireAuth = FirebaseAuth.instance;
  late final user = fireAuth.currentUser;
  StreamSubscription? subscription;
  bool loading = false;
  List<MoneyTransaction> transactions = [];

  double totalAddedMoney = 0;
  double totalLostMoney = 0;
  double actualMoney = 0;

  @override
  void initState() {
    super.initState();
    getTransactions();
  }

  @override
  void dispose() {
    subscription?.cancel();
    super.dispose();
  }

  getTransactions() {
    setState(() => loading = true);
    if (user == null) return;
    final id = user!.uid;
    final firestore = FirebaseFirestore.instance;
    final collection = firestore.collection("transactions/$id/history").orderBy(
          "date",
          descending: true,
        );
    subscription = collection.snapshots().listen((event) {
      if (event.size <= 0) {
        setState(() {
          this.transactions = [];
          this.totalAddedMoney = 0;
          this.totalLostMoney = 0;
          this.actualMoney = 0;
          loading = false;
        });
      }
      final transactions = event.docs
          .map((doc) => MoneyTransaction.fromMap(doc.data()))
          .toList();

      final totalAddedMoney = transactions.map((transaction) {
        if (transaction.type == Options.lostMoney) return 0.0;
        return transaction.value;
      }).reduce((value, element) => value + element);

      final totalLostMoney = transactions.map((transaction) {
        if (transaction.type == Options.addMoney) return 0.0;
        return transaction.value;
      }).reduce((value, element) => value + element);

      final actualMoney = totalAddedMoney - totalLostMoney;

      setState(() {
        this.transactions = transactions;
        this.totalAddedMoney = totalAddedMoney;
        this.totalLostMoney = totalLostMoney;
        this.actualMoney = actualMoney;
        loading = false;
      });
    }, onError: (_) {
      setState(() => loading = false);
    });
  }

  String convertValue(double value) {
    final formatter = NumberFormat("0.00");
    return formatter.format(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          elevation: 6,
          backgroundColor: AppColors.purpleApp,
          leading: Container(
            margin: const EdgeInsets.only(left: 8),
            child: const CircleAvatar(
              foregroundImage:
                  AssetImage('lib/assets/images/female_avatar.png'),
            ),
          ),
          title: Text(
            'Olá, ${user?.displayName}!',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () => context.go('/infoPage'),
              icon: const Icon(
                Icons.info_outline,
                color: Colors.white,
                size: 32,
              ),
            ),
            const SizedBox(width: 8),
            IconButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return SizedBox(
                      height: 240,
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(
                              vertical: 28,
                              horizontal: 50,
                            ),
                            alignment: Alignment.center,
                            child: const Text(
                              'Você tem certeza que deseja sair do aplicativo?',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  context.go('/');
                                },
                                style: ElevatedButton.styleFrom(
                                  //backgroundColor: AppColors.greyDarkApp,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 10,
                                    horizontal: 32,
                                  ),
                                ),
                                child: const Text(
                                  'Confirmar',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () => Navigator.pop(context),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.greyDarkApp,
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 10,
                                      horizontal: 32,
                                    )),
                                child: const Text(
                                  'Cancelar',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                );
              },
              icon: const Icon(
                Icons.exit_to_app_outlined,
                color: Colors.white,
                size: 32,
              ),
            ),
            const SizedBox(
              width: 16,
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 28),
            child: Row(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.symmetric(vertical: 22),
                  child: const Text(
                    'Controle Financeiro',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              vertical: 0,
              horizontal: 16,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 68,
                  width: 180,
                  decoration: BoxDecoration(
                      color: AppColors.greenApp,
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Icon(
                          Icons.area_chart_rounded,
                          color: Colors.white,
                          size: 42,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'R\$${convertValue(totalAddedMoney)}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const Text(
                              'Ganhos totais',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 68,
                  width: 180,
                  decoration: BoxDecoration(
                      color: AppColors.redApp,
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Icon(
                          Icons.area_chart_rounded,
                          color: Colors.white,
                          size: 42,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'R\$${convertValue(totalLostMoney)}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const Text(
                              'Gastos totais',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 24, horizontal: 28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Saldo atual:',
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 6),
                Text(
                  'R\$${convertValue(actualMoney)}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 0.5,
                  child: Container(
                    color: Colors.black45,
                  ),
                ),
                const SizedBox(height: 40),
                const Text(
                  'Histórico:',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Builder(builder: (context) {
              if (loading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (transactions.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Você tá liso',
                        style: TextStyle(fontSize: 22),
                      ),
                      Expanded(
                        child: Image.asset(
                          "lib/assets/images/emptyState.png",
                        ),
                      ),
                    ],
                  ),
                );
              }

              return ListView.builder(
                itemCount: transactions.length,
                itemBuilder: (context, index) {
                  final transaction = transactions[index];
                  return TransactionTile(transaction: transaction);
                },
              );
            }),
          ),
          Container(
            alignment: Alignment.center,
            height: 110,
            width: double.maxFinite,
            child: Stack(
              children: [
                TextButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.purpleApp,
                    fixedSize: const Size(180, 48),
                    elevation: 12,
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                          ModalHomeValues(money: actualMoney),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.add,
                        size: 34,
                        color: Colors.white,
                      ),
                      Text(
                        'Novo valor',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
