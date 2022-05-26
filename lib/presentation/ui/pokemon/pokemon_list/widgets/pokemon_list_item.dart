import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokechallenge/core/extensions/string_extension.dart';
import 'package:pokechallenge/core/utils/id_pokemon.dart';
import 'package:pokechallenge/core/utils/type_pokemon_icon.dart';
import 'package:pokechallenge/domain/models/pokemon.dart';
import 'package:pokechallenge/presentation/routes/app_routes.dart';

class PokemonListItem extends StatelessWidget {
  const PokemonListItem({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          AppRoutes.pokemonInfo,
          arguments: pokemon,
        );
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        margin: const EdgeInsets.symmetric(vertical: 2),
        height: 90,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Card(
                child: Container(
                  padding: const EdgeInsets.only(left: 45, right: 10),
                  width: double.infinity,
                  height: 90,
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            pokemon.name.capitalize(),
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            idPokemon(pokemon.id),
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                      _PokemonTypes(types: pokemon.types)
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              top: 6,
              child: SizedBox(
                height: 78,
                width: 78,
                child: CachedNetworkImage(
                  imageUrl: pokemon.sprites.frontDefault,
                  fit: BoxFit.cover,
                ),
              ),
            )
          ],
        ),
      ),
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
      types.add(typePokemonIcon(widget.types[i].name));
    }
    return types;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: _generateType(),
        ),
      ),
    );
  }
}
