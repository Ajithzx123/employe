// import 'package:cloud_firestore/cloud_firestore.dart';

// class EmployeModel {
//   String? name;
//   String? status;
//   int? age;
//   int? experience;
//   String? image;

//   EmployeModel({this.age, this.experience, this.image, this.name, this.status});

//   EmployeModel.fromMap(DocumentSnapshot data) {
//     name = data["name"];
//     age = data["age"];
//     status = data["status"];
//     experience = data["experience"];
//     image = data["image"];
//   }
// }

class EmployeModel {
  String? name;
  int? age;
  int? experience;
  String? status;
  String? image;

  EmployeModel({this.name, this.age, this.experience, this.status, this.image});

  EmployeModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    age = json['age'];
    experience = json['experience'];
    status = json['status'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['age'] = this.age;
    data['experience'] = this.experience;
    data['status'] = this.status;
    data['image'] = this.image;
    return data;
  }
}

