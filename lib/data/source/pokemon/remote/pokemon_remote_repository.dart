import 'package:pokemon/data/model/pokemon/pokemon.dart';
import 'package:pokemon/data/model/result/result.dart';
import 'package:pokemon/data/source/pokemon/api/pokemon_api.dart';
import 'package:pokemon/data/source/pokemon/pokemon_data_source.dart';

class PokemonRemoteRepository implements PokemonDataSourceRemote{
  final PokemonApi _pokemonApi;

  PokemonRemoteRepository(this._pokemonApi);

  @override
  Future<Pokemon> getPokemonByName(String name) {
    return _pokemonApi.getPokemonByName(name)
        .then((response) => response);
  }

  @override
  Future<Result> getAllPokemon(){
    return _pokemonApi.getAllPokemon().then((response) => response);
  }

}