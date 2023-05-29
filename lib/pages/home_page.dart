import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          elevation: 6,
          backgroundColor: Colors.deepPurpleAccent,
          leading: Container(
            margin: const EdgeInsets.only(left: 8),
            child: const CircleAvatar(
              foregroundImage:
                  AssetImage('lib/assets/images/female_avatar.png'),
            ),
          ),
          title: const Text(
            'Olá, Fulano da Silva!',
            style: TextStyle(
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
            const SizedBox(
              width: 8,
            ),
            IconButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
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
                              'Tem certeza que deseja sair do aplicativo?',
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
                                    backgroundColor: Colors.black12,
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 10,
                                      horizontal: 24,
                                    )),
                                child: const Text(
                                  'Confirmar',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () => Navigator.pop(context),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red,
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 10,
                                      horizontal: 24,
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
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 28, horizontal: 0),
            height: 42,
            width: 188,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.black12,
            ),
            child: const Align(
              alignment: Alignment.center,
              child: Text(
                'Controle Financeiro',
                style: TextStyle(fontSize: 16),
              ),
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
                      color: Colors.green,
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
                          children: const [
                            Text(
                              'R\$5000,00',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              'Ganhos do mês',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                //fontWeight: FontWeight.w600,
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
                      color: Colors.red,
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
                          children: const [
                            Text(
                              'R\$5000,00',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              'Gastos do mês',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                //fontWeight: FontWeight.w600,
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
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                const Text(
                  'R\$2000,00',
                  style: TextStyle(
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
            child: ListView(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 16,
                  ),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        children: [
                          const Image(
                            image:
                                AssetImage('lib/assets/images/pig_image.png'),height: 54,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Registro de entrada',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                'R\$200,00',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 16,
                  ),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        children: [
                          const Image(
                            image:
                            AssetImage('lib/assets/images/pig_image.png'),height: 54,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Registro de entrada',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                'R\$2250,00',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 16,
                  ),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        children: [
                          const Image(
                            image:
                            AssetImage('lib/assets/images/money_image.png'),height: 54,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Registro de saída',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                'R\$3000,00',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 16,
                  ),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        children: [
                          const Image(
                            image:
                            AssetImage('lib/assets/images/money_image.png'),height: 54,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Registro de saída',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                'R\$400,00',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 16,
                  ),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        children: [
                          const Image(
                            image:
                            AssetImage('lib/assets/images/pig_image.png'),height: 54,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Registro de entrada',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                'R\$200,00',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
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
