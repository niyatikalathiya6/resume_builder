import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:resume_builder/Screens/home_screen.dart';

import '../../Controllers/resume_controller.dart';
import '../../Controllers/user_info_controller.dart';
import '../../Utils/InputWidget.dart';
import '../../Utils/constants.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});
  static const routeName = 'UserAddressScreen';

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: UserInfoController(),
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
                      Text("Address Information",
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
                          Column(
                            children: [
                              InputWidget(
                                textEditingController:
                                    userInfoController.addressController,
                                inputWidgetHeight: 96.h,
                                textfieldheight: 48.h,
                                label: "Address",
                                placeholderText: "14, Wall Street",
                                validator: (v) {
                                  return null;
                                },
                                onChanged: (p0) {
                                  userInfoController.validateAddressInfo();
                                },
                              ),
                              SizedBox(height: 2.h),
                              InputWidget(
                                textEditingController:
                                    userInfoController.zipCodeController,
                                inputWidgetHeight: 96.h,
                                textfieldheight: 48.h,
                                label: "Zip Code",
                                placeholderText: "395006",
                                keyboardType: TextInputType.number,
                                validator: (v) {
                                  return null;
                                },
                                onChanged: (p0) {
                                  userInfoController.validateAddressInfo();
                                },
                              ),
                              SizedBox(height: 2.h),
                              InputWidget(
                                textEditingController:
                                    userInfoController.countryController,
                                inputWidgetHeight: 96.h,
                                textfieldheight: 48.h,
                                label: "Country",
                                placeholderText: "India",
                                validator: (v) {
                                  return null;
                                },
                                onChanged: (p0) {
                                  userInfoController.validateAddressInfo();
                                },
                              ),
                              SizedBox(height: 2.h),
                              InputWidget(
                                textEditingController:
                                    userInfoController.stateController,
                                inputWidgetHeight: 96.h,
                                textfieldheight: 48.h,
                                textfieldWidget: Container(
                                  height: 48.h,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.sp),
                                      border: Border.all(color: Colors.black)),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton2<String>(
                                      isExpanded: true,
                                      hint: Text(
                                        'Gujarat',
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          letterSpacing: 0.sp,
                                          fontWeight: FontWeight.w400,
                                          height: 24.h / 14.sp,
                                          color: Colors.black,
                                        ),
                                      ),
                                      items: userInfoController.stateList
                                          .map((String item) =>
                                              DropdownMenuItem<String>(
                                                value: item,
                                                child: Text(
                                                  item,
                                                  style: TextStyle(
                                                    fontSize: 14.sp,
                                                    letterSpacing: 0.sp,
                                                    fontWeight: FontWeight.w400,
                                                    height: 24.h / 14.sp,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ))
                                          .toList(),
                                      value: userInfoController.selectedState,
                                      onChanged: (String? value) {
                                        userInfoController.onStateChange(value);
                                      },
                                      buttonStyleData: const ButtonStyleData(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 16),
                                        height: 40,
                                        width: 140,
                                      ),
                                      menuItemStyleData:
                                          const MenuItemStyleData(
                                        height: 40,
                                      ),
                                    ),
                                  ),
                                ),
                                label: "State",
                                placeholderText: "Karnataka",
                                validator: (v) {
                                  return null;
                                },
                                onChanged: (p0) {
                                  userInfoController.validateAddressInfo();
                                },
                              ),
                              SizedBox(height: 2.h),
                              InputWidget(
                                textEditingController:
                                    userInfoController.cityController,
                                inputWidgetHeight: 96.h,
                                textfieldheight: 48.h,
                                label: "City",
                                placeholderText: "Bangalore",
                                validator: (v) {
                                  return null;
                                },
                                onChanged: (p0) {
                                  userInfoController.validateAddressInfo();
                                },
                              ),
                              SizedBox(height: 40.h),
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
                        .validateAddressInfo()
                        .then((value) async {
                      if (value) {
                        await Get.delete<ResumeController>();
                        await userInfoController.addResume();
                        Navigator.pushNamedAndRemoveUntil(
                            context, HomeScreen.routeName, (route) => false);
                      }
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 16.w),
                    height: 48.h,
                    width: double.infinity,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: !userInfoController.validateUserAddressInfoForm
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
