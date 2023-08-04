// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sprites.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SpritesAdapter extends TypeAdapter<Sprites> {
  @override
  final int typeId = 3;

  @override
  Sprites read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Sprites(
      fields[0] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Sprites obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SpritesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Sprites _$SpritesFromJson(Map<String, dynamic> json) => Sprites(
      json['front_default'] as String?,
    );

Map<String, dynamic> _$SpritesToJson(Sprites instance) => <String, dynamic>{
      'front_default': instance.image,
    };
