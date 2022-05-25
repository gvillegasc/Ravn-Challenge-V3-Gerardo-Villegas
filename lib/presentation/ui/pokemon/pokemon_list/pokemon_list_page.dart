import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokechallenge/injection/injection.dart';
import 'package:pokechallenge/presentation/blocs/pokemon_list/pokemon_list_bloc.dart';
import 'package:pokechallenge/presentation/ui/pokemon/pokemon_list/widgets/pokemon_list_app_bar.dart';

class PokemonListPage extends StatefulWidget {
  const PokemonListPage({Key? key}) : super(key: key);

  @override
  State<PokemonListPage> createState() => _PokemonListPageState();
}

class _PokemonListPageState extends State<PokemonListPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<PokemonListBloc>(),
      child: const Scaffold(
        body: CustomScrollView(
          slivers: [
            PokemonListAppBar(),
          ],
        ),
      ),
    );
  }
}
