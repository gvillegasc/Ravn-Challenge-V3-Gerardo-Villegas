import 'package:flutter/material.dart';
import 'package:pokechallenge/core/app_colors.dart';
import 'package:pokechallenge/domain/models/pokemon.dart';
import 'package:pokechallenge/presentation/ui/pokemon/pokemon_info/widgets/pokemon_info.dart';

class PokemonInfoPage extends StatelessWidget {
  const PokemonInfoPage({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.blue50,
          ),
        ),
        title: Text(
          'Pokemon Info',
          style: Theme.of(context).textTheme.headline2!.copyWith(
                fontWeight: FontWeight.w600,
              ),
        ),
      ),
      body: PokemonInfo(pokemon: pokemon),
    );
  }
}
