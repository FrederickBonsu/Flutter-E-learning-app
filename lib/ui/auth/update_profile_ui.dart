import 'package:adessua/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:adessua/ui/components/components.dart';
import 'package:adessua/controllers/controllers.dart';
import 'package:adessua/ui/auth/auth.dart';

class UpdateProfileUI extends StatelessWidget {
  final AuthController authController = AuthController.to;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    //print('user.name: ' + user?.value?.name);
    authController.nameController.text =
        authController.firestoreUser.value.name;
    authController.emailController.text =
        authController.firestoreUser.value.email;
    return Scaffold(
        appBar: AppBar(title: Text('Edit Profile')),
        body: GetBuilder<AuthController>(
          init: AuthController(),
          // ignore: unnecessary_null_comparison
          builder: (controller) => controller.firestoreUser.value.uid == null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Center(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            // LogoGraphicHeader(),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(height: 20),
                                Avatar(controller.firestoreUser.value),
                                Text(controller.firestoreUser.value.name,
                                    style: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blueGrey,
                                    )),
                                FormVerticalSpace(),
                                Text(controller.firestoreUser.value.email,
                                    style: TextStyle(
                                      fontSize: 20,
                                    )),
                              ],
                            ),
                            FormVerticalSpace(),
                            Divider(),
                            SizedBox(height: 20.0),
                            Text("Edit Profile"),
                            SizedBox(height: 20.0),
                            FormInputFieldWithIcon(
                              controller: authController.nameController,
                              iconPrefix: FontAwesomeIcons.user,
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
                              iconPrefix:FontAwesomeIcons.envelope,
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
                            PrimaryButton(
                                labelText: 'auth.updateUser'.tr,
                                onPressed: () async {
                                  if (_formKey.currentState.validate()) {
                                    SystemChannels.textInput
                                        .invokeMethod('TextInput.hide');
                                    UserModel _updatedUser = UserModel(
                                        uid: authController
                                            .firestoreUser.value.uid,
                                        name:
                                            authController.nameController.text,
                                        email:
                                            authController.emailController.text,
                                        photoUrl: authController
                                            .firestoreUser.value.photoUrl);
                                    _updateUserConfirm(
                                        context,
                                        _updatedUser,
                                        authController
                                            .firestoreUser.value.email);
                                  }
                                }),
                            FormVerticalSpace(),
                            LabelButton(
                              labelText: 'auth.resetPasswordLabelButton'.tr,
                              onPressed: () => Get.to(ResetPasswordUI()),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
        ));
  }

  Future<void> _updateUserConfirm(
      BuildContext context, UserModel updatedUser, String oldEmail) async {
    final AuthController authController = AuthController.to;
    final TextEditingController _password = new TextEditingController();
    return Get.dialog(
      AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        title: Text(
          'auth.enterPassword'.tr,
        ),
        content: FormInputFieldWithIcon(
          controller: _password,
          iconPrefix: FontAwesomeIcons.envelope,
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
          onSaved: (value) => _password.text = value,
          maxLines: 1,
        ),
        actions: <Widget>[
          new TextButton(
            child: new Text('auth.cancel'.tr.toUpperCase()),
            onPressed: () {
              Get.back();
            },
          ),
          new TextButton(
            child: new Text('auth.submit'.tr.toUpperCase()),
            onPressed: () async {
              Get.back();
              await authController.updateUser(
                  context, updatedUser, oldEmail, _password.text);
            },
          )
        ],
      ),
    );
  }
}
