import 'package:dartz/dartz.dart';
import 'package:pokechallenge/core/error/exceptions.dart';
import 'package:pokechallenge/core/error/failures.dart';
import 'package:pokechallenge/data/data_sources/local_data_source.dart';
import 'package:pokechallenge/data/data_sources/remote_data_source.dart';
import 'package:pokechallenge/domain/models/evolution_chain.dart';
import 'package:pokechallenge/domain/models/pokemon.dart';
import 'package:pokechallenge/domain/models/pokemon_form.dart';
import 'package:pokechallenge/domain/models/pokemon_species.dart';
import 'package:pokechallenge/domain/repositories/pokemon_repository.dart';

class PokemonRepositoryImpl extends PokemonRepository {
  PokemonRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;

  @override
  Future<Either<Failure, List<Pokemon>>> getPokemonList() async {
    try {
      final pokemonListLocal = await localDataSource.getPokemonList();
      if (pokemonListLocal.isEmpty) {
        final pokemonListRemote = await remoteDataSource.getPokemonList();
        final pokemonListLocal =
            await localDataSource.savePokemonList(pokemonListRemote);
        return Right(pokemonListLocal);
      }
      return Right(pokemonListLocal);
    } on ServerException {
      return Left(ServerFailure());
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, PokemonForm>> getPokemonForm(int pokemonId) async {
    try {
      final pokemonForm = await remoteDataSource.getPokemonForm(pokemonId);
      return Right(pokemonForm);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, PokemonSpecies>> getPokemonSpecies(
      int pokemonId) async {
    try {
      final pokemonSpecies =
          await remoteDataSource.getPokemonSpecies(pokemonId);
      return Right(pokemonSpecies);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, EvolutionChain>> getEvolutionChain(
      int chainId, int pokemonId) async {
    try {
      final pokemonSpecies =
          await remoteDataSource.getEvolutionChain(chainId, pokemonId);
      return Right(pokemonSpecies);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
