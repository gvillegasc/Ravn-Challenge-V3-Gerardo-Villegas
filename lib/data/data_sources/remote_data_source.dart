import 'package:pokechallenge/domain/models/pokemon.dart';

abstract class RemoteDataSource {
  Future<List<Pokemon>> getPokemonList();
}
