import 'package:get_it/get_it.dart';
import 'package:graphql/client.dart';
import 'package:pokechallenge/app_config.dart';
import 'package:pokechallenge/data/data_sources/local_data_source.dart';
import 'package:pokechallenge/data/data_sources/remote_data_source.dart';
import 'package:pokechallenge/data/repositories/pokemon_repository_impl.dart';
import 'package:pokechallenge/domain/repositories/pokemon_repository.dart';
import 'package:pokechallenge/domain/use_cases/get_pokemon_list.dart';
import 'package:pokechallenge/presentation/blocs/pokemon_list/pokemon_list_bloc.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  // Blocs
  getIt.registerLazySingleton(
    () => PokemonListBloc(
      getPokemonList: getIt<GetPokemonList>(),
    ),
  );

  // Use cases
  getIt.registerLazySingleton(
    () => GetPokemonList(
      getIt<PokemonRepository>(),
    ),
  );

  // Repository
  getIt.registerLazySingleton<PokemonRepository>(
    () => PokemonRepositoryImpl(
      remoteDataSource: getIt<RemoteDataSource>(),
      localDataSource: getIt<LocalDataSource>(),
    ),
  );

  // Datasource
  getIt.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSourceImpl(graphqlClient: getIt()),
  );
  getIt.registerLazySingleton<LocalDataSource>(
    () => LocalDataSourceImpl(),
  );

  // External
  getIt.registerLazySingleton(
    () => GraphQLClient(
      cache: GraphQLCache(),
      link: HttpLink(
        AppConfig.instance.apiGraphql,
      ),
    ),
  );
}
