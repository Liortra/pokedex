import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pokemon/data/model/result/pokemon_name.dart';
import 'package:pokemon/utils/config.dart';

part 'result.g.dart';

@JsonSerializable(explicitToJson: true)
@HiveType(typeId: Config.hiveTypeResult)
class Result{
  @JsonKey(name: "results")
  @HiveField(0)
  final List<PokemonName>? names;

  Result(this.names);

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
  Map<String, dynamic> toJson() => _$ResultToJson(this);
}