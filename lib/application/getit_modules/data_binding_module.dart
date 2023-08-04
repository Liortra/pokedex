import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pokemon/data/model/pokemon/pokemon.dart';
import 'package:pokemon/data/model/pokemon/pokemon_type.dart';
import 'package:pokemon/data/model/pokemon/sprites.dart';
import 'package:pokemon/data/model/result/pokemon_name.dart';
import 'package:pokemon/data/model/result/result.dart';

class DataBindingModule{

  static providesModules() async{
    await _providesLocalStorage();
  }

  static _providesLocalStorage() async{
    await Hive.initFlutter();
    Hive.registerAdapter(PokemonAdapter());
    Hive.registerAdapter(PokemonTypeAdapter());
    Hive.registerAdapter(PokemonTypeInfoAdapter());
    Hive.registerAdapter(SpritesAdapter());
    Hive.registerAdapter(PokemonNameAdapter());
    Hive.registerAdapter(ResultAdapter());
  }
}