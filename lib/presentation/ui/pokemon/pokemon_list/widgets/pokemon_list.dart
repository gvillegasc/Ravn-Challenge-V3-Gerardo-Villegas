import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:pokechallenge/core/app_colors.dart';
import 'package:pokechallenge/domain/models/pokemon.dart';
import 'package:pokechallenge/presentation/blocs/pokemon_list/pokemon_list_bloc.dart';
import 'package:pokechallenge/presentation/ui/pokemon/pokemon_list/widgets/pokemon_list_empty.dart';
import 'package:pokechallenge/presentation/ui/pokemon/pokemon_list/widgets/pokemon_list_item.dart';
import 'package:pokechallenge/presentation/ui/widgets/container_loading.dart';

class PokemonList extends StatefulWidget {
  const PokemonList({Key? key}) : super(key: key);

  @override
  State<PokemonList> createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  @override
  void initState() {
    super.initState();
    final bloc = context.read<PokemonListBloc>();
    bloc.add(const OnGetPokemonList());
  }

  Widget _buildPokemonList(List<Pokemon> pokemonList) {
    final sectionList = <Widget>[];
    for (var generation in Generation.values) {
      final pokemons = pokemonList
          .where((element) => element.generation == generation)
          .toList();
      if (pokemons.isNotEmpty) {
        sectionList.add(
          SliverStickyHeader(
            header: Container(
              height: 65,
              color: Theme.of(context).backgroundColor,
              padding: const EdgeInsets.only(
                top: 20,
                left: 16,
                right: 16,
              ),
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    generationValues.reverse[generation]!,
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  const Divider(height: 1.5),
                ],
              ),
            ),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, i) => PokemonListItem(pokemon: pokemons[i]),
                childCount: pokemons.length,
              ),
            ),
          ),
        );
      }
    }
    return Container(
      color: Theme.of(context).backgroundColor,
      child: CustomScrollView(
        slivers: sectionList,
      ),
    );
  }

  void _loadErrorPokemonList() {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text(
            'There was an Error',
            style: Theme.of(context).textTheme.bodyText2,
          ),
          content: Text(
            'Failed to Load Data',
            style: Theme.of(context).textTheme.headline1,
          ),
          actions: [
            CupertinoDialogAction(
              child: Text(
                'Ok',
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      color: AppColors.blue50,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PokemonListBloc, PokemonListState>(
      listener: (context, state) {
        if (state is LoadErrorPokemonList) {
          _loadErrorPokemonList();
        }
      },
      builder: (context, state) {
        if (state is LoadingPokemonList) {
          return const ContainerLoading();
        } else if (state is LoadedPokemonList) {
          return _buildPokemonList(state.pokemonList);
        } else if (state is SearchResultPokemonList) {
          return _buildPokemonList(state.pokemonList);
        } else if (state is SearchEmptyPokemonList) {
          return const PokemonListEmpty();
        }
        return Container();
      },
    );
  }
}
