import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokechallenge/domain/models/pokemon_species.dart';
import 'package:pokechallenge/domain/use_cases/get_pokemon_species.dart';

import '../../fixtures/fixture_reader.dart';
import '../../mocks/repositories_mock.dart';

void main() {
  late MockPokemonRepository pokemonRepository;
  late GetPokemonSpecies usecase;

  setUp(() {
    pokemonRepository = MockPokemonRepository();
    usecase = GetPokemonSpecies(pokemonRepository);
  });

  final pokemonSpecies =
      PokemonSpecies.fromJson(json.decode(fixture('pokemon_species.json')));

  test('should get pokemon species from repository', () async {
    const pokemonId = 1;
    when(() => pokemonRepository.getPokemonSpecies(pokemonId))
        .thenAnswer((_) async => Right(pokemonSpecies));

    final result =
        await usecase(const GetPokemonSpeciesParams(pokemonId: pokemonId));

    expect(result, equals(Right(pokemonSpecies)));

    verify(() => pokemonRepository.getPokemonSpecies(pokemonId));
    verifyNoMoreInteractions(pokemonRepository);
  });
}
