import 'package:hive_flutter/hive_flutter.dart';
import 'package:pokemon/data/dataproviders/local_database_manager.dart';
import 'package:pokemon/data/model/pokemon/pokemon.dart';
import 'package:pokemon/data/model/result/pokemon_name.dart';
import 'package:pokemon/data/model/result/result.dart';
import 'package:pokemon/data/source/pokemon/pokemon_data_source.dart';
import 'package:pokemon/utils/constants.dart';


class PokemonLocalRepository implements PokemonDataSourceLocal{

  List<Pokemon> _pokemonCache = [];
  List<PokemonName> _searchPokemon = [];

  @override
  Future<List<Pokemon>> loadPokemon() async{
    if(_pokemonCache.isEmpty) {
      Box box = await LocalDatabaseManager.openBox(Constants.boxPokemon);
      if(box.isNotEmpty) {
        _pokemonCache = box.values.cast<Pokemon>().toList();
      }
    }
    return _pokemonCache;
  }

  @override
  Future<void> savePokemon(List<Pokemon> pokemon) async{
    Box box = await LocalDatabaseManager.openBox(Constants.boxPokemon);
    box.addAll(pokemon);
    _pokemonCache = pokemon;
  }

  @override
  Future<void> deletePokemon(List<Pokemon> pokemon) async{
    Box box = await LocalDatabaseManager.getBox(Constants.boxPokemon);
    box.deleteAll(pokemon);
  }

  @override
  Future<bool> addPokemon(Pokemon pokemon) async{
    bool flag = true; // true - pokemon added to list
    for (var pokemonCache in _pokemonCache) {
      if(pokemon.image == pokemonCache.image){
        flag = false;
        break;
      }
    }
    if(flag){
      Box box = await LocalDatabaseManager.openBox(Constants.boxPokemon);
      box.add(pokemon);
      _pokemonCache.add(pokemon);
    }
    return flag;
  }

  @override
  Future<List<PokemonName>> getResults() async{
    if(_searchPokemon.isEmpty) {
      Box box = await LocalDatabaseManager.openBox(Constants.boxResult);
      if(box.isNotEmpty) {
        _searchPokemon = box.values.cast<PokemonName>().toList();
      }
    }
    return _searchPokemon;
  }

  @override
  Future<void> saveResult(List<PokemonName> result) async {
    Box box = await LocalDatabaseManager.openBox(Constants.boxResult);
    box.addAll(result);
    _searchPokemon = result;
  }
}