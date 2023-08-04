import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pokemon/utils/config.dart';
part 'sprites.g.dart';

@JsonSerializable()
@HiveType(typeId: Config.hiveTypeSprites)
class Sprites {

  @JsonKey(name: "front_default")
  @HiveField(0)
  final String? image;

  Sprites(this.image);

  factory Sprites.fromJson(Map<String, dynamic> json) => _$SpritesFromJson(json);
  Map<String, dynamic> toJson() => _$SpritesToJson(this);
}