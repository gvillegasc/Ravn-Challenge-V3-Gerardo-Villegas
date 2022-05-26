import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokechallenge/core/extensions/string_extension.dart';
import 'package:pokechallenge/core/utils/pokemon_numeration.dart';
import 'package:pokechallenge/domain/models/evolution_chain.dart';
import 'package:pokechallenge/domain/models/pokemon.dart';
import 'package:pokechallenge/domain/models/pokemon_form.dart';
import 'package:pokechallenge/domain/models/pokemon_species.dart';
import 'package:pokechallenge/presentation/blocs/evolution_chain/evolution_chain_bloc.dart';
import 'package:pokechallenge/presentation/blocs/pokemon_form/pokemon_form_bloc.dart';
import 'package:pokechallenge/presentation/blocs/pokemon_species/pokemon_species_bloc.dart';
import 'package:pokechallenge/presentation/ui/pokemon/pokemon_info/widgets/evolution_list.dart';
import 'package:pokechallenge/presentation/ui/pokemon/pokemon_info/widgets/pokemon_image.dart';
import 'package:pokechallenge/presentation/ui/pokemon/pokemon_info/widgets/pokemon_info_error.dart';
import 'package:pokechallenge/presentation/ui/pokemon/pokemon_info/widgets/pokemon_tags.dart';
import 'package:pokechallenge/presentation/ui/widgets/container_loading.dart';

class PokemonInfo extends StatefulWidget {
  const PokemonInfo({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  final Pokemon pokemon;

  @override
  State<PokemonInfo> createState() => _PokemonInfoState();
}

class _PokemonInfoState extends State<PokemonInfo> {
  late PokemonFormBloc pokemonFormBloc;
  @override
  void initState() {
    super.initState();
    final pokemonFormBloc = context.read<PokemonFormBloc>();
    pokemonFormBloc.add(OnGetPokemonForm(widget.pokemon.id));
    final pokemonFormSpecies = context.read<PokemonSpeciesBloc>();
    pokemonFormSpecies.add(OnGetPokemonSpecies(widget.pokemon.id));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PokemonSpeciesBloc, PokemonSpeciesState>(
      listener: (context, stateSpecies) {
        if (stateSpecies is LoadedPokemonSpecies) {
          final pokemonEvolutionChain = context.read<EvolutionChainBloc>();
          pokemonEvolutionChain.add(OnGetEvolutionChain(
              stateSpecies.pokemonSpecies.evolutionChain.id!,
              widget.pokemon.id));
        }
      },
      builder: (context, stateSpecies) {
        return BlocBuilder<PokemonFormBloc, PokemonFormState>(
            builder: (context, stateForm) {
          return BlocBuilder<EvolutionChainBloc, EvolutionChainState>(
            builder: (context, stateEvolution) {
              if (stateSpecies is LoadedPokemonSpecies &&
                  stateForm is LoadedPokemonForm &&
                  stateEvolution is LoadedEvolutionChain) {
                return _BuildPokemonInfo(
                  pokemonForm: stateForm.pokemonForm,
                  pokemonSpecies: stateSpecies.pokemonSpecies,
                  evolutionChain: stateEvolution.evolutionChain,
                  pokemon: widget.pokemon,
                );
              } else if (stateSpecies is LoadErrorPokemonSpecies ||
                  stateForm is LoadErrorPokemonForm ||
                  stateEvolution is LoadErrorEvolutionChain) {
                return const PokemonInfoError();
              }
              return const ContainerLoading();
            },
          );
        });
      },
    );
  }
}

class _BuildPokemonInfo extends StatelessWidget {
  const _BuildPokemonInfo({
    Key? key,
    required this.pokemonForm,
    required this.pokemonSpecies,
    required this.evolutionChain,
    required this.pokemon,
  }) : super(key: key);

  final PokemonSpecies pokemonSpecies;
  final PokemonForm pokemonForm;
  final EvolutionChain evolutionChain;
  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PokemonImage(
          pokemonSpecies: pokemonSpecies,
          pokemonForm: pokemonForm,
        ),
        Text(
          '${pokemonNumeration(pokemon.id)} ${pokemon.name.capitalize()}',
          style: Theme.of(context).textTheme.headline5,
        ),
        PokemonTags(
          types: pokemon.types,
        ),
        const SizedBox(height: 10),
        Text(
          generationValues.reverse[pokemon.generation]!,
          style: Theme.of(context).textTheme.subtitle2,
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            pokemonSpecies.flavorTextEntries
                .firstWhere((element) =>
                    element.language ==
                    Localizations.localeOf(context).languageCode)
                .flavorText
                .replaceAll('\n', ' '),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        if (evolutionChain.chain.evolvesTo.isNotEmpty)
          Container(
            margin: const EdgeInsets.only(top: 15),
            child: const Divider(height: 2),
          ),
        if (evolutionChain.chain.evolvesTo.isNotEmpty)
          EvolutionList(
            pokemon: pokemon,
            evolutions: evolutionChain.chain.evolvesTo,
          ),
      ],
    );
  }
}
