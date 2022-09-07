import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:adessua/ui/auth/auth.dart';
import 'package:adessua/ui/components/components.dart';
import 'package:adessua/helpers/helpers.dart';
import 'package:adessua/controllers/controllers.dart';

class ResetPasswordUI extends StatelessWidget {
  final AuthController authController = AuthController.to;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
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
                    "Reset Password",
                    style: Theme.of(context).textTheme.headline1,
                    textAlign: TextAlign.center,
                  ),
                  FormVerticalSpace(),
                  Text(
                    "Complete your details and reset password",
                    style: Theme.of(context).textTheme.bodyText2,
                    textAlign: TextAlign.center,
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
                        authController.emailController.text = value as String,
                  ),
                  FormVerticalSpace(),
                  PrimaryButton(
                      labelText: 'auth.resetPasswordButton'.tr,
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          await authController.sendPasswordResetEmail(context);
                        }
                      }),
                  FormVerticalSpace(),
                  signInLink(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  appBar(BuildContext context) {
    if (authController.emailController.text == '') {
      return null;
    }
    return AppBar(title: Text('auth.resetPasswordTitle'.tr));
  }

  signInLink(BuildContext context) {
    if (authController.emailController.text == '') {
      return LabelButton(
        labelText: 'auth.signInonResetPasswordLabelButton'.tr,
        onPressed: () => Get.offAll(SignInUI()),
      );
    }
    return Container(width: 0, height: 0);
  }
}
