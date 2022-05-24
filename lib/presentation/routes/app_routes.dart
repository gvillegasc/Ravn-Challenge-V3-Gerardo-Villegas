import 'package:flutter/material.dart';
import 'package:pokechallenge/presentation/ui/pokemon/pokemon_list/pokemon_list.dart';

class AppRoutes {
  static const String pokemonList = '/';
}

Route<dynamic>? generateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.pokemonList:
      return MaterialPageRoute<void>(
        builder: (_) => const PokemonListPage(),
      );
    default:
      return null;
  }
}

const String appInitialRoute = AppRoutes.pokemonList;
