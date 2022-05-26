import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokechallenge/core/error/exceptions.dart';
import 'package:pokechallenge/core/error/failures.dart';
import 'package:pokechallenge/data/repositories/pokemon_repository_impl.dart';
import 'package:pokechallenge/domain/models/evolution_chain.dart';
import 'package:pokechallenge/domain/models/pokemon.dart';
import 'package:pokechallenge/domain/models/pokemon_form.dart';
import 'package:pokechallenge/domain/models/pokemon_species.dart';

import '../../fixtures/fixture_reader.dart';
import '../../mocks/data_sources_mock.dart';

void main() {
  late MockRemoteDataSource remoteDataSource;
  late MockLocalDataSource localDataSource;
  late PokemonRepositoryImpl repository;

  setUp(() {
    remoteDataSource = MockRemoteDataSource();
    localDataSource = MockLocalDataSource();
    repository = PokemonRepositoryImpl(
      remoteDataSource: remoteDataSource,
      localDataSource: localDataSource,
    );
  });

  group('getPokemonList', () {
    final pokemonList =
        PokemonMapper.fromJsonList(json.decode(fixture('pokemons.json'))).items;
    final emptyList = <Pokemon>[];

    test('should get and save pokemon list from the remote data source',
        () async {
      when(() => localDataSource.getPokemonList())
          .thenAnswer((_) async => emptyList);
      when(() => remoteDataSource.getPokemonList())
          .thenAnswer((_) async => pokemonList);
      when(() => localDataSource.savePokemonList(pokemonList))
          .thenAnswer((_) async => pokemonList);

      final result = await repository.getPokemonList();

      expect(result, equals(Right(pokemonList)));
      verify(localDataSource.getPokemonList);
      verify(remoteDataSource.getPokemonList);
      verify(() => localDataSource.savePokemonList(pokemonList));
      verifyNoMoreInteractions(localDataSource);
      verifyNoMoreInteractions(remoteDataSource);
    });

    test('should get, save and get cache failure from the local data source',
        () async {
      when(() => localDataSource.getPokemonList())
          .thenAnswer((_) async => emptyList);
      when(() => remoteDataSource.getPokemonList())
          .thenAnswer((_) async => pokemonList);
      when(() => localDataSource.savePokemonList(pokemonList))
          .thenThrow(CacheException());

      final result = await repository.getPokemonList();

      expect(result, equals(Left(CacheFailure())));
      verify(localDataSource.getPokemonList);
      verify(remoteDataSource.getPokemonList);
      verify(() => localDataSource.savePokemonList(pokemonList));
      verifyNoMoreInteractions(localDataSource);
      verifyNoMoreInteractions(remoteDataSource);
    });

    test('should get a server failure from the remote data source', () async {
      when(() => localDataSource.getPokemonList())
          .thenAnswer((_) async => emptyList);
      when(() => remoteDataSource.getPokemonList())
          .thenThrow(ServerException());

      final result = await repository.getPokemonList();

      expect(result, equals(Left(ServerFailure())));
      verify(localDataSource.getPokemonList);
      verify(remoteDataSource.getPokemonList);
      verifyNoMoreInteractions(localDataSource);
      verifyNoMoreInteractions(remoteDataSource);
    });

    test('should get pokemon list from the local data source', () async {
      when(() => localDataSource.getPokemonList())
          .thenAnswer((_) async => pokemonList);

      final result = await repository.getPokemonList();

      expect(result, equals(Right(pokemonList)));
      verify(localDataSource.getPokemonList);
      verifyNever(remoteDataSource.getPokemonList);
      verifyNoMoreInteractions(localDataSource);
    });

    test('should get a cache failure from the local data source', () async {
      when(() => localDataSource.getPokemonList()).thenThrow(CacheException());

      final result = await repository.getPokemonList();

      expect(result, equals(Left(CacheFailure())));
      verify(localDataSource.getPokemonList);
      verifyNever(remoteDataSource.getPokemonList);
      verifyNoMoreInteractions(localDataSource);
    });
  });

  group('getPokemonForm', () {
    const pokemonId = 1;
    final pokemonForm =
        PokemonForm.fromJson(json.decode(fixture('pokemon_form.json')));

    test('should get a pokemon form from the remote data source', () async {
      when(() => remoteDataSource.getPokemonForm(pokemonId))
          .thenAnswer((_) async => pokemonForm);

      final result = await repository.getPokemonForm(pokemonId);

      expect(result, equals(Right(pokemonForm)));
      verify(() => remoteDataSource.getPokemonForm(pokemonId));
      verifyNoMoreInteractions(remoteDataSource);
    });

    test('should get a server failure from the remote data source', () async {
      when(() => remoteDataSource.getPokemonForm(pokemonId))
          .thenThrow(ServerException());

      final result = await repository.getPokemonForm(pokemonId);

      expect(result, equals(Left(ServerFailure())));
      verify(() => remoteDataSource.getPokemonForm(pokemonId));
      verifyNoMoreInteractions(remoteDataSource);
    });
  });

  group('getPokemonSpecies', () {
    const pokemonId = 1;
    final pokemonSpecies =
        PokemonSpecies.fromJson(json.decode(fixture('pokemon_species.json')));

    test('should get a pokemon species from the remote data source', () async {
      when(() => remoteDataSource.getPokemonSpecies(pokemonId))
          .thenAnswer((_) async => pokemonSpecies);

      final result = await repository.getPokemonSpecies(pokemonId);

      expect(result, equals(Right(pokemonSpecies)));
      verify(() => remoteDataSource.getPokemonSpecies(pokemonId));
      verifyNoMoreInteractions(remoteDataSource);
    });

    test('should get a server failure from the remote data source', () async {
      when(() => remoteDataSource.getPokemonSpecies(pokemonId))
          .thenThrow(ServerException());

      final result = await repository.getPokemonSpecies(pokemonId);

      expect(result, equals(Left(ServerFailure())));
      verify(() => remoteDataSource.getPokemonSpecies(pokemonId));
      verifyNoMoreInteractions(remoteDataSource);
    });
  });

  group('getEvolutionChain', () {
    const pokemonId = 1;
    final evolutionChain =
        EvolutionChain.fromJson(json.decode(fixture('evolution_chain.json')));

    test('should get a evolution chain from the remote data source', () async {
      when(() => remoteDataSource.getEvolutionChain(pokemonId))
          .thenAnswer((_) async => evolutionChain);

      final result = await repository.getEvolutionChain(pokemonId);

      expect(result, equals(Right(evolutionChain)));
      verify(() => remoteDataSource.getEvolutionChain(pokemonId));
      verifyNoMoreInteractions(remoteDataSource);
    });

    test('should get a server failure from the remote data source', () async {
      when(() => remoteDataSource.getEvolutionChain(pokemonId))
          .thenThrow(ServerException());

      final result = await repository.getEvolutionChain(pokemonId);

      expect(result, equals(Left(ServerFailure())));
      verify(() => remoteDataSource.getEvolutionChain(pokemonId));
      verifyNoMoreInteractions(remoteDataSource);
    });
  });
}
