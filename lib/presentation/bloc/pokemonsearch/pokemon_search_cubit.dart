import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pokemon/data/model/pokemon/pokemon.dart';
import 'package:pokemon/data/model/result/pokemon_name.dart';
import 'package:pokemon/data/source/pokemon/pokemon_repository.dart';
import 'package:pokemon/utils/constants.dart';

part 'pokemon_search_state.dart';

class PokemonSearchCubit extends Cubit<PokemonSearchState> {

  final PokemonRepository _pokemonRepository;

  PokemonSearchCubit(this._pokemonRepository) : super(PokemonSearchInitial());

  searchPokemon(String name) async{
    try{
      emit(PokemonSearchLoading());
      var pokemon = await _pokemonRepository.searchPokemon(name);
      if(await _pokemonRepository.addPokemon(pokemon)){
        var list = await _pokemonRepository.getAllSavedPokemon();
        emit(PokemonResultList(list));
      }else{
        emit(ErrorSearchState(Constants.existPokemon,false));
      }
    }catch(e){
      emit(ErrorSearchState(Constants.exception,e.toString()));
    }
  }

  getListPokemonNames() async{
    try{
      emit(PokemonSearchLoading());
      var list = await _pokemonRepository.getAllPokemon();
      emit(PokemonSearchList(list));
    }catch(e){
      emit(ErrorSearchState(Constants.exception,e.toString()));
    }
  }

  getSavedPokemon() async{
    try{
      emit(PokemonSearchLoading());
      var list = await _pokemonRepository.getAllSavedPokemon();
      emit(PokemonResultList(list));
    }catch(e){
      emit(ErrorSearchState(Constants.exception,e.toString()));
    }
  }

  updatePokemon(Pokemon update, int index) async{
    try{
      emit(PokemonSearchLoading());
      await _pokemonRepository.updatePokemon(update, index);
      var list = await _pokemonRepository.getAllSavedPokemon();
      emit(PokemonResultList(list));
    }catch(e){
      emit(ErrorSearchState(Constants.exception,e.toString()));
    }
  }
}
