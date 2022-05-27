import 'dart:convert';

import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokechallenge/core/error/failures.dart';
import 'package:pokechallenge/domain/models/evolution_chain.dart';
import 'package:pokechallenge/domain/use_cases/get_evolution_chain.dart';
import 'package:pokechallenge/presentation/blocs/evolution_chain/evolution_chain_bloc.dart';

import '../../fixtures/fixture_reader.dart';
import '../../mocks/use_cases_mock.dart';

void main() {
  late MockGetEvolutionChain getEvolutionChain;
  late EvolutionChainBloc bloc;

  setUp(() {
    getEvolutionChain = MockGetEvolutionChain();
    bloc = EvolutionChainBloc(getEvolutionChain: getEvolutionChain);
  });

  test('initialState should be EvolutionChainInitial', () {
    expect(bloc.state, equals(const EvolutionChainInitial()));
  });

  group('OnGetEvolutionChain', () {
    const chainId = 1;
    const pokemonId = 1;

    final evolutionChain =
        EvolutionChain.fromJson(json.decode(fixture('evolution_chain.json')));
    blocTest(
      'emit [LoadingEvolutionChain, LoadedEvolutionChain] when data is successfully',
      build: () {
        when(() => getEvolutionChain(const GetEvolutionChainParams(
                chainId: chainId, pokemonId: pokemonId)))
            .thenAnswer((_) async => Right(evolutionChain));
        return bloc;
      },
      act: (EvolutionChainBloc bloc) =>
          bloc.add(const OnGetEvolutionChain(chainId, pokemonId)),
      expect: () => [
        const LoadingEvolutionChain(),
        LoadedEvolutionChain(evolutionChain: evolutionChain),
      ],
    );

    blocTest(
      'emit [LoadingEvolutionChain, LoadErrorEvolutionChain] when data is fail',
      build: () {
        when(() => getEvolutionChain(const GetEvolutionChainParams(
                chainId: chainId, pokemonId: pokemonId)))
            .thenAnswer((_) async => Left(ServerFailure()));
        return bloc;
      },
      act: (EvolutionChainBloc bloc) =>
          bloc.add(const OnGetEvolutionChain(chainId, pokemonId)),
      expect: () => [
        const LoadingEvolutionChain(),
        const LoadErrorEvolutionChain(),
      ],
    );
  });
}
