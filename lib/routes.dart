import 'package:flutter/material.dart';
import 'package:resume_builder/Screens/SignUp/signup.dart';
import 'package:resume_builder/Screens/UserInfo/user_address_info.dart';
import 'package:resume_builder/Screens/home_screen.dart';

import 'Screens/UserInfo/resume_view.dart';
import 'Screens/UserInfo/user_basic_info.dart';

final Map<String, WidgetBuilder> routes = {
  SignUpScreen.routeName: (ctx) => SignUpScreen(),
  HomeScreen.routeName: (ctx) => HomeScreen(),
  UserBasicInfoScreen.routeName: (ctx) => UserBasicInfoScreen(),
  UserAddressScreen.routeName: (ctx) => UserAddressScreen(),
  ResumeViewScreen.routeName: (ctx) => ResumeViewScreen()
};
