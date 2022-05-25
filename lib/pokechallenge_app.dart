import 'package:flutter/material.dart';
import 'package:pokechallenge/presentation/routes/app_routes.dart';
import 'package:pokechallenge/presentation/theme/theme.dart';

class PokechallengeApp extends StatefulWidget {
  const PokechallengeApp({Key? key}) : super(key: key);

  @override
  State<PokechallengeApp> createState() => _PokechallengeAppState();
}

class _PokechallengeAppState extends State<PokechallengeApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokechallenge App',
      theme: appLightTheme,
      darkTheme: appDarkTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: appInitialRoute,
      onGenerateRoute: generateRoutes,
    );
  }
}
