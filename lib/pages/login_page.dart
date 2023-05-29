import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 80,
          horizontal: 24,
        ),
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Image(
              image: AssetImage("lib/assets/images/login_page_image.png"),
              height: 140,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: const [
                Text(
                  'Seja Bem-vindo(a) ao',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black87,
                  ),
                ),
                Text(
                  ' Smart Money!',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black87,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 0),
              alignment: Alignment.bottomLeft,
              child: const Text(
                'Sua nova carteira digital.',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black54,
                ),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'E-mail',
                labelStyle: const TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    width: 1,
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(26),
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    width: 1,
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(26),
                ),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(
                    width: 1,
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(26),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    width: 1,
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(26),
                ),
              ),
            ),
            const SizedBox(height: 30),
            TextField(
              decoration: InputDecoration(
                labelText: 'Senha',
                labelStyle: const TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.remove_red_eye_rounded),
                  color: Colors.grey,
                  onPressed: () {},
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    width: 1,
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(26),
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    width: 1,
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(26),
                ),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(
                    width: 1,
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(26),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    width: 1,
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(26),
                ),
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.maxFinite,
              height: 52,
              child: ElevatedButton(
                onPressed: () => context.go('/homePage'),
                style: ElevatedButton.styleFrom(
                    alignment: Alignment.center,
                    backgroundColor: Colors.deepPurpleAccent),
                child: const Text(
                  'Conectar',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text(
                  'Não possui uma conta?',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                TextButton(
                  onPressed: () => context.go('/createAccountPage'),
                  child: const Text(
                    'Clique aqui!',
                    style: TextStyle(
                      fontSize: 16,
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
