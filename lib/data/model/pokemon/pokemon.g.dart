// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PokemonAdapter extends TypeAdapter<Pokemon> {
  @override
  final int typeId = 2;

  @override
  Pokemon read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Pokemon(
      fields[0] as String?,
      fields[1] as int?,
      fields[2] as Sprites?,
      (fields[3] as List?)?.cast<PokemonType>(),
    );
  }

  @override
  void write(BinaryWriter writer, Pokemon obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.weight)
      ..writeByte(2)
      ..write(obj.sprites)
      ..writeByte(3)
      ..write(obj.types);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PokemonAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pokemon _$PokemonFromJson(Map<String, dynamic> json) => Pokemon(
      json['name'] as String?,
      json['weight'] as int?,
      json['sprites'] == null
          ? null
          : Sprites.fromJson(json['sprites'] as Map<String, dynamic>),
      (json['types'] as List<dynamic>?)
          ?.map((e) => PokemonType.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PokemonToJson(Pokemon instance) => <String, dynamic>{
      'name': instance.name,
      'weight': instance.weight,
      'sprites': instance.sprites?.toJson(),
      'types': instance.types?.map((e) => e.toJson()).toList(),
    };
