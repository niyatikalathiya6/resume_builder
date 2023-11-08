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

  onReorder(oldIndex, newIndex) async {
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    var oResume = resumeList[oldIndex];
    resumeList[oldIndex] = resumeList[newIndex];
    resumeList[newIndex] = oResume;
    await box.write("resumeList", resumeList);

    update();
  }
}
