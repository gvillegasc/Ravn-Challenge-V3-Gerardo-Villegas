import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokechallenge/domain/models/pokemon.dart';
import 'package:pokechallenge/domain/use_cases/save_pokemon_list.dart';

import '../../fixtures/fixture_reader.dart';
import '../../mocks/repositories_mock.dart';

void main() {
  late MockPokemonRepository pokemonRepository;
  late SavePokemonList usecase;

  setUp(() {
    pokemonRepository = MockPokemonRepository();
    usecase = SavePokemonList(pokemonRepository);
  });

  final pokemons =
      PokemonMapper.fromJsonList(json.decode(fixture('pokemons.json'))).items;

  test('should save pokemon list from repository', () async {
    when(() => pokemonRepository.savePokemonList(pokemons))
        .thenAnswer((_) async => Right(pokemons));

    final result = await usecase(SavePokemonListParams(pokemonList: pokemons));

    expect(result, equals(Right(pokemons)));
    verify(() => pokemonRepository.savePokemonList(pokemons));
    verifyNoMoreInteractions(pokemonRepository);
  });
}
