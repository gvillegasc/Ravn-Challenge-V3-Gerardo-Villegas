import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokechallenge/core/app_colors.dart';
import 'package:pokechallenge/presentation/blocs/pokemon_list/pokemon_list_bloc.dart';

class PokemonListAppBar extends StatefulWidget {
  const PokemonListAppBar({Key? key}) : super(key: key);

  @override
  State<PokemonListAppBar> createState() => _PokemonListAppBarState();
}

class _PokemonListAppBarState extends State<PokemonListAppBar> {
  bool _searchHasText = false;

  final _searchController = TextEditingController();

  void _onSearchPokemon(String word) {
    final bloc = context.read<PokemonListBloc>();
    bloc.add(OnSearchPokemon(word));
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }

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
            horizontal: 15,
          ),
          height: 60,
          child: Row(
            children: [
              Expanded(
                child: CupertinoSearchTextField(
                  onTap: () {
                    setState(() {
                      _searchHasText = true;
                    });
                  },
                  style: Theme.of(context).textTheme.bodyText2,
                  controller: _searchController,
                  onSuffixTap: () {
                    setState(() {
                      _searchController.text = '';
                      _searchHasText = false;
                      _onSearchPokemon(_searchController.text);
                    });
                  },
                  onSubmitted: _onSearchPokemon,
                ),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                width: _searchHasText ? 70 : 0,
                padding: const EdgeInsets.only(left: 5),
                height: 50,
                alignment: Alignment.center,
                child: CupertinoButton(
                  padding: EdgeInsets.zero,
                  child: Text(
                    'Cancel',
                    maxLines: 1,
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          color: AppColors.blue50,
                        ),
                  ),
                  onPressed: () {
                    setState(() {
                      _searchController.text = '';
                      _searchHasText = false;
                      _onSearchPokemon(_searchController.text);
                    });
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
