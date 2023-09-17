import 'package:ecom_app_bloc/data/bloc/login_bloc/login_bloc.dart';
import 'package:ecom_app_bloc/data/config/validators.dart';
import 'package:ecom_app_bloc/data/models/login_request.dart';
import 'package:ecom_app_bloc/routes/route_constant.dart';
import 'package:ecom_app_bloc/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../widgets/auth_button.dart';
import '../../../widgets/text_form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  ValidatorHelper validatorHelper = ValidatorHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPicker.whiteColor,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: BlocListener<LoginBloc, LoginState>(
                listener: (context, state) {
                  if (state is LoginLoadedState) {
                    context.go(homeRoute);
                  }
                },
                child: Form(
                  key: loginFormKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomTextFormField(
                        hintText: 'Email',
                        icon: Icons.email,
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) =>
                            validatorHelper.emailValidator(value!),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomTextFormField(
                        hintText: 'Password',
                        icon: Icons.lock,
                        controller: passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        validator: (value) =>
                            validatorHelper.passwordValidator(value!),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          child: TextButton(
                            onPressed: () {
                              context.push(signUpRoute);
                            },
                            child: const Text(
                              "Don't have an account? Sign up",
                              style: TextStyle(
                                color: ColorPicker.primaryColor2,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      AuthButton(
                        buttonText: 'login',
                        onPressed: () async {
                          if (loginFormKey.currentState!.validate()) {
                            loginFormKey.currentState!.save();
                            LoginRequestModel loginRequestModel =
                                LoginRequestModel(
                                    email: emailController.text.trim(),
                                    password: passwordController.text.trim());
                            print('////////// login: $loginRequestModel');
                            context
                                .read<LoginBloc>()
                                .add(LoginLoadedEvent(loginRequestModel));
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
