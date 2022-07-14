// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employe_Model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EmployeAdapter extends TypeAdapter<Employe> {
  @override
  final int typeId = 0;

  @override
  Employe read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Employe(
      name: fields[0] as String,
      age: fields[1] as int,
      experience: fields[2] as int,
      status: fields[4] as String,
      imagepath: fields[3] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, Employe obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.age)
      ..writeByte(2)
      ..write(obj.experience)
      ..writeByte(3)
      ..write(obj.imagepath)
      ..writeByte(4)
      ..write(obj.status);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EmployeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
