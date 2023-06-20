import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smart_money_app/entities/transaction.dart';

import 'modal_home_values.dart';

class TransactionTile extends StatelessWidget {
  const TransactionTile({Key? key, required this.transaction})
      : super(key: key);

  final MoneyTransaction transaction;

  String get image {
    if (transaction.type == Options.lostMoney) {
      return 'lib/assets/images/money_image.png';
    }
    return 'lib/assets/images/pig_image.png';
  }

  String get title {
    if (transaction.type == Options.lostMoney) {
      return 'Registro de saída';
    }
    return 'Registro de entrada';
  }

  String get value{
    final formatter = NumberFormat("0.00");
    return formatter.format(transaction.value);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 16,
      ),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              Image(
                image: AssetImage(image),
                height: 54,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    'R\$$value',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
