import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokechallenge/domain/models/pokemon.dart';
import 'package:pokechallenge/domain/use_cases/get_pokemon_list.dart';
import 'package:pokechallenge/domain/use_cases/use_case.dart';

import '../../fixtures/fixture_reader.dart';
import '../../mocks/repositories_mock.dart';

void main() {
  late MockPokemonRepository pokemonRepository;
  late GetPokemonList usecase;

  setUp(() {
    pokemonRepository = MockPokemonRepository();
    usecase = GetPokemonList(pokemonRepository);
  });

  final pokemons =
      PokemonMapper.fromJsonList(json.decode(fixture('pokemons.json'))).items;

  test('should get pokemon list from repository', () async {
    when(() => pokemonRepository.getPokemonList())
        .thenAnswer((_) async => Right(pokemons));

    final result = await usecase(NoParams());

    expect(result, equals(Right(pokemons)));
    verify(pokemonRepository.getPokemonList);
    verifyNoMoreInteractions(pokemonRepository);
  });
}
