import 'package:flutter/material.dart';
import 'package:houseasy_teste_frontend/app/core/helpers/size_extensions.dart';
import 'package:houseasy_teste_frontend/app/core/styles/custom_theme.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(1, 242, 241, 1),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text(
                  'Não possui um conta?',
                  style: TextStyle(fontSize: 12.0, color: Colors.white),
                ),
                const SizedBox(width: 10.0),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.grey.withOpacity(0.3),
                  ),
                  child: const Text(
                    'Crie Agora',
                    style: TextStyle(
                      fontSize: 12.0,
                    ),
                  ),
                )
              ],
            ),
            Container(
              height: context.percentHeight(0.2),
              alignment: Alignment.center,
              child: const Text(
                'Movieasy',
                style: TextStyle(fontSize: 28.0, color: Colors.white),
              ),
            ),
            Container(
              width: context.percentWidth(0.90),
              height: 10.0,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.6),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: context.screenWidth,
                padding: const EdgeInsets.all(20.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                child: Form(
                  child: Column(
                    children: [
                      const Text(
                        'Bem Vindo Novamente',
                        style: TextStyle(fontSize: 22.0),
                      ),
                      const SizedBox(height: 10.0),
                      const Text(
                        'Informe seus detalhes para login abaixo',
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 25.0),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'E-mail',
                          counterText: '',
                        ),
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value) {},
                      ),
                      const SizedBox(height: 10.0),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Senha',
                          suffixIcon: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.visibility),
                          ),
                          counterText: '',
                        ),
                        onChanged: (value) {},
                      ),
                      const SizedBox(height: 25.0),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.all(0.0),
                              ),
                              child: Ink(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      CustomTheme.color.shade900,
                                      CustomTheme.color,
                                    ],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Container(
                                  constraints: const BoxConstraints(
                                    minHeight: 50.0,
                                  ),
                                  alignment: Alignment.center,
                                  child: const Text(
                                    'Entrar',
                                    style: TextStyle(
                                      fontSize: 14.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 25.0),
                      const Text('Esqueceu sua senha?',
                          style: TextStyle(fontSize: 12.0, color: Colors.grey)),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
