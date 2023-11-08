import 'package:get/get.dart';
import 'package:resume_builder/Models/resume_model.dart';

import '../main.dart';

class ResumeController extends GetxController {
  List resumeList = box.read('resumeList') ?? [];

  @override
  void onInit() {
    print("List is $resumeList");
    // TODO: implement onInit
    super.onInit();
  }

  deleteResume(index) async {
    resumeList.removeAt(index);
    await box.write("resumeList", resumeList);
    resumeList = box.read('resumeList') ?? [];
    update();
  }
}
