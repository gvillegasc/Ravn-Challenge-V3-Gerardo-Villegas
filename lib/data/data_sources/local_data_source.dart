import 'dart:async';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pokechallenge/app_config.dart';
import 'package:pokechallenge/domain/models/pokemon.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class Stores {
  static const String storePokemon = 'Pokemon';
}

abstract class LocalDataSource {
  Future<List<Pokemon>> getPokemonList();
  Future<List<Pokemon>> savePokemonList();
}

class LocalDataSourceImpl extends LocalDataSource {
  @override
  Future<List<Pokemon>> getPokemonList() async {
    final _pokemonFolder = intMapStoreFactory.store(Stores.storePokemon);
    final _db = await AppDatabase.instance.database;
    final recordSnapshot = await _pokemonFolder.find(_db);
    final pokemonList = recordSnapshot.map((snapshot) {
      final pokemons = Pokemon.fromJson(snapshot.value);
      return pokemons;
    }).toList();
    return pokemonList;
  }

  @override
  Future<List<Pokemon>> savePokemonList() {
    throw UnimplementedError();
  }
}

class AppDatabase {
  static final AppDatabase _singleton = AppDatabase._();

  static AppDatabase get instance => _singleton;

  late Completer<Database> _dbOpenCompleter;

  AppDatabase._();

  Future<Database> get database async {
    _dbOpenCompleter = Completer();
    final appDocumentDir = await getApplicationDocumentsDirectory();
    final dbPath = join(appDocumentDir.path, AppConfig.instance.database);
    final database = await databaseFactoryIo.openDatabase(dbPath);
    _dbOpenCompleter.complete(database);
    return _dbOpenCompleter.future;
  }
}
