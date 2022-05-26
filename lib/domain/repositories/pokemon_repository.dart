import 'package:dartz/dartz.dart';
import 'package:pokechallenge/core/error/failures.dart';
import 'package:pokechallenge/domain/models/evolution_chain.dart';
import 'package:pokechallenge/domain/models/pokemon.dart';
import 'package:pokechallenge/domain/models/pokemon_form.dart';
import 'package:pokechallenge/domain/models/pokemon_species.dart';

abstract class PokemonRepository {
  Future<Either<Failure, List<Pokemon>>> getPokemonList();
  Future<Either<Failure, PokemonForm>> getPokemonForm(int pokemonId);
  Future<Either<Failure, PokemonSpecies>> getPokemonSpecies(int pokemonId);
  Future<Either<Failure, EvolutionChain>> getEvolutionChain(
      int chainId, int pokemonId);
}
