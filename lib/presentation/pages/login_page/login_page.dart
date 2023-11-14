import 'package:flix_movie/presentation/extensions/build_context_extension.dart';
import 'package:flix_movie/presentation/misc/methods.dart';
import 'package:flix_movie/presentation/providers/router/router_provider.dart';
import 'package:flix_movie/presentation/providers/user_data/user_data_provider.dart';
import 'package:flix_movie/presentation/widgets/flix_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(
      userDataProvider,
      (previous, next) {
        if (next is AsyncData) {
          if (next.value != null) {
            ref.read(routerProvider).goNamed('main');
          }
        } else if (next is AsyncError) {
          context.showSnacBar(next.error.toString());
        }
      },
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              verticalSpace(100),
              Image.asset(
                "assets/flix_logo.png",
                width: 150.0,
              ),
              verticalSpace(100),
              FlixTextField(
                labelText: 'E-mail',
                controller: emailController,
              ),
              verticalSpace(24),
              FlixTextField(
                labelText: 'Senha',
                obscureText: true,
                controller: passwordController,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Esqueceu a senha?',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              verticalSpace(24),
              switch (ref.watch(userDataProvider)) {
                AsyncData(:final value) => value == null
                    ? SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          child: const Text(
                            'Entra',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            ref.read(userDataProvider.notifier).login(
                                email: emailController.text,
                                password: passwordController.text);
                          },
                        ),
                      )
                    : const Center(
                        child: CircularProgressIndicator(),
                      ),
                _ => const Center(
                    child: CircularProgressIndicator(),
                  ),
              },
              verticalSpace(24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Não tem conta?"),
                  TextButton(
                    child: const Text(
                      'Registre aqui...',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      ref.read(routerProvider).goNamed('register');
                    },
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
