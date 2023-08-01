import 'package:flutter/material.dart';
import 'package:shopxpert/blocs/login/login_bloc.dart';
import 'package:shopxpert/widgets/custom_text_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController usernameController =
        TextEditingController(text: "johnd");
    final TextEditingController passwordController =
        TextEditingController(text: "m38rmF\$");
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(
              context,
            );
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
          ),
        ),
        title: Text(
          "Login",
          style: textTheme.titleMedium!,
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(
          16,
        ),
        child: Column(
          children: [
            Image.asset("assets/images/logo.png"),
            const SizedBox(
              height: 16,
            ),
            CustomTextField(
              controller: usernameController,
              label: "Username",
              hint: "Input your username",
            ),
            const SizedBox(
              height: 16,
            ),
            CustomTextField(
              controller: passwordController,
              label: "Password",
              hint: "*********",
              isObscure: false,
              suffix: const Icon(Icons.visibility_off_outlined),
            ),
            const SizedBox(
              height: 24,
            ),
            BlocListener<LoginBloc, LoginState>(
              listener: (context, state) {
                if (state is LoginSuccess) {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    "/navigation",
                    (route) => false,
                  );
                }
              },
              child: ElevatedButton(
                onPressed: () {
                  context.read<LoginBloc>().add(
                        LoginButtonPressed(
                          username: usernameController.text,
                          password: passwordController.text,
                        ),
                      );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange[800],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      25,
                    ),
                  ),
                  minimumSize: const Size(
                    double.infinity,
                    50,
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                  ),
                ),
                child: Text(
                  "Login",
                  style: textTheme.titleMedium!.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
