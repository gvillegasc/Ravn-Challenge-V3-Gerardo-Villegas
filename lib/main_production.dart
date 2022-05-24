import 'package:flutter/material.dart';
import 'package:pokechallenge/app_config.dart';
import 'package:pokechallenge/pokechallenge_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppConfig.instance.init(
    database: 'Pokechallenge.db',
    apiGraphql: 'https://dex-server.herokuapp.com/',
  );
  runApp(const PokechallengeApp());
}
