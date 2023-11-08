import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../../Controllers/user_info_controller.dart';
import '../../Utils/InputWidget.dart';
import '../../Utils/constants.dart';
import 'user_address_info.dart';

class UserBasicInfoScreen extends StatelessWidget {
  const UserBasicInfoScreen({super.key});
  static const routeName = 'UserBasicInfoScreen';

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments;
    
    return GetBuilder(
        init: UserInfoController(args : args),
        builder: (userInfoController) {
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(0),
              child: AppBar(
                backgroundColor: AppColors.primaryColor,
                automaticallyImplyLeading: false,
              ),
            ),
            body: Column(
              children: [
                Container(
                  height: 60.h,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.secondaryColor.withOpacity(0.5)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100.sp),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 11.w),
                                width: 40.sp,
                                height: 40.sp,
                                child: Icon(
                                  Icons.arrow_back,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                      Text("Basic Information",
                          style: TextStyle(
                              fontSize: 16.sp,
                              letterSpacing: 0.sp,
                              fontWeight: FontWeight.w500,
                              height: 24.h / 16.sp,
                              color: Colors.black)),
                      Spacer(),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    physics: NeverScrollableScrollPhysics(),
                    child: Container(
                      height: MediaQuery.of(context).size.height - 60.h,
                      child: ListView(
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        padding: EdgeInsets.symmetric(horizontal: 25.w),
                        children: [
                          Text(
                            "Develop a compelling resume that captivates employers and charts a course for success.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20.sp,
                                letterSpacing: 0.sp,
                                fontWeight: FontWeight.w600,
                                height: 28.h / 20.sp,
                                color: Colors.black),
                          ),
                          SizedBox(height: 32.h),
                          Column(
                            children: [
                              InputWidget(
                                textEditingController:
                                    userInfoController.fullNameController,
                                inputWidgetHeight: 96.h,
                                textfieldheight: 48.h,
                                label: "Full Name",
                                placeholderText: "Eg, Niyatiii Kalathiya",
                                validator: (v) {
                                  return null;
                                },
                                onChanged: (p0) {
                                  userInfoController.validateBasicInfo();
                                },
                              ),
                              SizedBox(height: 2.h),
                              InputWidget(
                                inputWidgetHeight: 96.h,
                                label: "Enter your phone number",
                                placeholderText: "Eg, +91 8080802020",
                                textfieldWidget: SizedBox(
                                  height: 48.h,
                                  child: IntlPhoneField(
                                    controller: userInfoController
                                        .phoneNumberController,
                                    dropdownIconPosition: IconPosition.trailing,
                                    disableLengthCheck: true,
                                    cursorColor: Colors.black,
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 16.w),
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.never,
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.sp),
                                        borderSide:
                                            BorderSide(color: Colors.black),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.sp),
                                        borderSide: BorderSide(
                                            color: AppColors.primaryColor),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.sp),
                                        borderSide: BorderSide(
                                            color: AppColors.redColor),
                                      ),
                                      labelText: 'Phone Number',
                                      labelStyle: TextStyle(
                                        fontSize: 14.sp,
                                        letterSpacing: 0.sp,
                                        fontWeight: FontWeight.w400,
                                        height: 24.h / 14.sp,
                                        color: Colors.grey,
                                      ),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(),
                                      ),
                                    ),
                                    initialCountryCode: 'IN',
                                    onChanged: (phone) {
                                      userInfoController.validateBasicInfo();
                                    },
                                  ),
                                ),
                                validator: (v) {
                                  return null;
                                },
                              ),
                              InputWidget(
                                textEditingController:
                                    userInfoController.emailController,
                                inputWidgetHeight: 96.h,
                                textfieldheight: 48.h,
                                label: "Email",
                                placeholderText: "Eg, niyatiii.k06@gmail.com",
                                onChanged: (p0) {
                                  userInfoController.validateBasicInfo();
                                },
                                validator: (v) {
                                  return null;
                                },
                              ),
                            ],
                          ),
                          SizedBox(
                              height: 90.h +
                                  MediaQuery.of(context).viewInsets.bottom)
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    await userInfoController
                        .validateBasicInfo()
                        .then((value) async {
                      if (value) {
                        Navigator.pushNamed(
                            context, UserAddressScreen.routeName);
                      }
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 16.w),
                    height: 48.h,
                    width: double.infinity,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: !userInfoController.validateUserBasicInfoForm
                            ? Colors.grey
                            : AppColors.secondaryColor,
                        borderRadius: BorderRadius.circular(20.sp)),
                    child: Text(
                      "Save & Continue",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(height: 20.h)
              ],
            ),
          );
        });
  }
}
