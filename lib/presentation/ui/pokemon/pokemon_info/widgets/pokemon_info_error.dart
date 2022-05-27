import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pokechallenge/core/app_colors.dart';

class PokemonInfoError extends StatelessWidget {
  const PokemonInfoError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
