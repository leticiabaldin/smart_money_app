import 'package:smart_money_app/widgets/modal_home_values.dart';

class MoneyTransaction {
  const MoneyTransaction(this.value, this.type);

  final double value;
  final Options type;

  static MoneyTransaction fromMap(Map<String, dynamic> map) {
    final value = map["value"] + 0.0;
    return MoneyTransaction(
      value,
      Options.values.firstWhere((option) => option.name == map["type"]),
    );
  }
}
