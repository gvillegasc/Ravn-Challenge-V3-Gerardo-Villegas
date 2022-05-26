import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokechallenge/core/app_colors.dart';
import 'package:pokechallenge/core/extensions/string_extension.dart';
import 'package:pokechallenge/core/utils/pokemon_numeration.dart';
import 'package:pokechallenge/domain/models/evolution_chain.dart';
import 'package:pokechallenge/domain/models/pokemon.dart';

class EvolutionListItem extends StatelessWidget {
  const EvolutionListItem({
    Key? key,
    required this.pokemon,
    required this.evolution,
  }) : super(key: key);

  final Pokemon pokemon;
  final Chain evolution;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(vertical: 5),
      height: 110,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _EvolutionDetail(
            imageUrl: pokemon.sprites.frontDefault,
            pokemonName: pokemon.name,
            pokemonId: pokemon.id,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            child: const Center(
              child: Icon(
                Icons.arrow_forward,
                color: AppColors.black20,
                size: 25,
              ),
            ),
          ),
          _EvolutionDetail(
            imageUrl: evolution.species.spriteFront!,
            pokemonName: evolution.species.name!,
            pokemonId: evolution.species.id!,
          ),
        ],
      ),
    );
  }
}

class _EvolutionDetail extends StatelessWidget {
  const _EvolutionDetail({
    Key? key,
    required this.imageUrl,
    required this.pokemonName,
    required this.pokemonId,
  }) : super(key: key);

  final String imageUrl;
  final String pokemonName;
  final int pokemonId;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
          height: 67,
          width: 67,
          padding: const EdgeInsets.all(5),
          child: CachedNetworkImage(imageUrl: imageUrl),
        ),
        Text(
          pokemonName.capitalize(),
          style: Theme.of(context).textTheme.bodyText1,
        ),
        Text(
          pokemonNumeration(pokemonId),
          style: Theme.of(context).textTheme.bodyText2,
        ),
      ],
    );
  }
}
