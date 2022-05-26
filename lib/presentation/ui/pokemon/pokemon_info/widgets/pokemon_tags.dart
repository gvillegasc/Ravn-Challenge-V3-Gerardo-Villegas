import 'package:flutter/material.dart';
import 'package:pokechallenge/core/utils/pokemon_tag.dart';
import 'package:pokechallenge/domain/models/pokemon.dart';

class PokemonTags extends StatefulWidget {
  const PokemonTags({
    Key? key,
    required this.types,
  }) : super(key: key);

  final List<PokemonType> types;

  @override
  State<PokemonTags> createState() => PokemonTagsState();
}

class PokemonTagsState extends State<PokemonTags> {
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
