import 'package:pokechallenge/domain/models/pokemon.dart';

abstract class LocalDataSource {
  Future<List<Pokemon>> getPokemonList();
}
