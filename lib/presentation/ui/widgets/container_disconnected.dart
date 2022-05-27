import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ContainerDisconnected extends StatelessWidget {
  const ContainerDisconnected({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          Image.asset(
            'assets/pages/images/img_disconnected.png',
            height: 200,
          ),
          Text(AppLocalizations.of(context)!.waitingConnection)
        ],
      ),
    );
  }
}
