import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:pokechallenge/core/error/failures.dart';
import 'package:pokechallenge/domain/models/pokemon_form.dart';
import 'package:pokechallenge/domain/repositories/pokemon_repository.dart';
import 'package:pokechallenge/domain/use_cases/use_case.dart';

class GetPokemonForms implements UseCase<PokemonForm, GetPokemonFormsParams> {
  GetPokemonForms(this.repository);

  final PokemonRepository repository;

  @override
  Future<Either<Failure, PokemonForm>> call(
      GetPokemonFormsParams params) async {
    return await repository.getPokemonForms(params.pokemonId);
  }
}

class GetPokemonFormsParams extends Equatable {
  const GetPokemonFormsParams({required this.pokemonId});

  final int pokemonId;

  @override
  List<Object> get props => [pokemonId];
}
