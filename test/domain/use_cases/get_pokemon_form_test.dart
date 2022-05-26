import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokechallenge/domain/models/pokemon_form.dart';
import 'package:pokechallenge/domain/use_cases/get_pokemon_form.dart';

import '../../fixtures/fixture_reader.dart';
import '../../mocks/repositories_mock.dart';

void main() {
  late MockPokemonRepository pokemonRepository;
  late GetPokemonForm usecase;

  setUp(() {
    pokemonRepository = MockPokemonRepository();
    usecase = GetPokemonForm(pokemonRepository);
  });

  final pokemonForm =
      PokemonForm.fromJson(json.decode(fixture('pokemon_form.json')));

  test('should get pokemon form from repository', () async {
    const pokemonId = 1;
    when(() => pokemonRepository.getPokemonForm(pokemonId))
        .thenAnswer((_) async => Right(pokemonForm));

    final result =
        await usecase(const GetPokemonFormParams(pokemonId: pokemonId));

    expect(result, equals(Right(pokemonForm)));

    verify(() => pokemonRepository.getPokemonForm(pokemonId));
    verifyNoMoreInteractions(pokemonRepository);
  });
}
