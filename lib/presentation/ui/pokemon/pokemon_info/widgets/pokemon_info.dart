import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokechallenge/domain/models/pokemon.dart';
import 'package:pokechallenge/presentation/blocs/pokemon_form/pokemon_form_bloc.dart';

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
    final bloc = context.read<PokemonFormBloc>();
    bloc.add(OnGetPokemonForm(widget.pokemon.id));
  }

  int _sprite = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 226,
          width: double.infinity,
          color: Colors.red,
          child: BlocBuilder<PokemonFormBloc, PokemonFormState>(
              builder: (context, state) {
            if (state is LoadedPokemonForm) {
              return Stack(
                children: [
                  Positioned(
                    top: 20,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.center,
                      child: CachedNetworkImage(
                        imageUrl: _sprite == 0
                            ? state.pokemonForm.sprites.frontDefault
                            : state.pokemonForm.sprites.frontShiny,
                        fit: BoxFit.cover,
                        height: 140,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    child: Container(
                      color: Colors.red,
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      child: CupertinoSlidingSegmentedControl<int>(
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
              );
            }
            return Container();
          }),
        ),
        Text(
          '#001 Bulbasaur',
          style: Theme.of(context).textTheme.headline5,
        )
      ],
    );
  }
}
