// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_name.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PokemonNameAdapter extends TypeAdapter<PokemonName> {
  @override
  final int typeId = 1;

  @override
  PokemonName read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PokemonName(
      fields[0] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, PokemonName obj) {
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
      other is PokemonNameAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonName _$PokemonNameFromJson(Map<String, dynamic> json) => PokemonName(
      json['name'] as String?,
    );

Map<String, dynamic> _$PokemonNameToJson(PokemonName instance) =>
    <String, dynamic>{
      'name': instance.name,
    };
