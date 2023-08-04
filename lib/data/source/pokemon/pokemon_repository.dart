import 'package:pokemon/data/model/pokemon/pokemon.dart';
import 'package:pokemon/data/model/result/pokemon_name.dart';
import 'package:pokemon/data/model/result/result.dart';
import 'package:pokemon/data/source/pokemon/pokemon_data_source.dart';

class PokemonRepository {
  final PokemonDataSourceLocal _local;
  final PokemonDataSourceRemote _remote;

  PokemonRepository(this._local, this._remote);

  Future<Pokemon> searchPokemon(String name) async{
    var pokemon = await _remote.getPokemonByName(name);
    return pokemon;
  }

  Future<bool> addPokemon(Pokemon pokemon) async{
    return await _local.addPokemon(pokemon);
  }

  Future<void> updatePokemon(Pokemon update, int index) async{
    var list = await _local.loadPokemon();
    list[index] = update;
    await _local.deletePokemon(list);
    await _local.savePokemon(list);
  }

  Future<List<Pokemon>> getAllSavedPokemon() async{
    var list = await _local.loadPokemon();
    return list;
  }

  Future<List<PokemonName>> getAllPokemon() async{
    List<PokemonName> list = await _local.getResults();
    if(list.isNotEmpty) {
      list.sort((a,b) => a.name!.compareTo(b.name!));
      return list;
    } else{
      Result result = await _remote.getAllPokemon();
      result.names?.sort((a,b) => a.name!.compareTo(b.name!));
      _local.saveResult(result.names!);
      return await _local.getResults();
    }
  }
}