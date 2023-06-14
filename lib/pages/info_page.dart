import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_money_app/widgets/profile_card.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () => context.go('/homePage'),
                  icon: const Icon(Icons.arrow_back_outlined, size: 32),
                ),
              ],
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(top: 16),
              child: const Text(
                'Qual o intuito do Smart Money?',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  width: 370,
                  margin: const EdgeInsets.symmetric(
                    vertical: 12,
                  ),
                  child: const Text(
                    'A ideia do aplicativo é ser uma carteira digital aos usuários, facilitando o controle de entrada e saída do dinheiro em sua conta bancária.',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  width: 370,
                  margin: const EdgeInsets.symmetric(
                    vertical: 12,
                  ),
                  child: const Text(
                    'A usabilidade do aplicativo é muito boa e conta com uma interface intuitiva para adição e remoção dos valores.',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(top: 16),
              child: const Text(
                'Quem somos nós?',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: ListView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                children: const [
                  ProfileCard(
                    nameCard: 'Letícia Baldin Galvani',
                    imageCard: AssetImage(
                      'lib/assets/images/let_image.png',
                    ),
                    raCard: 'RA: 22101947',
                  ),
                  ProfileCard(
                    nameCard: 'Victor Vasconcelos Lobão',
                    imageCard: AssetImage(
                      'lib/assets/images/victor_image.png',
                    ),
                    raCard: 'RA: 22104605',
                  ),
                  ProfileCard(
                    nameCard: 'Bruno César',
                    imageCard: AssetImage(
                      'lib/assets/images/bruno_image.png',
                    ),
                    raCard: 'RA: 22107313',
                  ),
                  ProfileCard(
                    nameCard: 'Gabriel Moreno',
                    imageCard: AssetImage(
                      'lib/assets/images/gabriel_image.png',
                    ),
                    raCard: 'RA: 22101947',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
