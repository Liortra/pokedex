import 'package:pokemon/data/model/pokemon/pokemon.dart';
import 'package:pokemon/data/model/result/result.dart';
import 'package:pokemon/utils/config.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';

part 'pokemon_api.g.dart';

@RestApi()
abstract class PokemonApi{
  factory PokemonApi(Dio dio, {String baseUrl}) = _PokemonApi;

  @GET("${Config.specificPokemonEndPoint}{name}")
  Future<Pokemon> getPokemonByName(@Path("name") String name);

  @GET(Config.allPokemonEndPoint)
  Future<Result> getAllPokemon();

}