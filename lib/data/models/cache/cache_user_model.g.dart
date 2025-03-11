// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cache_user_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CacheUserModelAdapter extends TypeAdapter<CacheUserModel> {
  @override
  final int typeId = 0;

  @override
  CacheUserModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CacheUserModel(
      accessToken: fields[0] as String?,
      refreshToken: fields[1] as String?,
      id: fields[2] as int?,
      username: fields[3] as String?,
      email: fields[4] as String?,
      firstName: fields[5] as String?,
      lastName: fields[6] as String?,
      gender: fields[7] as String?,
      message: fields[9] as String?,
      image: fields[8] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, CacheUserModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.accessToken)
      ..writeByte(1)
      ..write(obj.refreshToken)
      ..writeByte(2)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.username)
      ..writeByte(4)
      ..write(obj.email)
      ..writeByte(5)
      ..write(obj.firstName)
      ..writeByte(6)
      ..write(obj.lastName)
      ..writeByte(7)
      ..write(obj.gender)
      ..writeByte(8)
      ..write(obj.image)
      ..writeByte(9)
      ..write(obj.message);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CacheUserModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
