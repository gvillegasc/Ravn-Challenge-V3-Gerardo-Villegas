import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:pokechallenge/core/error/failures.dart';
import 'package:pokechallenge/domain/models/pokemon_form.dart';
import 'package:pokechallenge/domain/repositories/pokemon_repository.dart';
import 'package:pokechallenge/domain/use_cases/use_case.dart';

class GetPokemonForm implements UseCase<PokemonForm, GetPokemonFormParams> {
  GetPokemonForm(this.repository);

  final PokemonRepository repository;

  @override
  Future<Either<Failure, PokemonForm>> call(GetPokemonFormParams params) async {
    return await repository.getPokemonForm(params.pokemonId);
  }
}

class GetPokemonFormParams extends Equatable {
  const GetPokemonFormParams({required this.pokemonId});

  final int pokemonId;

  @override
  List<Object> get props => [pokemonId];
}
