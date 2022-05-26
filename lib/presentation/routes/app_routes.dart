import 'package:flutter/material.dart';
import 'package:pokechallenge/domain/models/pokemon.dart';
import 'package:pokechallenge/presentation/ui/pokemon/pokemon_info/pokemon_info_page.dart';
import 'package:pokechallenge/presentation/ui/pokemon/pokemon_list/pokemon_list_page.dart';

class AppRoutes {
  static const String pokemonList = '/';
  static const String pokemonInfo = '/pokemonInfo';
}

Route<dynamic>? generateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.pokemonList:
      return MaterialPageRoute<void>(
        builder: (_) => const PokemonListPage(),
      );
    case AppRoutes.pokemonInfo:
      final pokemon = settings.arguments! as Pokemon;
      return MaterialPageRoute<void>(
        builder: (_) => PokemonInfoPage(pokemon: pokemon),
      );
    default:
      return null;
  }
}

const String appInitialRoute = AppRoutes.pokemonList;
