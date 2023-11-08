import 'package:flutter/material.dart';
import 'package:resume_builder/Screens/SignUp/signup.dart';
import 'package:resume_builder/Screens/home_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SignUpScreen.routeName: (ctx) => SignUpScreen(),
  HomeScreen.routeName: (ctx) => HomeScreen()
};
