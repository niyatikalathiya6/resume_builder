import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpManager extends GetxController {
  bool isPasswordObscure = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool validEmailAndPassword = false;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  togglePasswordVisibility() {
    isPasswordObscure = !isPasswordObscure;
    update();
  }


  Future<bool> validateEmailAndPassword() async {
    validEmailAndPassword =
        emailController.text.isEmail && passwordController.text.isNotEmpty;
    update();
    return validEmailAndPassword;
  }
}
