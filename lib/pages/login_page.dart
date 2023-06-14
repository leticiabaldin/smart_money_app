import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../assets/colors/colors_smart_money.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key, this.next}) : super(key: key);

  final String? next;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool loading = false;

  Future<void> login() async {
    if (loading) return;

    setState(() => loading = true);

    final email = emailController.text.trim();
    //trim = remove os espaços
    final password = passwordController.text;

    final fireAuth = FirebaseAuth.instance;
    //intancia o auth
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    try {
      UserCredential credentials = await fireAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      await fireAuth.setPersistence(Persistence.LOCAL);

      scaffoldMessenger.clearSnackBars();
      scaffoldMessenger.showSnackBar(
        const SnackBar(
          content: Text('Bem vindo(a), fulano'),
          behavior: SnackBarBehavior.floating,
          duration: Duration(milliseconds: 1500),
        ),
      );
      goToFlow();
    } catch (e) {
      scaffoldMessenger.clearSnackBars();
      scaffoldMessenger.showSnackBar(
        const SnackBar(
          content:  Text('Verifique suas credenciais ou crie uma conta.'),
          behavior: SnackBarBehavior.floating,
          duration:  Duration(milliseconds: 2500),
        ),
      );
    }

    setState(() => loading = false);
  }

  void goToFlow() {
    if (widget.next != null) {
      context.go(widget.next!.replaceAll('', ''));
    } else {
      context.go('/homePage');
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 82,
          horizontal: 24,
        ),
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Image(
              image: AssetImage("lib/assets/images/login_page_image.png"),
              height: 150,
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
            Form(
              key: formKey,
              autovalidateMode: AutovalidateMode.disabled,
              child: Column(
                children: [
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    //vai p proximo campo
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Este campo é obrigatório.';
                      }

                      // if(!EmailValidator.validate(value.trim())){
                      //  return 'Email inválido.'
                      // }
                      return null;
                    },
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
                  TextFormField(
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.next,
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Este campo é obrigatório.';
                      }

                      // if(!EmailValidator.validate(value.trim())){
                      //  return 'Email inválido.'
                      // }
                      return null;
                    },
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
                      onPressed: () {
                        if (formKey.currentState!.validate() ) {
                          login();
                          context.go('/homePage');
                          //print("cliquei aqui");
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          alignment: Alignment.center,
                          backgroundColor: AppColors.purpleApp),
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
                              fontWeight: FontWeight.w600,
                              color: AppColors.purpleApp),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
