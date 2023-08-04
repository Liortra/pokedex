part of 'pokemon_search_cubit.dart';

@immutable
abstract class PokemonSearchState {}

class PokemonSearchInitial extends PokemonSearchState {}
class PokemonSearchLoading extends PokemonSearchState{}
class PokemonSearchList extends PokemonSearchState {
  final List<PokemonName> list;
  PokemonSearchList(this.list);
}
class PokemonResultList extends PokemonSearchState{
  final List<Pokemon> list;
  PokemonResultList(this.list);
}
class ErrorSearchState extends PokemonSearchState{
  final String message;
  final dynamic error;

  ErrorSearchState(this.message, this.error);
}
