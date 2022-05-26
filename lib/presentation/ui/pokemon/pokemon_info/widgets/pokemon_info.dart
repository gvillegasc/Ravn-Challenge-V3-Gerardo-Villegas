import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokechallenge/core/app_colors.dart';
import 'package:pokechallenge/core/extensions/string_extension.dart';
import 'package:pokechallenge/core/utils/pokemon_color.dart';
import 'package:pokechallenge/core/utils/pokemon_id.dart';
import 'package:pokechallenge/core/utils/pokemon_tag.dart';
import 'package:pokechallenge/domain/models/pokemon.dart';
import 'package:pokechallenge/presentation/blocs/pokemon_form/pokemon_form_bloc.dart';
import 'package:pokechallenge/presentation/blocs/pokemon_species/pokemon_species_bloc.dart';

class PokemonInfo extends StatefulWidget {
  const PokemonInfo({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  final Pokemon pokemon;

  @override
  State<PokemonInfo> createState() => _PokemonInfoState();
}

class _PokemonInfoState extends State<PokemonInfo> {
  late PokemonFormBloc pokemonFormBloc;
  @override
  void initState() {
    super.initState();
    final pokemonFormBloc = context.read<PokemonFormBloc>();
    pokemonFormBloc.add(OnGetPokemonForm(widget.pokemon.id));
    final pokemonFormSpecies = context.read<PokemonSpeciesBloc>();
    pokemonFormSpecies.add(OnGetPokemonSpecies(widget.pokemon.id));
  }

  int _sprite = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonSpeciesBloc, PokemonSpeciesState>(
      builder: (context, stateSpecies) {
        return BlocBuilder<PokemonFormBloc, PokemonFormState>(
            builder: (context, stateForm) {
          if (stateForm is LoadedPokemonForm &&
              stateSpecies is LoadedPokemonSpecies) {
            return Column(
              children: [
                Container(
                  height: 236,
                  width: double.infinity,
                  color: pokemonColor(
                    stateSpecies.pokemonSpecies.colorName.name,
                    Theme.of(context).brightness == Brightness.light,
                  ).withOpacity(.5),
                  child: Stack(
                    children: [
                      if (stateSpecies.pokemonSpecies.isLegendary)
                        Positioned(
                          top: 10,
                          right: 10,
                          child: Image.asset(
                            'assets/pages/icons/ic_legendary.png',
                            height: 40,
                          ),
                        ),
                      Positioned(
                        top: 20,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          alignment: Alignment.center,
                          child: CachedNetworkImage(
                            imageUrl: _sprite == 0
                                ? stateForm.pokemonForm.sprites.frontDefault
                                : stateForm.pokemonForm.sprites.frontShiny,
                            fit: BoxFit.cover,
                            height: 140,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 20,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          height: 60,
                          width: MediaQuery.of(context).size.width,
                          child: CupertinoSlidingSegmentedControl<int>(
                            backgroundColor:
                                Theme.of(context).brightness == Brightness.light
                                    ? AppColors.black60.withOpacity(0.15)
                                    : AppColors.black60,
                            thumbColor:
                                Theme.of(context).brightness == Brightness.light
                                    ? AppColors.white100
                                    : AppColors.black20.withOpacity(.5),
                            groupValue: _sprite,
                            children: {
                              0: Container(
                                margin: const EdgeInsets.symmetric(vertical: 8),
                                child: Text(
                                  'Default Sprite',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline2!
                                      .copyWith(fontWeight: FontWeight.w600),
                                ),
                              ),
                              1: Text(
                                'Shiny Sprite',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline2!
                                    .copyWith(fontWeight: FontWeight.w600),
                              ),
                            },
                            onValueChanged: (value) {
                              setState(() {
                                _sprite = value!;
                              });
                            },
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        child: Container(
                          height: 20,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Theme.of(context).backgroundColor,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Text(
                  '${pokemonId(widget.pokemon.id)} ${widget.pokemon.name.capitalize()}',
                  style: Theme.of(context).textTheme.headline5,
                ),
                _PokemonTypes(
                  types: widget.pokemon.types,
                ),
                const SizedBox(height: 10),
                Text(
                  generationValues.reverse[widget.pokemon.generation]!,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                const SizedBox(height: 10),
                Text(
                    stateSpecies.pokemonSpecies.flavorTextEntries[0].flavorText
                        .replaceAll('\n', ' '),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline1),
              ],
            );
          }
          return Container();
        });
      },
    );
  }
}

class _PokemonTypes extends StatefulWidget {
  const _PokemonTypes({
    Key? key,
    required this.types,
  }) : super(key: key);

  final List<Type> types;

  @override
  State<_PokemonTypes> createState() => _PokemonTypesState();
}

class _PokemonTypesState extends State<_PokemonTypes> {
  @override
  void initState() {
    super.initState();
  }

  List<Widget> _generateType() {
    final types = <Widget>[];
    for (var i = 0; i < widget.types.length; i++) {
      types.add(pokemonTag(widget.types[i].name));
    }
    return types;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _generateType(),
      ),
    );
  }
}
