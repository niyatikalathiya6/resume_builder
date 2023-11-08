import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../Controllers/resume_controller.dart';
import '../Models/resume_model.dart';
import '../Utils/constants.dart';
import 'UserInfo/user_basic_info.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const routeName = 'HomeScreen';

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: ResumeController(),
        builder: (resumeController) {
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(0),
              child: AppBar(
                backgroundColor: AppColors.primaryColor,
                automaticallyImplyLeading: false,
              ),
            ),
            body: resumeController.resumeList.isEmpty
                ? ListView(
                    children: [
                      SizedBox(height: 24.h),
                      Container(
                        height: 92.h,
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 4.h),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Hello,",
                                      style: TextStyle(
                                          fontSize: 24.sp,
                                          letterSpacing: 0.sp,
                                          fontWeight: FontWeight.w600,
                                          height: 32.h / 24.sp,
                                          color: Colors.black)),
                                  SizedBox(height: 8.h),
                                  Text(
                                    "Welcome !!",
                                  )
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 40.sp,
                                  width: 40.sp,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.blue.withOpacity(0.5)),
                                  child: Icon(
                                    Icons.notifications_outlined,
                                  ),
                                ),
                                SizedBox(width: 16.w),
                                Container(
                                  height: 40.sp,
                                  width: 40.sp,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.blue.withOpacity(0.5)),
                                  child: Image.asset(
                                      "assets/images/user_profile.png"),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 62.h),
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 53.h, horizontal: 27.5.w),
                        // height: 480.h,
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 47.5.w),
                              height: 206.h,
                              child: SvgPicture.asset(
                                  "assets/images/blank_image.svg"),
                            ),
                            SizedBox(height: 40.h),
                            Text(
                                "Forge a standout resume that instantly resonates with employers, creating a roadmap to success in your professional journey.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    letterSpacing: 0.sp,
                                    fontWeight: FontWeight.w400,
                                    height: 24.h / 14.sp,
                                    color: Colors.grey)),
                            SizedBox(height: 32.h),
                            InkWell(
                              onTap: () async {
                                Navigator.pushNamed(
                                    context, UserBasicInfoScreen.routeName);
                              },
                              child: Container(
                                  height: 48.h,
                                  width: double.infinity,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: AppColors.primaryColor),
                                      color: AppColors.secondaryColor,
                                      borderRadius:
                                          BorderRadius.circular(20.sp)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.add, color: Colors.black),
                                      SizedBox(width: 13.w),
                                      Text(
                                        "Create Resume",
                                        style: TextStyle(
                                            fontSize: 16.sp,
                                            color: Colors.black),
                                      )
                                    ],
                                  )),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                :
                // created resumes list
                Column(
                    children: [
                      SizedBox(height: 24.h),
                      Container(
                        height: 92.h,
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 4.h),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Welcome Back !!",
                                    style: TextStyle(
                                        fontSize: 24.sp,
                                        letterSpacing: 0.sp,
                                        fontWeight: FontWeight.w600,
                                        height: 32.h / 24.sp,
                                        color: Colors.black.withOpacity(0.5)),
                                  ),
                                  SizedBox(height: 8.h),
                                  Text(
                                    resumeController.resumeList[0]['name']
                                        .toString(),
                                    maxLines: 1,
                                    style: TextStyle(
                                        fontSize: 26.sp,
                                        letterSpacing: 0.sp,
                                        height: 44.h / 36.sp,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                  )
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 40.sp,
                                  width: 40.sp,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.blue.withOpacity(0.5)),
                                  child: Icon(
                                    Icons.notifications_outlined,
                                  ),
                                ),
                                SizedBox(width: 16.w),
                                Container(
                                  height: 40.sp,
                                  width: 40.sp,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.blue.withOpacity(0.5)),
                                  child: Image.asset(
                                      "assets/images/user_profile.png"),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 38.h),
                      Expanded(
                        child: ListView.separated(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          shrinkWrap: true,
                          controller: ScrollController(),
                          physics: BouncingScrollPhysics(),
                          itemCount: resumeController.resumeList.length,
                          separatorBuilder: (context, index) {
                            return SizedBox(height: 24.h);
                          },
                          itemBuilder: (context, index) {
                            var data = resumeController.resumeList[index!];
                            ResumeModel resume = ResumeModel.fromJson(data);
                            print(resume);
                            print(resume.runtimeType);
                            // ResumeModel data =
                            //     resume.runtimeType == "ResumeModel"
                            //         ? resume
                            //         : ResumeModel.fromJson(resume);
                            return Material(
                              borderRadius: BorderRadius.circular(8.sp),
                              elevation: 0,
                              child: Container(
                                height: 161.h,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.sp),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 36.sp,
                                          offset: Offset(0, 8.sp),
                                          color:
                                              Color.fromRGBO(2, 21, 91, 0.16))
                                    ]),
                                width: 360.w,
                                padding: EdgeInsets.symmetric(
                                    vertical: 16.h, horizontal: 16.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    // if (widget.heading != null) ...{
                                    //   Text(
                                    //     widget.heading.toString(),
                                    //     style: CustomText().h3SemiBold,
                                    //   ),
                                    //   if (widget.subheading != null)
                                    //     Text(widget.subheading.toString(),
                                    //         style: CustomText().h4Regular.copyWith(color: Colors.grey)),
                                    //   SizedBox(height: 16.h),
                                    // },
                                    Column(children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  width: 1.h,
                                                  color: Colors.white)),
                                        ),
                                        padding: EdgeInsets.only(
                                            left: 8.w,
                                            right: 8.w,
                                            top: 8.h,
                                            bottom: 16.h),
                                        child: Row(
                                          children: [
                                            Container(
                                              height: 32.sp,
                                              width: 32.sp,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.blue
                                                      .withOpacity(0.5)),
                                              child: Image.asset(
                                                  "assets/images/user_profile.png"),
                                            ),
                                            SizedBox(width: 16.w),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "${resume.name.toString()}",
                                                  style: TextStyle(
                                                      fontSize: 16.sp,
                                                      letterSpacing: 0.sp,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      height: 24.h / 16.sp,
                                                      color: Colors.black),
                                                ),
                                                SizedBox(height: 4.h),
                                                Text(
                                                    "Updated on ${resume.date.toString()}",
                                                    style: TextStyle(
                                                        fontSize: 12.sp,
                                                        letterSpacing: 0.sp,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        height: 20.h / 12.sp,
                                                        color: Colors.black)),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 24.h),
                                      Row(
                                        children: [
                                          InkWell(
                                            onTap: () async {
                                              Navigator.pushNamed(context,
                                                  UserBasicInfoScreen.routeName,
                                                  arguments: {'index': index});
                                            },
                                            child: Container(
                                              height: 32.h,
                                              width: 83.w,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  color: Colors.blue
                                                      .withOpacity(0.5),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.sp)),
                                              child: Text(
                                                "Edit",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 8.w),
                                          InkWell(
                                            onTap: () async {},
                                            child: Container(
                                              height: 32.h,
                                              width: 83.w,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  color: Colors.blue
                                                      .withOpacity(0.5),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.sp)),
                                              child: Text(
                                                "View",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                          // CustomButton(
                                          //     height: 32.h,
                                          //     width: 83.w,
                                          //     disabled: false,
                                          //     outLined: false,
                                          //     fillColor:
                                          //         Colors.blue.withOpacity(0.5),
                                          //     prefixIcon:
                                          //         Icons.visibility_outlined,
                                          //     title: "View",
                                          //     onTap: () {}),
                                          Spacer(),
                                          InkWell(
                                            onTap: () {
                                              resumeController
                                                  .deleteResume(index);
                                            },
                                            child: Icon(
                                              Icons.delete_outlined,
                                              color: AppColors.redColor,
                                            ),
                                          )
                                        ],
                                      )
                                    ]),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 24.h)
                    ],
                  ),
            floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
            floatingActionButton: resumeController.resumeList.isEmpty
                ? null
                : FloatingActionButton(
                    backgroundColor: AppColors.primaryColor,
                    child: (Icon(Icons.add)),
                    onPressed: () {
                      Navigator.pushNamed(
                          context, UserBasicInfoScreen.routeName);
                    }),
          );
        });
  }
}
