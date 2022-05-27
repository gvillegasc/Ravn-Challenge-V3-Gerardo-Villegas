import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:pokechallenge/core/error/failures.dart';
import 'package:pokechallenge/domain/models/pokemon_species.dart';
import 'package:pokechallenge/domain/repositories/pokemon_repository.dart';
import 'package:pokechallenge/domain/use_cases/use_case.dart';

class GetPokemonSpecies
    implements UseCase<PokemonSpecies, GetPokemonSpeciesParams> {
  GetPokemonSpecies(this.repository);

  final PokemonRepository repository;

  @override
  Future<Either<Failure, PokemonSpecies>> call(
      GetPokemonSpeciesParams params) async {
    return await repository.getPokemonSpecies(params.pokemonId);
  }
}

class GetPokemonSpeciesParams extends Equatable {
  const GetPokemonSpeciesParams({required this.pokemonId});

  final int pokemonId;

  @override
  List<Object> get props => [pokemonId];
}
