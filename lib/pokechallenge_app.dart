import 'package:flutter/material.dart';
import 'package:pokechallenge/presentation/routes/app_routes.dart';

class PokechallengeApp extends StatelessWidget {
  const PokechallengeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Pokechallenge App',
      debugShowCheckedModeBanner: false,
      initialRoute: appInitialRoute,
      onGenerateRoute: generateRoutes,
    );
  }
}
