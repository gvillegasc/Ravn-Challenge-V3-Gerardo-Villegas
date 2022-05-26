import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokechallenge/presentation/blocs/pokemon_form/pokemon_form_bloc.dart';
import 'package:pokechallenge/presentation/blocs/pokemon_species/pokemon_species_bloc.dart';
import 'package:pokechallenge/presentation/routes/app_routes.dart';
import 'package:pokechallenge/presentation/theme/theme.dart';

import 'injection/injection.dart';

class PokechallengeApp extends StatelessWidget {
  const PokechallengeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<PokemonFormBloc>(),
        ),
        BlocProvider(
          create: (_) => getIt<PokemonSpeciesBloc>(),
        )
      ],
      child: MaterialApp(
        title: 'Pokechallenge App',
        theme: appLightTheme,
        darkTheme: appDarkTheme,
        debugShowCheckedModeBanner: false,
        initialRoute: appInitialRoute,
        onGenerateRoute: generateRoutes,
      ),
    );
  }
}
