import 'dart:convert';

import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokechallenge/core/error/failures.dart';
import 'package:pokechallenge/domain/models/pokemon_form.dart';
import 'package:pokechallenge/domain/use_cases/get_pokemon_form.dart';
import 'package:pokechallenge/presentation/blocs/pokemon_form/pokemon_form_bloc.dart';

import '../../fixtures/fixture_reader.dart';
import '../../mocks/use_cases_mock.dart';

void main() {
  late MockGetPokemonForm getPokemonForm;
  late PokemonFormBloc bloc;

  setUp(() {
    getPokemonForm = MockGetPokemonForm();
    bloc = PokemonFormBloc(getPokemonForm: getPokemonForm);
  });

  test('initialState should be PokemonFormInitial', () {
    expect(bloc.state, equals(const PokemonFormInitial()));
  });

  group('OnGetPokemonForm', () {
    const pokemonId = 1;
    final pokemonForm =
        PokemonForm.fromJson(json.decode(fixture('pokemon_form.json')));
    blocTest(
      'emit [LoadingPokemonForm, LoadedPokemonForm] when data is successfully',
      build: () {
        when(() => getPokemonForm(
                const GetPokemonFormParams(pokemonId: pokemonId)))
            .thenAnswer((_) async => Right(pokemonForm));
        return bloc;
      },
      act: (PokemonFormBloc bloc) =>
          bloc.add(const OnGetPokemonForm(pokemonId)),
      expect: () => [
        const LoadingPokemonForm(),
        LoadedPokemonForm(pokemonForm: pokemonForm),
      ],
    );

    blocTest(
      'emit [LoadingPokemonForm, LoadErrorPokemonForm] when data is fail',
      build: () {
        when(() => getPokemonForm(
                const GetPokemonFormParams(pokemonId: pokemonId)))
            .thenAnswer((_) async => Left(ServerFailure()));
        return bloc;
      },
      act: (PokemonFormBloc bloc) =>
          bloc.add(const OnGetPokemonForm(pokemonId)),
      expect: () => [
        const LoadingPokemonForm(),
        const LoadErrorPokemonForm(),
      ],
    );
  });
}
