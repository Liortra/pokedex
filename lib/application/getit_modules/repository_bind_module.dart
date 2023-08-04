import 'package:get_it/get_it.dart';
import 'package:pokemon/data/source/pokemon/local/pokemon_local_repository.dart';
import 'package:pokemon/data/source/pokemon/pokemon_data_source.dart';
import 'package:pokemon/data/source/pokemon/pokemon_repository.dart';
import 'package:pokemon/data/source/pokemon/remote/pokemon_remote_repository.dart';

class RepositoryBindingModule {
  static providesModules() {
    _providePokemonRepositoryModule();
  }

  static void _providePokemonRepositoryModule() {
    GetIt.I.registerFactory<PokemonDataSourceRemote>(() => PokemonRemoteRepository(GetIt.I()));
    GetIt.I.registerLazySingleton<PokemonDataSourceLocal>(() => PokemonLocalRepository());
    GetIt.I.registerFactory<PokemonRepository>(() => PokemonRepository(GetIt.I.get(), GetIt.I.get()));
  }

}