import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pokemon/utils/config.dart';
part 'pokemon_name.g.dart';

@JsonSerializable()
@HiveType(typeId: Config.hiveTypePokemonName)
class PokemonName{

  @JsonKey(name: "name")
  @HiveField(0)
  final String? name;

  PokemonName(this.name);

  factory PokemonName.fromJson(Map<String, dynamic> json) => _$PokemonNameFromJson(json);
  Map<String, dynamic> toJson() => _$PokemonNameToJson(this);
}