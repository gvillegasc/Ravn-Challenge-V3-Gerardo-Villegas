import 'package:dartz/dartz.dart';
import 'package:pokechallenge/core/error/failures.dart';
import 'package:pokechallenge/domain/models/pokemon.dart';
import 'package:pokechallenge/domain/repositories/pokemon_repository.dart';
import 'package:pokechallenge/domain/use_cases/use_case.dart';

class GetPokemonList implements UseCase<List<Pokemon>, NoParams> {
  GetPokemonList(this.repository);

  final PokemonRepository repository;

  @override
  Future<Either<Failure, List<Pokemon>>> call(NoParams params) async {
    return await repository.getPokemonList();
  }
}
