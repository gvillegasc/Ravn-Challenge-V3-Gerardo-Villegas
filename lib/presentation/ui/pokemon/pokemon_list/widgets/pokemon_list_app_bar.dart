import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PokemonListAppBar extends StatelessWidget {
  const PokemonListAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 110,
      collapsedHeight: 110,
      centerTitle: false,
      title: Column(
        children: [
          Text(
            'Pokemon List',
            style: Theme.of(context).textTheme.headline6,
          ),
        ],
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(0.0),
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 15,
          ),
          height: 60,
          child: CupertinoSearchTextField(
            onChanged: (value) {},
            onSubmitted: (value) {},
          ),
        ),
      ),
    );
  }
}
