import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokechallenge/core/app_colors.dart';

class ContainerLoading extends StatelessWidget {
  const ContainerLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: Center(
        child: (Platform.isIOS)
            ? CupertinoTheme(
                data: CupertinoTheme.of(context).copyWith(
                  brightness: Theme.of(context).brightness == Brightness.dark
                      ? Brightness.dark
                      : Brightness.light,
                ),
                child: const CupertinoActivityIndicator(radius: 15),
              )
            : CircularProgressIndicator(
                color: AppColors.white100.withOpacity(.5),
              ),
      ),
    );
  }
}
