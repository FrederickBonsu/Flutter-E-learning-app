import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:core';
import 'package:get/get.dart';
import 'package:adessua/ui/auth/auth.dart';
import 'package:adessua/ui/components/components.dart';
import 'package:adessua/controllers/controllers.dart';

class SignInUI extends StatelessWidget {
  final AuthController authController = AuthController.to;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  LogoGraphicHeader(),
                  Text(
                    'Log in  to Adessua',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  FormVerticalSpace(),
                  Text(
                    "Enter your email and password  \nand continue with Adessua",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  FormVerticalSpace(),
                  FormInputFieldWithIcon(
                    controller: authController.emailController,
                    iconPrefix: FontAwesomeIcons.envelope,
                    labelText: 'auth.emailFormField'.tr,
                    validator: (value) {
                      String pattern =
                          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                      // r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+';
                      RegExp regex = RegExp(pattern);
                      if (!regex.hasMatch(value))
                        return 'validator.email'.tr;
                      else
                        return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) => null,
                    onSaved: (value) =>
                        authController.emailController.text = value,
                  ),
                  FormVerticalSpace(),
                  FormInputFieldWithIcon(
                    controller: authController.passwordController,
                    iconPrefix: FontAwesomeIcons.lock,
                    labelText: 'auth.passwordFormField'.tr,
                    validator: (value) {
                      String pattern = r'^.{6,}$';
                      RegExp regex = RegExp(pattern);
                      if (!regex.hasMatch(value))
                        return 'validator.password'.tr;
                      else
                        return null;
                    },
                    obscureText: true,
                    onChanged: (value) => null,
                    onSaved: (value) =>
                        authController.passwordController.text = value,
                    maxLines: 1,
                  ),
                  FormVerticalSpace(
                    height: 20,
                  ),
                  PrimaryButton(
                      labelText: 'auth.signInButton'.tr,
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          authController.signInWithEmailAndPassword(context);
                        }
                      }),
                  LabelButton(
                    labelText: 'auth.resetPasswordLabelButton'.tr,
                    onPressed: () => Get.to(ResetPasswordUI()),
                  ),
                  FormVerticalSpace(),
                  LabelButton(
                    labelText: 'auth.signUpLabelButton'.tr,
                    onPressed: () => Get.to(SignUpUI()),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
