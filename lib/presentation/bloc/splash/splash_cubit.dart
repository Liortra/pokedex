import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pokemon/data/source/pokemon/pokemon_repository.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<BaseSplashState> {
  final PokemonRepository _pokemonRepository;

  SplashCubit(this._pokemonRepository) : super(SplashInitial());

  void start() async{
    try{
      await _pokemonRepository.getAllPokemon();
      emit(NavigateMainPageState());
    }catch(e){
     emit(NavigateMainPageState());
    }
  }
}
