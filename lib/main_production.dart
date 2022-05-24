import 'package:flutter/material.dart';
import 'package:pokechallenge/app_config.dart';
import 'package:pokechallenge/pokechallenge_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppConfig.instance.init(
    database: 'Pokechallenge.db',
  );
  runApp(const PokechallengeApp());
}
