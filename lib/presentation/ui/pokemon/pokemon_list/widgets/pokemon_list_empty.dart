import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pokechallenge/core/app_colors.dart';

class PokemonListEmpty extends StatefulWidget {
  const PokemonListEmpty({Key? key}) : super(key: key);

  @override
  State<PokemonListEmpty> createState() => _PokemonListEmptyState();
}

class _PokemonListEmptyState extends State<PokemonListEmpty> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      padding: const EdgeInsets.only(top: 10),
      alignment: Alignment.topCenter,
      child: Text(
        AppLocalizations.of(context)!.failedLoadData,
        style: Theme.of(context)
            .textTheme
            .headline1!
            .copyWith(color: AppColors.red50),
      ),
    );
  }
}
