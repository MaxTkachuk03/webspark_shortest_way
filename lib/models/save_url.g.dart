// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_url.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SaveURLAdapter extends TypeAdapter<SaveURL> {
  @override
  final int typeId = 1;

  @override
  SaveURL read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SaveURL(
      url: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SaveURL obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.url);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SaveURLAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
