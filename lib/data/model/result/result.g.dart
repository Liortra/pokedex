// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ResultAdapter extends TypeAdapter<Result> {
  @override
  final int typeId = 0;

  @override
  Result read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Result(
      (fields[0] as List?)?.cast<PokemonName>(),
    );
  }

  @override
  void write(BinaryWriter writer, Result obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.names);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ResultAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      (json['results'] as List<dynamic>?)
          ?.map((e) => PokemonName.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'results': instance.names?.map((e) => e.toJson()).toList(),
    };
