import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get_it/get_it.dart';
import 'package:pokemon/application/base_classes/base_ui_classes.dart';
import 'package:pokemon/data/model/pokemon/pokemon.dart';
import 'package:pokemon/data/model/result/pokemon_name.dart';
import 'package:pokemon/presentation/bloc/pokemonsearch/pokemon_search_cubit.dart';
import 'package:pokemon/presentation/style/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pokemon/presentation/widgets/custom_pokemon.dart';
import 'package:pokemon/presentation/widgets/general_alert_dialog.dart';
import 'package:pokemon/presentation/widgets/pokeball_loader.dart';
import 'package:pokemon/utils/constants.dart';
import 'package:pokemon/utils/size_config.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BaseState<HomePage> {

  @override
  Color setBackgroundColor() => AppColors.white;

  final _cubit = GetIt.I<PokemonSearchCubit>();
  StreamSubscription? _streamSubscription;

  @override
  void initState() {
    super.initState();
    _streamSubscription = _cubit.stream.where((state) => state is ErrorSearchState).listen((state) {
      if((state as ErrorSearchState).message == Constants.existPokemon){
        _showError(context,AppLocalizations.of(context)!.exist, ()=> _cubit.getSavedPokemon());
      }else{
        _showError(context,AppLocalizations.of(context)!.exception, (){
            _cubit.getListPokemonNames();
            _cubit.getSavedPokemon();
        });
      }
    });

    _cubit.getListPokemonNames();
    _cubit.getSavedPokemon();
  }

  @override
  Widget bodyBuilder(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          color: AppColors.white,
          child: Image.asset(
            "assets/images/bg.png",
            fit: BoxFit.cover,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  AppLocalizations.of(context)!.homepage,
                  style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: AppColors.red
                  ),
                ),
              ),
            ),
            Flexible(child: _searchBuilder()),
            Flexible(
                flex: 8,
                child: _pokemonGridBuilder()
            ),
          ],
        ),
      ],
    );
  }

  Widget _searchBuilder(){
    return BlocBuilder<PokemonSearchCubit,PokemonSearchState>(
        bloc: _cubit,
        buildWhen: (prev,current) => current is PokemonSearchList,
        builder: (context, state){
          switch(state.runtimeType){
            case PokemonSearchInitial:
              return Container();
            case PokemonSearchList:
              List<PokemonName> list = (state as PokemonSearchList).list;
              return _searchField(list);
            default:
              return Container();
          }
        }
    );
  }

  Widget _searchField(List<PokemonName> list){
    return Container(
      padding: const EdgeInsets.all(16),
      child: TypeAheadField<PokemonName>(
          hideSuggestionsOnKeyboardHide: false,
          textFieldConfiguration: const TextFieldConfiguration(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(),
            ),
          ),
          scrollController: ScrollController(
              initialScrollOffset: 0.5
          ),
          itemBuilder: (context, suggestion) {
            return ListTile(
              leading: SizedBox(
                  width: 60,
                  height: 60,
                  child: Image.asset("assets/images/pokeball.png")
              ),
              title: Text(suggestion.name!),
            );
          },
          onSuggestionSelected: (suggestion){
            if (kDebugMode) {
              print("Select ${suggestion.name}");
            }
            _cubit.searchPokemon(suggestion.name!);
          },
          suggestionsCallback: (String query) async {
            if (query.length > 1){
              return List.of(list).where((pokemon){
                final pokemonLower = pokemon.name!.toLowerCase();
                final queryLower = query.toLowerCase();
                return pokemonLower.contains(queryLower);
              }).toList();
            }else{
              return [];
            }
          }
      ),
    );
  }

  Widget _pokemonGridBuilder(){
    return BlocBuilder(
        bloc: _cubit,
        builder: (context, state){
          switch(state.runtimeType){
            case PokemonSearchLoading:
              return const Center(
                  child: PokeballLoader());
            case PokemonResultList:
              List<Pokemon> list = (state as PokemonResultList).list;
              if(list.isEmpty) {
                return _emptyList();
              } else {
                return _pokemonList(list);
              }
            default:
              return Container();
          }
        }
    );
  }

  Widget _pokemonList(List<Pokemon> list){
    return GridView.builder(
        gridDelegate:  SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: SizeConfig.screenWidth / 2,
          childAspectRatio: 1,
        ),
        itemCount:  list.length,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index){
          var pokemon = list.elementAt(index);
          return CustomPokemon(pokemon: pokemon, index: index);
        }
    );
  }

  Widget _emptyList(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Image.asset(
              "assets/images/ash.png",
              fit: BoxFit.cover
          ),
        ),
        const SizedBox(height: 10,),
        Flexible(
          child: Text(
              AppLocalizations.of(context)!.empty,
            style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: AppColors.white
            ),
          ),
        )
      ],
    );
  }

  void _showError(BuildContext context, String message, Function() function){
    GeneralAlertDialog.show(
        context: context,
        title: AppLocalizations.of(context)!.errorTitle,
        message: message,
        buttonTxt: AppLocalizations.of(context)!.errorButton,
        onClick: function
    );
  }

  @override
  void dispose() {
    super.dispose();
    _streamSubscription?.cancel();
  }
}
