import 'package:flutter/material.dart';
import 'package:pokechallenge/app_config.dart';
import 'package:pokechallenge/injection/injection.dart';
import 'package:pokechallenge/pokechallenge_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppConfig.instance.init(
    database: 'Pokechallenge_stg.db',
    apiGraphql: 'https://dex-server.herokuapp.com',
    apiRest: 'https://pokeapi.co/api/v2',
  );
  await init();
  runApp(const PokechallengeApp());
}
