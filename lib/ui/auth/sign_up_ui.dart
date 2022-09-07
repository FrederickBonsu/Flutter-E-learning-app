import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:adessua/ui/components/components.dart';
import 'package:adessua/controllers/controllers.dart';
import 'package:adessua/ui/auth/auth.dart';

class SignUpUI extends StatelessWidget {
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
                    "Register Account",
                    style: Theme.of(context).textTheme.headline1,
                    textAlign: TextAlign.center,
                  ),
                  FormVerticalSpace(),
                  Text(
                    "Complete your details and continue \nwith Adessua",
                    style: Theme.of(context).textTheme.subtitle1,
                    textAlign: TextAlign.center,
                  ),
                  FormVerticalSpace(),
                  FormInputFieldWithIcon(
                    controller: authController.nameController,
                    iconPrefix:FontAwesomeIcons.user,
                    labelText: 'auth.nameFormField'.tr,
                    validator: (value) {
                      String pattern =
                          r"^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$";
                      RegExp regex = RegExp(pattern);
                      if (!regex.hasMatch(value))
                        return 'validator.name'.tr;
                      else
                        return null;
                    },
                    onChanged: (value) => null,
                    onSaved: (value) =>
                        authController.nameController.text = value,
                  ),
                  FormVerticalSpace(),
                  FormInputFieldWithIcon(
                    controller: authController.emailController,
                    iconPrefix: FontAwesomeIcons.envelope,
                    labelText: 'auth.emailFormField'.tr,
                    validator: (value) {
                      String pattern =r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
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
                  FormVerticalSpace(),
                  PrimaryButton(
                      labelText: 'auth.signUpButton'.tr,
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          SystemChannels.textInput.invokeMethod(
                              'TextInput.hide'); //to hide the keyboard - if any
                          authController.registerWithEmailAndPassword(context);
                        }
                      }),
                  FormVerticalSpace(),
                  LabelButton(
                    labelText: 'auth.signInLabelButton'.tr,
                    onPressed: () => Get.to(SignInUI()),
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
