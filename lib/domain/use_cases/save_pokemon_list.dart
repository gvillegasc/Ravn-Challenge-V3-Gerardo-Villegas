import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:pokechallenge/core/error/failures.dart';
import 'package:pokechallenge/domain/models/pokemon.dart';
import 'package:pokechallenge/domain/repositories/pokemon_repository.dart';
import 'package:pokechallenge/domain/use_cases/use_case.dart';

class SavePokemonList implements UseCase<List<Pokemon>, SavePokemonListParams> {
  SavePokemonList(this.repository);

  final PokemonRepository repository;

  @override
  Future<Either<Failure, List<Pokemon>>> call(
      SavePokemonListParams params) async {
    return await repository.savePokemonList(params.pokemonList);
  }
}

class SavePokemonListParams extends Equatable {
  const SavePokemonListParams({
    required this.pokemonList,
  });

  final List<Pokemon> pokemonList;

  @override
  List<Object> get props => [pokemonList];
}
