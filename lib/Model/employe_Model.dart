import 'package:hive/hive.dart';
part 'employe_Model.g.dart';


@HiveType(typeId: 0)
class Employe extends HiveObject {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final int age;

  @HiveField(2)
  final int experience;

  @HiveField(3)
  final dynamic imagepath;

  @HiveField(4)
  final String status;

  Employe(
      {required this.name,
      required this.age,
      required this.experience,
      required this.status,
     required this.imagepath});
}
