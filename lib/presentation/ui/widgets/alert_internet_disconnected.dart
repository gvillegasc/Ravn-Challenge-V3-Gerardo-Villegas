import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pokechallenge/core/app_colors.dart';

void alertInternetDisconnected(BuildContext context, Function tryAgainAction) {
  showCupertinoDialog(
    context: context,
    builder: (context) {
      return CupertinoAlertDialog(
        title: Text(
          AppLocalizations.of(context)!.connectivityIssue,
          style: Theme.of(context).textTheme.bodyText2,
        ),
        content: Text(
          AppLocalizations.of(context)!.connectivityDescription,
          style: Theme.of(context).textTheme.headline1,
        ),
        actions: [
          CupertinoDialogAction(
            child: Text(
              AppLocalizations.of(context)!.cancel,
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    color: AppColors.blue50,
                    fontWeight: FontWeight.w400,
                  ),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          CupertinoDialogAction(
            child: Text(
              AppLocalizations.of(context)!.tryAgain,
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    color: AppColors.blue50,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            onPressed: () {
              tryAgainAction();
            },
          ),
        ],
      );
    },
  );
}
