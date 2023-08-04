import 'package:pokemon/data/model/pokemon/pokemon.dart';
import 'package:pokemon/data/model/result/pokemon_name.dart';
import 'package:pokemon/data/model/result/result.dart';

abstract class PokemonDataSourceLocal{
  Future<void> savePokemon(List<Pokemon> pokemon);

  Future<List<Pokemon>> loadPokemon();

  Future<bool> addPokemon(Pokemon pokemon);

  Future<void> deletePokemon(List<Pokemon> pokemon);

  Future<void> saveResult(List<PokemonName> result);

  Future<List<PokemonName>> getResults();
}

abstract class PokemonDataSourceRemote{
  Future<Pokemon> getPokemonByName(String name);

  Future<Result> getAllPokemon();
}