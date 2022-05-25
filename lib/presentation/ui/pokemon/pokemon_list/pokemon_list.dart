import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokechallenge/injection/injection.dart';
import 'package:pokechallenge/presentation/blocs/pokemon_list/pokemon_list_bloc.dart';

class PokemonListPage extends StatelessWidget {
  const PokemonListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<PokemonListBloc>(),
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 110,
              centerTitle: false,
              collapsedHeight: 100,
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
            ),
          ],
        ),
      ),
    );
  }
}
