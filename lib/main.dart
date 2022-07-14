import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:zylu_task/Model/employe_Model.dart';
import 'package:zylu_task/view/HomeScreen.dart';

void main(List<String> args) async {
 
   WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(EmployeAdapter());
  await Hive.openBox<Employe>('employe');
  // Hive.box<Employe>("employe").clear();
   runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
         return  GetMaterialApp(
          debugShowCheckedModeBanner: false,
          home:  HomeScreen(),
         );
      });
     
  }
}