import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pokechallenge/injection/injection.dart';
import 'package:pokechallenge/l10n/l10n.dart';
import 'package:pokechallenge/presentation/blocs/evolution_chain/evolution_chain_bloc.dart';
import 'package:pokechallenge/presentation/blocs/internet_connection/internet_connection_bloc.dart';
import 'package:pokechallenge/presentation/blocs/pokemon_form/pokemon_form_bloc.dart';
import 'package:pokechallenge/presentation/blocs/pokemon_species/pokemon_species_bloc.dart';
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
        ),
        BlocProvider(
          create: (_) => getIt<EvolutionChainBloc>(),
        ),
        BlocProvider(
          create: (_) => getIt<InternetConnectionBloc>(),
        ),
      ],
      child: const _Init(),
    );
  }
}

class _Init extends StatefulWidget {
  const _Init({Key? key}) : super(key: key);

  @override
  State<_Init> createState() => _InitState();
}

class _InitState extends State<_Init> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokechallenge App',
      theme: appLightTheme,
      darkTheme: appDarkTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: appInitialRoute,
      onGenerateRoute: generateRoutes,
      supportedLocales: L10n.all,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
    );
  }
}
