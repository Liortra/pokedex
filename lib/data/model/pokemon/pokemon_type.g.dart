// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_type.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PokemonTypeAdapter extends TypeAdapter<PokemonType> {
  @override
  final int typeId = 4;

  @override
  PokemonType read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PokemonType(
      fields[0] as PokemonTypeInfo?,
    );
  }

  @override
  void write(BinaryWriter writer, PokemonType obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PokemonTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PokemonTypeInfoAdapter extends TypeAdapter<PokemonTypeInfo> {
  @override
  final int typeId = 5;

  @override
  PokemonTypeInfo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PokemonTypeInfo(
      fields[0] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, PokemonTypeInfo obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PokemonTypeInfoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonType _$PokemonTypeFromJson(Map<String, dynamic> json) => PokemonType(
      json['type'] == null
          ? null
          : PokemonTypeInfo.fromJson(json['type'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PokemonTypeToJson(PokemonType instance) =>
    <String, dynamic>{
      'type': instance.type?.toJson(),
    };

PokemonTypeInfo _$PokemonTypeInfoFromJson(Map<String, dynamic> json) =>
    PokemonTypeInfo(
      json['name'] as String?,
    );

Map<String, dynamic> _$PokemonTypeInfoToJson(PokemonTypeInfo instance) =>
    <String, dynamic>{
      'name': instance.name,
    };
