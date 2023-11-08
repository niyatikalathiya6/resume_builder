import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controllers/splash_controller.dart';
import '../Utils/constants.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: SplashManager(context: context),
        builder: (splashController) {
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(0),
              child: AppBar(
                backgroundColor: AppColors.primaryColor,
                automaticallyImplyLeading: false,
              ),
            ),
            body: Container(
              width: double.infinity,
              height: double.infinity,
              alignment: Alignment.center,
              decoration: const BoxDecoration(color: AppColors.white),
              child: const Center(
                child: Text("RESUME BUILDER"),
              ),
            ),
          );
        });
  }
}
