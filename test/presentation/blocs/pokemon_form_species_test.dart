import 'dart:convert';

import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokechallenge/core/error/failures.dart';
import 'package:pokechallenge/domain/models/pokemon_species.dart';
import 'package:pokechallenge/domain/use_cases/get_pokemon_species.dart';
import 'package:pokechallenge/presentation/blocs/pokemon_species/pokemon_species_bloc.dart';

import '../../fixtures/fixture_reader.dart';
import '../../mocks/use_cases_mock.dart';

void main() {
  late MockGetPokemonSpecies getPokemonSpecies;
  late PokemonSpeciesBloc bloc;

  setUp(() {
    getPokemonSpecies = MockGetPokemonSpecies();
    bloc = PokemonSpeciesBloc(getPokemonSpecies: getPokemonSpecies);
  });

  test('initialState should be PokemonSpeciesInitial', () {
    expect(bloc.state, equals(const PokemonSpeciesInitial()));
  });

  group('OnGetPokemonSpecies', () {
    const pokemonId = 1;
    final pokemonSpecies =
        PokemonSpecies.fromJson(json.decode(fixture('pokemon_species.json')));
    blocTest(
      'emit [LoadingPokemonSpecies, LoadedPokemonSpecies] when data is successfully',
      build: () {
        when(() => getPokemonSpecies(
                const GetPokemonSpeciesParams(pokemonId: pokemonId)))
            .thenAnswer((_) async => Right(pokemonSpecies));
        return bloc;
      },
      act: (PokemonSpeciesBloc bloc) =>
          bloc.add(const OnGetPokemonSpecies(pokemonId)),
      expect: () => [
        const LoadingPokemonSpecies(),
        LoadedPokemonSpecies(pokemonSpecies: pokemonSpecies),
      ],
    );

    blocTest(
      'emit [LoadingPokemonSpecies, LoadErrorPokemonSpecies] when data is fail',
      build: () {
        when(() => getPokemonSpecies(
                const GetPokemonSpeciesParams(pokemonId: pokemonId)))
            .thenAnswer((_) async => Left(ServerFailure()));
        return bloc;
      },
      act: (PokemonSpeciesBloc bloc) =>
          bloc.add(const OnGetPokemonSpecies(pokemonId)),
      expect: () => [
        const LoadingPokemonSpecies(),
        const LoadErrorPokemonSpecies(),
      ],
    );
  });
}
