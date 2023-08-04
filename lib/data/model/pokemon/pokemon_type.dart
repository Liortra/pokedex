import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pokemon/utils/config.dart';
part 'pokemon_type.g.dart';

@JsonSerializable(explicitToJson: true)
@HiveType(typeId: Config.hiveTypePokemonType)
class PokemonType {

  @JsonKey(name: "type")
  @HiveField(0)
  final PokemonTypeInfo? type;

  PokemonType(this.type);

  factory PokemonType.fromJson(Map<String, dynamic> json) => _$PokemonTypeFromJson(json);
  Map<String, dynamic> toJson() => _$PokemonTypeToJson(this);
}

@JsonSerializable()
@HiveType(typeId: Config.hiveTypePokemonTypeInfo)
class PokemonTypeInfo {
  @JsonKey(name: "name")
  @HiveField(0)
  final String? name;

  PokemonTypeInfo(this.name);

  factory PokemonTypeInfo.fromJson(Map<String, dynamic> json) => _$PokemonTypeInfoFromJson(json);
  Map<String, dynamic> toJson() => _$PokemonTypeInfoToJson(this);
}