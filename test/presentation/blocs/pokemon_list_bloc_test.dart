import 'dart:convert';

import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokechallenge/domain/models/pokemon.dart';
import 'package:pokechallenge/domain/use_cases/use_case.dart';
import 'package:pokechallenge/presentation/blocs/pokemon_list/pokemon_list_bloc.dart';

import '../../fixtures/fixture_reader.dart';
import '../../mocks/use_cases_mock.dart';

void main() {
  late MockGetPokemonList getPokemonList;
  late PokemonListBloc bloc;

  setUp(() {
    getPokemonList = MockGetPokemonList();
    bloc = PokemonListBloc(getPokemonList: getPokemonList);
  });

  test('initialState should be CommitInitial', () {
    expect(bloc.state, equals(const PokemonListInitial()));
  });

  group('OnGetPokemonList', () {
    final pokemons =
        PokemonMapper.fromJsonList(json.decode(fixture('pokemons.json'))).items;

    blocTest(
      'emit [LoadingPokemonList, LoadedPokemonList] when data is successfully',
      build: () {
        when(() => getPokemonList(NoParams()))
            .thenAnswer((_) async => Right(pokemons));
        return bloc;
      },
      act: (PokemonListBloc bloc) => bloc.add(const OnGetPokemonList()),
      expect: () => [
        const LoadingPokemonList(),
        LoadedPokemonList(pokemonList: pokemons),
      ],
    );
  });
}
