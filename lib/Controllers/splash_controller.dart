import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Screens/SignUp/signup.dart';
import '../Screens/home_screen.dart';
import '../main.dart';

class SplashManager extends GetxController {
  final BuildContext context;
  SplashManager({required this.context});

  @override
  void onInit() async {
    bool isLogin = box.read("isLogin") ?? false;

    await Future.delayed(const Duration(seconds: 2)).then((res) => {
          Navigator.pushNamed(
              context, isLogin ? HomeScreen.routeName : SignUpScreen.routeName)
        });
    super.onInit();
  }
}
