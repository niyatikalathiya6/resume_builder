import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../Controllers/user_info_controller.dart';
import '../../Utils/constants.dart';

class ResumeViewScreen extends StatelessWidget {
  const ResumeViewScreen({super.key});
  static const routeName = 'ResumeViewScreen';
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(
          backgroundColor: AppColors.primaryColor,
          automaticallyImplyLeading: false,
        ),
      ),
      body: GetBuilder(
          init: UserInfoController(args: args),
          builder: (userInfoController) {
            return Stack(
              children: [
                Container(
                  margin: EdgeInsets.all(5),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(5.sp)),
                  child: Row(
                    children: [
                      Container(
                        width: 150.w,
                        padding: EdgeInsets.all(10.sp),
                        decoration: BoxDecoration(
                            color: AppColors.secondaryColor,
                            border: Border(
                                right: BorderSide.none,
                                bottom: BorderSide.none),
                            borderRadius: BorderRadius.circular(5.sp)),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 45.h),
                            Text(
                              "CONTACT",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 10.h),
                            Divider(
                              thickness: 2.sp,
                              height: 0,
                              color: Colors.black,
                            ),
                            SizedBox(height: 10.h),
                            Row(
                              children: [
                                Icon(Icons.call_rounded),
                                SizedBox(width: 5.w),
                                Expanded(
                                  child: Text(
                                      userInfoController
                                          .phoneNumberController.text,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis),
                                )
                              ],
                            ),
                            SizedBox(height: 5.h),
                            Row(
                              children: [
                                Icon(Icons.email_rounded),
                                SizedBox(width: 5.w),
                                Expanded(
                                  child: Text(
                                      userInfoController.emailController.text,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis),
                                )
                              ],
                            ),
                            SizedBox(height: 5.h),
                            Row(
                              children: [
                                Icon(Icons.home_rounded),
                                SizedBox(width: 5.w),
                                Expanded(
                                  child: Text(
                                      userInfoController.cityController.text,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis),
                                )
                              ],
                            ),
                            SizedBox(height: 45.h),
                            Text(
                              "SKILLS",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 10.h),
                            Divider(
                              thickness: 2.sp,
                              height: 0,
                              color: Colors.black,
                            ),
                            SizedBox(height: 7.h),
                            Text("Dart",
                                maxLines: 1, overflow: TextOverflow.ellipsis),
                            SizedBox(height: 7.h),
                            Text("Flutter",
                                maxLines: 1, overflow: TextOverflow.ellipsis),
                            SizedBox(height: 7.h),
                            Text("Firebase",
                                maxLines: 1, overflow: TextOverflow.ellipsis),
                            SizedBox(height: 7.h),
                            Text("REST API",
                                maxLines: 1, overflow: TextOverflow.ellipsis),
                            SizedBox(height: 7.h),
                            Text("GetX",
                                maxLines: 1, overflow: TextOverflow.ellipsis),
                            SizedBox(height: 7.h),
                            Text("Provider",
                                maxLines: 1, overflow: TextOverflow.ellipsis),
                            SizedBox(height: 45.h),
                            Text(
                              "Language",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 10.h),
                            Divider(
                              thickness: 2.sp,
                              height: 0,
                              color: Colors.black,
                            ),
                            SizedBox(height: 7.h),
                            Text("Hindi",
                                maxLines: 1, overflow: TextOverflow.ellipsis),
                            SizedBox(height: 7.h),
                            Text("Gujarati",
                                maxLines: 1, overflow: TextOverflow.ellipsis),
                            SizedBox(height: 7.h),
                            Text("English",
                                maxLines: 1, overflow: TextOverflow.ellipsis),
                            SizedBox(height: 35.h),
                            Text(
                              "Education",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 10.h),
                            Divider(
                              thickness: 2.sp,
                              height: 0,
                              color: Colors.black,
                            ),
                            SizedBox(height: 7.h),
                            Row(
                              children: [
                                Text("BCA",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis),
                                Spacer(),
                                Text("VNSGU",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis),
                              ],
                            ),
                            SizedBox(height: 7.h),
                            Row(
                              children: [
                                Text("CBSE",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis),
                                Spacer(),
                                Text("GAJERA",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(20.sp),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 100.h,
                              ),
                              Container(
                                alignment: Alignment.center,
                                child: Text(
                                    userInfoController.fullNameController.text,
                                    maxLines: 1,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 30.sp,
                                        letterSpacing: 0.sp,
                                        height: 44.h / 36.sp,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black)),
                              ),
                              SizedBox(height: 10.h),
                              Container(
                                alignment: Alignment.center,
                                child: Text("FLUTTER DEVELOPER",
                                    maxLines: 1,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        letterSpacing: 0.sp,
                                        color: Colors.black)),
                              ),
                              SizedBox(height: 45.h),
                              Text(
                                "ABOUT ME",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10.h),
                              Divider(
                                thickness: 2.sp,
                                height: 0,
                                color: Colors.black,
                              ),
                              SizedBox(height: 7.h),
                              Text(
                                  "Passionate and motivated Flutter developer, Love to design and develop better apps. Good at web surfing using tools like chat GPT.",
                                  overflow: TextOverflow.fade),
                              SizedBox(height: 45.h),
                              Text(
                                "WORK EXPERIENCE",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10.h),
                              Divider(
                                thickness: 2.sp,
                                height: 0,
                                color: Colors.black,
                              ),
                              SizedBox(height: 7.h),
                              Row(
                                children: [
                                  Text("MD Infotech",
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500),
                                      overflow: TextOverflow.fade),
                                  Spacer(),
                                  Text("Surat, Gujarat",
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500),
                                      overflow: TextOverflow.fade),
                                ],
                              ),
                              SizedBox(height: 4.h),
                              Row(
                                children: [
                                  Text("Flutter Developer",
                                      overflow: TextOverflow.ellipsis),
                                  Spacer(),
                                  Expanded(
                                    child: Text("May 2023 - Oct. 2023",
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                ],
                              ),
                              SizedBox(height: 45.h),
                              Text(
                                "PROJECTS",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10.h),
                              Divider(
                                thickness: 2.sp,
                                height: 0,
                                color: Colors.black,
                              ),
                              SizedBox(height: 7.h),
                              Text("Google Notes",
                                  style: TextStyle(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w500),
                                  overflow: TextOverflow.fade),
                              SizedBox(height: 7.h),
                              Text(
                                  " -  User can add, update and delete notes using SQFlite database.",
                                  overflow: TextOverflow.fade),
                              SizedBox(height: 20.h),
                              Text("Quit Smoking",
                                  style: TextStyle(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w500),
                                  overflow: TextOverflow.fade),
                              SizedBox(height: 7.h),
                              Text(
                                  " -  Help users to get rid from their smoking habit using personalized strategies, motivational tips and progress tracking.",
                                  overflow: TextOverflow.fade),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 40.sp,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Row(
                    children: [
                      Spacer(),
                      Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.secondaryColor),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100.sp),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                width: 40.sp,
                                height: 40.sp,
                                child: Icon(
                                  Icons.close,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            );
          }),
    );
  }
}
