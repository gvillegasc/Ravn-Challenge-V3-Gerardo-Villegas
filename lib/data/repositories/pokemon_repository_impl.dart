import 'package:dartz/dartz.dart';
import 'package:pokechallenge/core/error/exceptions.dart';
import 'package:pokechallenge/core/error/failures.dart';
import 'package:pokechallenge/data/data_sources/local_data_source.dart';
import 'package:pokechallenge/data/data_sources/remote_data_source.dart';
import 'package:pokechallenge/domain/models/pokemon.dart';
import 'package:pokechallenge/domain/repositories/pokemon_repository.dart';

class PokemonRepositoryImpl extends PokemonRepository {
  PokemonRepositoryImpl({
    required this.remoteDataSource,
    required this.locaDataSource,
  });

  final RemoteDataSource remoteDataSource;
  final LocalDataSource locaDataSource;

  @override
  Future<Either<Failure, List<Pokemon>>> getPokemonList() async {
    try {
      final pokemonListLocal = await locaDataSource.getPokemonList();
      if (pokemonListLocal.isEmpty) {
        final pokemonListRemote = await remoteDataSource.getPokemonList();
        return Right(pokemonListRemote);
      }
      return Right(pokemonListLocal);
    } on ServerException {
      return Left(ServerFailure());
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, List<Pokemon>>> savePokemonList() {
    throw UnimplementedError();
  }
}
