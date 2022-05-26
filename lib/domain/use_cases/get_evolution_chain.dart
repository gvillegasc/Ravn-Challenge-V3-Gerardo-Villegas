import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:pokechallenge/core/error/failures.dart';
import 'package:pokechallenge/domain/models/evolution_chain.dart';
import 'package:pokechallenge/domain/repositories/pokemon_repository.dart';
import 'package:pokechallenge/domain/use_cases/use_case.dart';

class GetEvolutionChain
    implements UseCase<EvolutionChain, GetEvolutionChainParams> {
  GetEvolutionChain(this.repository);

  final PokemonRepository repository;

  @override
  Future<Either<Failure, EvolutionChain>> call(
      GetEvolutionChainParams params) async {
    return await repository.getEvolutionChain(params.pokemonId);
  }
}

class GetEvolutionChainParams extends Equatable {
  const GetEvolutionChainParams({required this.pokemonId});

  final int pokemonId;

  @override
  List<Object> get props => [pokemonId];
}
