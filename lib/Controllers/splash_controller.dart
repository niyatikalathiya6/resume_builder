import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Screens/SignUp/signup.dart';

class SplashManager extends GetxController {
  final BuildContext context;
  SplashManager({required this.context});

  @override
  void onInit() async {
    await Future.delayed(const Duration(seconds: 2))
        .then((res) => {Navigator.pushNamed(context, SignUpScreen.routeName)});
    super.onInit();
  }
}
