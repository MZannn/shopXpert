import 'package:flutter/material.dart';
import 'package:shopxpert/blocs/register/register_bloc.dart';

import 'package:shopxpert/widgets/custom_text_field.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final TextEditingController emailController = TextEditingController();
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController firstNameController = TextEditingController();
    final TextEditingController lastNameController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(
            36,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/logo.png",
                height: 200,
              ),
              Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        "/login",
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      fixedSize: Size(
                        MediaQuery.of(context).size.width / 1.2,
                        50,
                      ),
                      backgroundColor: Colors.orange[800],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          25,
                        ),
                      ),
                    ),
                    child: Text(
                      "Login",
                      style: textTheme.titleMedium!.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  BlocListener<RegisterBloc, RegisterState>(
                    listener: (context, state) {
                      if (state is RegisterSuccess) {
                        Navigator.pushNamed(
                          context,
                          "/login",
                        );
                      }
                      if (state is RegisterError) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(state.message),
                          ),
                        );
                      }
                    },
                    child: ElevatedButton(
                      onPressed: () {
                        var registerBloc = context.read<RegisterBloc>();
                        showModalBottomSheet<void>(
                          isScrollControlled: true,
                          context: context,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              25,
                            ),
                          ),
                          builder: (BuildContext context) {
                            return SingleChildScrollView(
                              padding: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).viewInsets.bottom,
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(
                                      top: 16,
                                    ),
                                    height: 5,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[300],
                                      borderRadius: BorderRadius.circular(
                                        25,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 16,
                                    ),
                                    child: Form(
                                      key: formKey,
                                      child: Column(
                                        children: [
                                          Text(
                                            "Register",
                                            style:
                                                textTheme.titleLarge!.copyWith(
                                              color: Colors.black,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 16,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2.2,
                                                child: CustomTextField(
                                                  controller:
                                                      firstNameController,
                                                  label: "First Name",
                                                  hint: "Input your first name",
                                                ),
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2.2,
                                                child: CustomTextField(
                                                  controller:
                                                      lastNameController,
                                                  label: "Last Name",
                                                  hint: "Input your last name",
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          CustomTextField(
                                            controller: emailController,
                                            label: "Email",
                                            hint: "Input your email",
                                            isEmail: true,
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          CustomTextField(
                                            controller: usernameController,
                                            label: "Username",
                                            hint: "Input your username",
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          CustomTextField(
                                            controller: passwordController,
                                            label: "Password",
                                            hint: "*********",
                                            isObscure: true,
                                            suffix: IconButton(
                                              icon: Icon(
                                                Icons.visibility,
                                                color: Colors.orange[800],
                                              ),
                                              onPressed: () {},
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 24,
                                          ),
                                          ElevatedButton(
                                            onPressed: () {
                                              if (formKey.currentState!
                                                  .validate()) {
                                                registerBloc.add(
                                                  RegisterEventSubmit(
                                                    email: emailController.text,
                                                    username:
                                                        usernameController.text,
                                                    password:
                                                        passwordController.text,
                                                    firstName:
                                                        firstNameController
                                                            .text,
                                                    lastName:
                                                        lastNameController.text,
                                                  ),
                                                );
                                              }
                                            },
                                            style: ElevatedButton.styleFrom(
                                              elevation: 0,
                                              fixedSize: Size(
                                                MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                50,
                                              ),
                                              backgroundColor:
                                                  Colors.orange[800],
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  25,
                                                ),
                                              ),
                                            ),
                                            child: Text(
                                              "Register",
                                              style: textTheme.titleMedium!
                                                  .copyWith(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        fixedSize: Size(
                          MediaQuery.of(context).size.width / 1.2,
                          50,
                        ),
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            25,
                          ),
                        ),
                      ),
                      child: Text(
                        "Register",
                        style: textTheme.titleMedium!.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
