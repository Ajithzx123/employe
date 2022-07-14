import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:zylu_task/Model/employe_Model.dart';
import 'package:zylu_task/view/HomeScreen.dart';

class EmployeController extends GetxController {
  var box = Hive.box<Employe>('employe');
  RxString value = "".obs;
  
  RxString? imagepath = "".obs;

  late TextEditingController nameController,
      ageController,
      experienceController;

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    ageController = TextEditingController();
    experienceController = TextEditingController();
    
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    nameController.dispose();
    ageController.dispose();
    experienceController.dispose();
  }

  void addItems() {
    box.add(Employe(
        imagepath: imagepath!.value.toString(),
        name: nameController.text,
        age: int.parse(ageController.text),
        experience: int.parse(experienceController.text),
        status: value.value));
        nameController.clear();
        ageController.clear();
        experienceController.clear();
        imagepath!.value = "";
        value.value ="";
        
    Get.to(()=> HomeScreen());
  }
}
