import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokechallenge/domain/models/evolution_chain.dart';
import 'package:pokechallenge/domain/use_cases/get_evolution_chain.dart';

import '../../fixtures/fixture_reader.dart';
import '../../mocks/repositories_mock.dart';

void main() {
  late MockPokemonRepository pokemonRepository;
  late GetEvolutionChain usecase;

  setUp(() {
    pokemonRepository = MockPokemonRepository();
    usecase = GetEvolutionChain(pokemonRepository);
  });

  final evolutionChain =
      EvolutionChain.fromJson(json.decode(fixture('evolution_chain.json')));

  test('should get evolution chain from repository', () async {
    const chainId = 1;
    const pokemonId = 3;
    when(
      () => pokemonRepository.getEvolutionChain(chainId, pokemonId),
    ).thenAnswer((_) async => Right(evolutionChain));

    final result = await usecase(
        const GetEvolutionChainParams(chainId: chainId, pokemonId: pokemonId));

    expect(result, equals(Right(evolutionChain)));

    verify(() => pokemonRepository.getEvolutionChain(chainId, pokemonId));
    verifyNoMoreInteractions(pokemonRepository);
  });
}
