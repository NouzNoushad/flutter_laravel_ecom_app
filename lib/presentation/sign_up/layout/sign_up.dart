import 'package:ecom_app_bloc/data/bloc/sign_up_bloc/sign_up_bloc.dart';
import 'package:ecom_app_bloc/data/config/validators.dart';
import 'package:ecom_app_bloc/data/models/sign_up_request.dart';
import 'package:ecom_app_bloc/routes/route_constant.dart';
import 'package:ecom_app_bloc/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../widgets/auth_button.dart';
import '../../../widgets/text_form_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
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
              child: BlocListener<SignUpBloc, SignUpState>(
                listener: (context, state) {
                  if (state is SignUpLoadedState) {
                    context.go(homeRoute);
                  }
                },
                child: Form(
                  key: signUpFormKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomTextFormField(
                        hintText: 'Name',
                        controller: nameController,
                        icon: Icons.person,
                        keyboardType: TextInputType.name,
                        validator: (value) =>
                            validatorHelper.nameValidator(value!),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
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
                        height: 8,
                      ),
                      CustomTextFormField(
                        hintText: 'Confirm Password',
                        icon: Icons.lock,
                        controller: confirmPasswordController,
                        keyboardType: TextInputType.visiblePassword,
                        validator: (value) =>
                            validatorHelper.confirmPasswordValidator(
                                value!, passwordController.text),
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
                              context.push(loginRoute);
                            },
                            child: const Text(
                              'Already have an account? Login',
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
                        buttonText: 'sign up',
                        onPressed: () async {
                          if (signUpFormKey.currentState!.validate()) {
                            signUpFormKey.currentState!.save();
                            SignUpRequestModel signUpRequestModel =
                                SignUpRequestModel(
                                    name: nameController.text.trim(),
                                    email: emailController.text.trim(),
                                    password: passwordController.text.trim());
                            context
                                .read<SignUpBloc>()
                                .add(SignUpLoadedEvent(signUpRequestModel));
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
