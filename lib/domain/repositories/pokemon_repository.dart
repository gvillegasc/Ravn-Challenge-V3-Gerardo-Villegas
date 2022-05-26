import 'package:dartz/dartz.dart';
import 'package:pokechallenge/core/error/failures.dart';
import 'package:pokechallenge/domain/models/pokemon.dart';
import 'package:pokechallenge/domain/models/pokemon_form.dart';

abstract class PokemonRepository {
  Future<Either<Failure, List<Pokemon>>> getPokemonList();
  Future<Either<Failure, PokemonForm>> getPokemonForms(int pokemonId);
}
