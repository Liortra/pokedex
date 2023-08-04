import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pokemon/data/model/pokemon/pokemon.dart';
import 'package:pokemon/presentation/bloc/pokemonsearch/pokemon_search_cubit.dart';
import 'package:pokemon/presentation/style/app_colors.dart';
import 'package:pokemon/utils/constants.dart';
import 'package:pokemon/utils/form_validator.dart';
import 'package:pokemon/utils/size_config.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomPokemon extends StatefulWidget {
  final Pokemon pokemon;
  final int index;
  const CustomPokemon({Key? key,
    required this.pokemon,
    required this.index
  }) : super(key: key);

  @override
  State<CustomPokemon> createState() => _CustomPokemonState();
}

class _CustomPokemonState extends State<CustomPokemon> {
  late int id;

  @override
  void initState() {
    id = 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    Color color;
    widget.pokemon.types?.first.type?.name != null ? color = AppColors.pokemonColor(widget.pokemon.types!.first.type!.name!) : color = AppColors.white;
    return GestureDetector(
      onTap: () => _editPopup(context),
      child: Card(
        elevation: 8,
        shadowColor: color,
        margin: const EdgeInsets.all(10),
        shape:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: color, width: 1)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Flexible(
                child: Text(
              "Pokemon: ${widget.pokemon.name!} - Weight: ${widget.pokemon.weightKg}",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: SizeConfig.fontSmall),
            )),
            Flexible(
                child: widget.pokemon.sprites?.image != null
                    ? Image.network(widget.pokemon.image!)
                    : Image.asset("assets/images/poke_ball_icon.png")),
            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: widget.pokemon.types!
                    .map((type) => _pokemonTypeView(type.type!.name!))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _editPopup(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    TextEditingController controller = TextEditingController();
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Stack(
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      _radioButton(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: controller,
                          validator: (value){
                            if(FormValidator.nameValidator(value!)){
                              return AppLocalizations.of(context)!.nameEmpty;
                            }
                          },
                          decoration: InputDecoration(
                              errorBorder:
                              const UnderlineInputBorder(borderSide: BorderSide(color: AppColors.grey)),
                              focusedErrorBorder:
                              const UnderlineInputBorder(borderSide: BorderSide(color: AppColors.grey)),
                              contentPadding: const EdgeInsets.only(top: 15),
                              hintText: id == 1 ? AppLocalizations.of(context)!.name : AppLocalizations.of(context)!.nickname,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: OutlinedButton(
                              child: Text(AppLocalizations.of(context)!.submit),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState?.save();
                                  Pokemon update = Pokemon(controller.text, widget.pokemon.weight, widget.pokemon.sprites, widget.pokemon.types);
                                  GetIt.I.get<PokemonSearchCubit>().updatePokemon(update, widget.index);
                                  Navigator.of(context).pop();
                                }
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: OutlinedButton(
                              child: Text(AppLocalizations.of(context)!.cancel),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  Widget _radioButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Radio(
            value: 0,
            groupValue: id,
            onChanged: (val) {
              setState(() {
                id = 1;
              });
            }),
        Text(AppLocalizations.of(context)!.name),
        Radio(
            value: 1,
            groupValue: id,
            onChanged: (val) {
              setState(() {
                id = 2;
              });
            }),
        Text(AppLocalizations.of(context)!.nickname),
      ],
    );
  }

  Widget _pokemonTypeView(String type) {
    Color color = AppColors.pokemonColor(type);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.all(Radius.circular(8))),
        child: Text(
          type.toUpperCase(),
          style: TextStyle(
              color: AppColors.white,
              fontWeight: FontWeight.bold,
              fontSize: SizeConfig.fontSmall),
        ),
      ),
    );
  }
}
