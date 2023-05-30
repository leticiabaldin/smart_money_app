import 'package:flutter/material.dart';
import '../assets/colors/colors_smart_money.dart';

class ModalHomeValues extends StatefulWidget {
  const ModalHomeValues({Key? key}) : super(key: key);

  @override
  State<ModalHomeValues> createState() => _ModalHomeValuesState();
}

enum ValuesOption { addMoney, lostMoney }

class _ModalHomeValuesState extends State<ModalHomeValues> {
  ValuesOption? _optionSelected = ValuesOption.addMoney;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 24,
          horizontal: 32,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(
                left: 0,
                top: 28,
                right: 0,
                bottom: 8,
              ),
              width: 280,
              alignment: Alignment.center,
              child: const Text(
                'Selecione a opção que condiz com o valor adicionado:',
                style: TextStyle(fontSize: 18),
              ),
            ),
            ListTile(
              title: const Text(
                'Entrada de dinheiro',
                style: TextStyle(fontSize: 18),
              ),
              leading: Radio<ValuesOption>(
                value: ValuesOption.addMoney,
                groupValue: _optionSelected,
                onChanged: (ValuesOption? value) {
                  setState(() => _optionSelected = value);
                },
              ),
            ),
            ListTile(
              title: const Text(
                'Saída de dinheiro',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              leading: Radio<ValuesOption>(
                value: ValuesOption.lostMoney,
                groupValue: _optionSelected,
                onChanged: (ValuesOption? value) {
                  setState(() => _optionSelected = value);
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 24),
              child: const Text(
                'Informe o valor em reais:',
                style: TextStyle(fontSize: 18),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 0,
                vertical: 12,
              ),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'R\$',
                  labelStyle: const TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 1,
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 1,
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 1,
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 1,
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text(
                          'Que ótimo! Você adicionou R\$200,00 :)',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        behavior: SnackBarBehavior.floating,
                        // backgroundColor: Colors.black54,
                        elevation: 8,
                        duration: const Duration(milliseconds: 3500),
                        padding: const EdgeInsets.all(12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        showCloseIcon: true,
                      ),
                    );
                  },
                  style:
                      ElevatedButton.styleFrom(fixedSize: const Size(124, 24)),
                  child: const Text(
                    'Confirmar',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.greyDarkApp,
                      fixedSize: const Size(124, 24)),
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    'Cancelar',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
