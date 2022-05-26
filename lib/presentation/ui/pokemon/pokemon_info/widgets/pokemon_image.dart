import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokechallenge/core/app_colors.dart';
import 'package:pokechallenge/core/utils/pokemon_color.dart';
import 'package:pokechallenge/domain/models/pokemon_form.dart';
import 'package:pokechallenge/domain/models/pokemon_species.dart';

class PokemonImage extends StatefulWidget {
  const PokemonImage({
    Key? key,
    required this.pokemonSpecies,
    required this.pokemonForm,
  }) : super(key: key);

  final PokemonSpecies pokemonSpecies;
  final PokemonForm pokemonForm;

  @override
  State<PokemonImage> createState() => _PokemonImageState();
}

class _PokemonImageState extends State<PokemonImage> {
  int _spriteSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 236,
      width: double.infinity,
      color: pokemonColor(
        widget.pokemonSpecies.colorName.name,
        Theme.of(context).brightness == Brightness.light,
      ).withOpacity(.5),
      child: Stack(
        children: [
          if (widget.pokemonSpecies.isLegendary)
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
                imageUrl: _spriteSelected == 0
                    ? widget.pokemonForm.sprites.frontDefault
                    : widget.pokemonForm.sprites.frontShiny,
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
                thumbColor: Theme.of(context).brightness == Brightness.light
                    ? AppColors.white100
                    : AppColors.black20.withOpacity(.5),
                groupValue: _spriteSelected,
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
                    _spriteSelected = value!;
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
    );
  }
}
