import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../main.dart';

class UserInfoController extends GetxController {
  TextEditingController fullNameController = TextEditingController();
  bool validateUserBasicInfoForm = false;
  bool validateUserAddressInfoForm = false;
  String email = box.read('email') ?? "";
  late TextEditingController phoneNumberController = TextEditingController();
  late TextEditingController emailController =
      TextEditingController(text: email);
  TextEditingController addressController = TextEditingController();
  TextEditingController zipCodeController = TextEditingController();
  TextEditingController countryController =
      TextEditingController(text: "India");
  TextEditingController stateController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  List<String> stateList = [
    "Andhra Pradesh",
    "Arunachal Pradesh ",
    "Assam",
    "Bihar",
    "Chhattisgarh",
    "Goa",
    "Gujarat",
    "Haryana",
    "Himachal Pradesh",
    "Jammu and Kashmir",
    "Jharkhand",
    "Karnataka",
    "Kerala",
    "Madhya Pradesh",
    "Maharashtra",
    "Manipur",
    "Meghalaya",
    "Mizoram",
    "Nagaland",
    "Odisha",
    "Punjab",
    "Rajasthan",
    "Sikkim",
    "Tamil Nadu",
    "Telangana",
    "Tripura",
    "Uttar Pradesh",
    "Uttarakhand",
    "West Bengal",
    "Andaman and Nicobar Islands",
    "Chandigarh",
    "Dadra and Nagar Haveli",
    "Daman and Diu",
    "Lakshadweep",
    "National Capital Territory of Delhi",
    "Puducherry"
  ];
  String selectedState = "Gujarat";
  List resumeList = box.read('resumeList') ?? [];
  String? firstName;

  @override
  void onInit() {
    super.onInit();
  }

  Future<bool> validateBasicInfo() async {
    validateUserBasicInfoForm = fullNameController.text.isNotEmpty &&
        phoneNumberController.text.isNotEmpty &&
        emailController.text.isEmail;

    var name = fullNameController.text.split(" ");
    firstName = name[0];
    update();
    return validateUserBasicInfoForm;
  }

  Future<bool> validateAddressInfo() async {
    validateUserAddressInfoForm = addressController.text.isNotEmpty &&
        zipCodeController.text.isNotEmpty &&
        countryController.text.isNotEmpty &&
        selectedState.isNotEmpty &&
        cityController.text.isNotEmpty;
    return validateUserAddressInfoForm;
  }

  onStateChange(v) {
    selectedState = v;
    update();
  }

  addResume() async {
    var date = DateFormat.yMMMd().format(DateTime.now());
    // var resume = {
    //   'id': resumeList.length,
    //   'name': firstName,
    //   'date': date
    // };
    var resume = {
      'id': resumeList.length,
      'name': firstName,
      "personalInfo": {
        'name': firstName,
        'fullName': fullNameController.text,
        "mobileNumber": phoneNumberController.text,
        "email": emailController.text
      },
      "address": {
        'address': addressController.text,
        'zipCode': zipCodeController.text,
        "country": countryController.text,
        "state": stateController.text,
        "city": cityController.text
      },
      "date": date
    };
    resumeList.add(resume);
    update();

    await box.write("resumeList", resumeList);
  }
}
