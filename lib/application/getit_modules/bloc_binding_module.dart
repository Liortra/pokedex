import 'package:get_it/get_it.dart';
import 'package:pokemon/presentation/bloc/pokemonsearch/pokemon_search_cubit.dart';
import 'package:pokemon/presentation/bloc/splash/splash_cubit.dart';

class BlocBindingModule {
  static providesModules(){
    GetIt.I.registerFactory(() => PokemonSearchCubit(GetIt.I()));

    GetIt.I.registerFactory(() => SplashCubit(GetIt.I()));
  }
}