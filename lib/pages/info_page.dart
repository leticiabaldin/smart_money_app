import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () => context.go('/homePage'),
                  icon: const Icon(Icons.arrow_back_outlined, size: 32),
                ),
              ],
            ),
            const Text(
              'Informações sobre o App aqui',
              style: TextStyle(
                fontSize: 18
              ),
            ),
          ],
        ),
      ),
    );
  }
}
