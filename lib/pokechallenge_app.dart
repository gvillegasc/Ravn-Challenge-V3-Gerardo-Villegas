import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokechallenge/presentation/blocs/pokemon_form/pokemon_form_bloc.dart';
import 'package:pokechallenge/presentation/routes/app_routes.dart';
import 'package:pokechallenge/presentation/theme/theme.dart';

import 'injection/injection.dart';

class PokechallengeApp extends StatelessWidget {
  const PokechallengeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<PokemonFormBloc>(),
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
