import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:zylu_task/Model/Employe_firebase_model.dart';
import 'package:zylu_task/Model/employe_Model.dart';
import 'package:zylu_task/view/HomeScreen.dart';

class EmployeController extends GetxController {
  var box = Hive.box<Employe>('employe');
  RxString value = "".obs;

  RxString? imagepath = "".obs;

  late TextEditingController nameController,
      ageController,
      experienceController;

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  late CollectionReference collectionReference;

  RxList employe = <EmployeModel>[].obs;

  @override
  void onInit() async {
    super.onInit();
    nameController = TextEditingController();
    ageController = TextEditingController();
    experienceController = TextEditingController();

    collectionReference = await firebaseFirestore.collection("employes");
    fetchdata();
  }

  fetchdata() async {
    var records = await FirebaseFirestore.instance.collection("employes").get();
    maprecords(records);
  }

  maprecords(QuerySnapshot<Map<String, dynamic>> records) {
    var list = records.docs
        .map((item) => EmployeModel(
            age: item["age"],
            experience: item["experience"],
            image: item["image"],
            name: item["name"],
            status: item["status"]))
        .toList();

    employe.value = list;
  }

  @override
  void onClose() {
    super.onClose();
    nameController.dispose();
    ageController.dispose();
    experienceController.dispose();
  }

  void addItems() {
    // box.add(Employe(
    //     imagepath: imagepath!.value.toString(),
    //     name: nameController.text,
    //     age: int.parse(ageController.text),
    //     experience: int.parse(experienceController.text),
    //     status: value.value));

    collectionReference.add({
      'name': nameController.text,
      'age': int.parse(ageController.text),
      'experience': int.parse(experienceController.text),
      'status': value.value,
      'image': imagepath!.value.toString(),
    }).whenComplete(
      () {
        fetchdata();
        clearTextediting();
        Get.to(() => HomeScreen());
        Get.snackbar("Success", "Employee Added Successfully",
            backgroundColor: Colors.green);
      },
    ).catchError((error) {
      Get.snackbar("Error", "Something went wrong",
          backgroundColor: Colors.red);
    });
  }

  void clearTextediting() {
    nameController.clear();
    ageController.clear();
    experienceController.clear();
    imagepath!.value = "";
    value.value = "";
  }
}
