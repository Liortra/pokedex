import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pokemon/data/model/pokemon/sprites.dart';
import 'package:pokemon/data/model/pokemon/pokemon_type.dart';
import 'package:pokemon/utils/config.dart';
part 'pokemon.g.dart';

@JsonSerializable(explicitToJson: true)
@HiveType(typeId: Config.hiveTypePokemon)
class Pokemon {
  @JsonKey(name: "name")
  @HiveField(0)
  final String? name;
  @JsonKey(name: "weight")
  @HiveField(1)
  final int? weight;
  @JsonKey(name: "sprites")
  @HiveField(2)
  final Sprites? sprites;
  @JsonKey(name: "types")
  @HiveField(3)
  final List<PokemonType>? types;


  double get weightKg => (weight ?? 0) * 0.1;
  String? get image => sprites?.image;

  Pokemon(this.name, this.weight, this.sprites, this.types);

  factory Pokemon.fromJson(Map<String, dynamic> json) => _$PokemonFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonToJson(this);
}
