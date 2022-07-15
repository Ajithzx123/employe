import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:zylu_task/Model/Employe_firebase_model.dart';
import 'package:zylu_task/Model/employe_Model.dart';
import 'package:zylu_task/controller/employe_Controller.dart';
import 'package:zylu_task/view/addDetails.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

 
  // List<Employe> details = Hive.box<Employe>('employe').values.toList();

 

  @override
  Widget build(BuildContext context) {
    EmployeController controller = Get.put(EmployeController());
    // print(details.length);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(20.h),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          toolbarHeight: 20.h,
          title: Text(
            "Employe Details",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 23.sp),
          ),
          centerTitle: true,
        ),
      ),
      body: Obx((() => controller.employe.isEmpty
          ? Center(
              child: Text(
              "Add Employe Details",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
            ))
          : ListView.separated(
              separatorBuilder: ((context, index) {
                return SizedBox(
                  height: 2.h,
                );
              }),
              itemCount: controller.employe.length,
              padding: EdgeInsets.all(3.w),
              itemBuilder: (context, index) {
                return Container(
                  height: 12.h,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 230, 230, 230),
                      borderRadius: BorderRadius.circular(10.w)),
                  child: ListTile(
                      leading: Padding(
                        padding: EdgeInsets.only(top: 5),
                        child: CircleAvatar(
                          radius: 10.w,
                          backgroundImage:
                              FileImage(File(controller.employe[index].image!)),
                        ),
                      ),
                      title: Padding(
                        padding: EdgeInsets.only(bottom: 1.h, top: 2.h),
                        child: Text(
                          controller.employe[index].name!,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15.sp),
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Age : ${controller.employe[index].age}"),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                              "Experience : ${controller.employe[index].experience} years"),
                          SizedBox(
                            height: 3,
                          ),
                          Text("Status : ${controller.employe[index].status}"),
                        ],
                      ),
                      trailing: Padding(
                        padding: EdgeInsets.only(top: 2.5.h),
                        child: Column(
                          children: [
                            if (controller.employe[index].status == "ACTIVE" &&
                                controller.employe[index].experience >= 5)
                              Icon(
                                Icons.flag,
                                color: Colors.green,
                                size: 20.sp,
                              )
                          ],
                        ),
                      )),
                );
              }))),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_outlined),
        onPressed: () {
          Get.to(AddDetails());
        },
      ),
    );
  }
}
