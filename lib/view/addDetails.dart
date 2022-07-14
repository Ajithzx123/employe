import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';
import 'package:zylu_task/Model/employe_Model.dart';
import 'package:zylu_task/controller/employe_Controller.dart';
import 'package:zylu_task/view/HomeScreen.dart';
import 'package:zylu_task/view/Widgets/customButton.dart';
import 'package:zylu_task/view/Widgets/textfield.dart';

class AddDetails extends StatelessWidget {
  EmployeController controller = Get.put(EmployeController());
  AddDetails({Key? key}) : super(key: key);
  XFile? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(5.w),
        child: ListView(
          children: [
            Obx((() => controller.imagepath != ""
                ? CircleAvatar(
                    radius: 20.w,
                    backgroundColor: Colors.yellow,
                    backgroundImage: FileImage(
                      File(controller.imagepath!.value),
                    ),
                  )
                : Center(
                    child: Stack(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRBoxErh-NQl2NfpgZreigHy9RwMva6A9hQVQ&usqp=CAU",),
                          backgroundColor: Colors.white,
                          radius: 20.w,
                        ),
                        Positioned(
                          bottom: 1,
                          left: 55,
                          child: IconButton(
                            icon: Icon(
                              Icons.add_a_photo,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('choose any option'),
                                    actions: [
                                      TextButton(
                                          onPressed: () async {
                                            // Getimage(source: ImageSource.gallery);
                                            image = await ImagePicker()
                                                .pickImage(
                                                    source:
                                                        ImageSource.gallery);

                                            if (image != null) {
                                              controller.imagepath!.value =
                                                  image!.path;
                                            } else {
                                              return null;
                                            }
                                            Navigator.pop(context);
                                          },
                                          child: const Text('choose Image ')),
                                      TextButton(
                                          onPressed: () async {
                                            // Getimage(source: ImageSource.camera);
                                            image = await ImagePicker()
                                                .pickImage(
                                                    source: ImageSource.camera);

                                            if (image != null) {
                                              controller.imagepath!.value =
                                                  image!.path;
                                            }

                                            Navigator.pop(context);
                                          },
                                          child: Text('Take a Image '))
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ))),
            SizedBox(
              height: 5.h,
            ),
            CustomText(
                validator: (value) {},
                textinputaction: TextInputAction.next,
                textinputtype: TextInputType.emailAddress,
                obscure: false,
                controller: controller.nameController,
                hinttext: "Name",
                labeltext: "Name"),
            SizedBox(
              height: 3.h,
            ),
            CustomText(
                validator: (value) {},
                textinputaction: TextInputAction.next,
                textinputtype: TextInputType.number,
                obscure: false,
                controller: controller.ageController,
                hinttext: "Age",
                labeltext: "Age"),
            SizedBox(
              height: 3.h,
            ),
            CustomText(
                validator: (value) {},
                textinputaction: TextInputAction.done,
                textinputtype: TextInputType.number,
                obscure: false,
                controller: controller.experienceController,
                hinttext: "Experience",
                labeltext: "Experience"),
            SizedBox(
              height: 4.h,
            ),
            Text(
              "Employe Status",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.sp),
            ),
            Obx(() => Row(
                  children: [
                    Radio(
                        value: "ACTIVE",
                        groupValue: controller.value.value,
                        onChanged: (valuue) {
                          controller.value.value = valuue.toString();
                          print(controller.value);
                        }),
                    const Text("Active"),
                    Radio(
                        value: "NON-ACTIVE",
                        groupValue: controller.value.value,
                        onChanged: (valuue) {
                          controller.value.value = valuue.toString();
                          print(controller.value);
                        }),
                    const Text("Non-Active"),
                  ],
                )),
            SizedBox(
              height: 5.h,
            ),
            Button(
              ontap: () {
                controller.addItems();
              },
            ),
          ],
        ),
      )),
    );
  }

  Getimage({required ImageSource source}) async {
    image = await ImagePicker().pickImage(source: source);
    if (image != null) {
      controller.imagepath!.value = (image!.path);
    } else {
      return null;
    }
  }
}
