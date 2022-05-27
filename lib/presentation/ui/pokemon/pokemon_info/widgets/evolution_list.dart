import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pokechallenge/domain/models/evolution_chain.dart';
import 'package:pokechallenge/domain/models/pokemon.dart';
import 'package:pokechallenge/presentation/ui/pokemon/pokemon_info/widgets/evelution_list_item.dart';

class EvolutionList extends StatelessWidget {
  const EvolutionList({
    Key? key,
    required this.pokemon,
    required this.evolutions,
  }) : super(key: key);

  final Pokemon pokemon;
  final List<Chain> evolutions;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          const SizedBox(height: 15),
          Container(
            alignment: Alignment.center,
            child: Text(
              AppLocalizations.of(context)!.evolutions,
              style: Theme.of(context).textTheme.subtitle2,
            ),
          ),
          ...List.generate(
            evolutions.length,
            (i) => EvolutionListItem(
              pokemon: pokemon,
              evolution: evolutions[i],
            ),
          )
        ],
      ),
    );
  }
}
