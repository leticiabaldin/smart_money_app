import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_money_app/assets/colors/colors_smart_money.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({Key? key, this.next}) : super(key: key);
  final String? next;

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool loading = false;
  bool _isObscure = false;

  Future<void> createAccount() async {
    if (loading) return;

    setState(() => loading = true);

    final name = nameController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text;

    final fireAuth = FirebaseAuth.instance;
    final scaffoldMessenger = ScaffoldMessenger.of(context);


    try {
      final credentials = await fireAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await credentials.user!.updateDisplayName(name);

      scaffoldMessenger.clearSnackBars();
      scaffoldMessenger.showSnackBar(
        SnackBar(
          content: Text('Seja Bem vindo(a), $name!'),
          behavior: SnackBarBehavior.floating,
          duration: const Duration(milliseconds: 1500),
        ),
      );
      goToFlow();
    } catch (e) {
      scaffoldMessenger.clearSnackBars();
      scaffoldMessenger.showSnackBar(
        const SnackBar(
          content: Text('Não foi possível criar a sua conta. Tente novamente.'),
          behavior: SnackBarBehavior.floating,
          duration: Duration(milliseconds: 2500),
          backgroundColor: AppColors.redApp,
        ),
      );
    }

    setState(() => loading = false);
  }

  void goToFlow() {
    if (widget.next != null) {
      context.go(widget.next!.replaceAll('%20F', '/'));
    } else {
      context.go('/homePage');
    }
  }

  @override
  void initState() {
    super.initState();
    _isObscure = true;
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(
            vertical: 72,
            horizontal: 24,
          ),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () => context.go('/'),
                      icon: const Icon(Icons.arrow_back_outlined, size: 32),
                    ),
                  ],
                ),
                const Image(
                  image: AssetImage("lib/assets/images/login_page_image.png"),
                  height: 120,
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: const Text(
                    'Faça seu cadastro aqui!',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black87,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 0),
                  alignment: Alignment.bottomLeft,
                  child: const Text(
                    'Aproveite ao máximo o Smart Money.',
                    style: TextStyle(fontSize: 15, color: Colors.black54),
                  ),
                ),
                const SizedBox(height: 32),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  controller: nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Campo obrigatório';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Nome Completo:',
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
                const SizedBox(height: 24),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Campo obrigatório';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'E-mail:',
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
                const SizedBox(height: 24),
                TextFormField(
                  controller: passwordController,
                  textInputAction: TextInputAction.go,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Campo obrigatório';
                    }
                    return null;
                  },
                 obscureText: _isObscure,
                  decoration: InputDecoration(
                    labelText: 'Senha:',
                    labelStyle: const TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                    suffixIcon: IconButton(
                        icon: const Icon(Icons.remove_red_eye_rounded),
                        color: Colors.grey,
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        },
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
                  onFieldSubmitted: (_) {
                    if (formKey.currentState!.validate()) {
                      createAccount();
                    }
                  },
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.maxFinite,
                  height: 52,
                  child: ElevatedButton(
                    onPressed: !loading
                        ? () {
                      if (formKey.currentState!.validate()) {
                        createAccount();
                      }
                    }
                        : null,
                    style: ElevatedButton.styleFrom(
                        alignment: Alignment.center,
                        backgroundColor: AppColors.purpleApp),
                    child: const Text(
                      'Criar Conta',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Image(
                        image: AssetImage("lib/assets/images/credit_card.png"),
                        height: 120),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
