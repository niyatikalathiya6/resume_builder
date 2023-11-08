import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:resume_builder/Controllers/signup_controller.dart';
import 'package:resume_builder/main.dart';
import '../../Utils/InputWidget.dart';
import '../../Utils/constants.dart';
import '../home_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});
  static const routeName = 'SignUpScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(
          backgroundColor: AppColors.primaryColor,
          automaticallyImplyLeading: false,
        ),
      ),
      body: GetBuilder(
          init: SignUpManager(),
          builder: (signupController) {
            return ListView(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              children: [
                SizedBox(height: 88.h),
                SizedBox(
                    height: 198.h,
                    child: Image.asset("assets/images/sign_up.png")),
                SizedBox(height: 54.h),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Sign In",
                    style: TextStyle(fontSize: 22.sp),
                  ),
                ),
                SizedBox(height: 40.h),
                InputWidget(
                  textEditingController: signupController.emailController,
                  inputWidgetHeight: 96.h,
                  textfieldheight: 48.h,
                  label: "Enter your email",
                  placeholderText: "eg. niyati.kalathiya.06@example.com",
                  validator: (v) {
                    return null;
                  },
                  onChanged: (v) {
                    signupController.validateEmailAndPassword();
                  },
                ),
                SizedBox(height: 2.h),
                InputWidget(
                  textEditingController: signupController.passwordController,
                  inputWidgetHeight: 96.h,
                  textfieldheight: 48.h,
                  label: "Password",
                  placeholderText: "Password",
                  obscureText: signupController.isPasswordObscure,
                  suffix: true,
                  suffixIcon: signupController.isPasswordObscure
                      ? Icons.visibility_off
                      : Icons.visibility,
                  onSuffixTap: () {
                    signupController.togglePasswordVisibility();
                  },
                  onChanged: (p0) {
                    signupController.validateEmailAndPassword();
                  },
                  validator: (v) {},
                ),
                SizedBox(height: 24.h),
                InkWell(
                  onTap: (
                  ) async {
                    await signupController
                        .validateEmailAndPassword()
                        .then((value) async {
                      if (value) {
                        await box.write(
                            "email", signupController.emailController.text);
                        await box.write("isLogin", true);
                        Navigator.pushNamed(context, HomeScreen.routeName);
                      }
                    });
                  },
                  child: Container(
                    height: 48.h,
                    width: double.infinity,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: signupController.validEmailAndPassword
                            ? AppColors.secondaryColor
                            : Colors.grey,
                        borderRadius: BorderRadius.circular(20.sp)),
                    child: Text(
                      "Sign In",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                InkWell(
                  onTap: () {
                    //navigate to sign up screen
                  },
                  child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(children: [
                        TextSpan(
                            text: "Don’t have an account ?  ",
                            style: TextStyle(color: Colors.black)),
                        TextSpan(
                            text: "Sign Up",
                            style: TextStyle(color: AppColors.primaryColor)),
                      ])),
                ),
              ],
            );
          }),
    );
  }
}
