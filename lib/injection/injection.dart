import 'package:get_it/get_it.dart';
import 'package:graphql/client.dart';
import 'package:pokechallenge/app_config.dart';
import 'package:pokechallenge/data/data_sources/local_data_source.dart';
import 'package:pokechallenge/data/data_sources/remote_data_source.dart';
import 'package:pokechallenge/data/repositories/pokemon_repository_impl.dart';
import 'package:pokechallenge/domain/repositories/pokemon_repository.dart';
import 'package:pokechallenge/domain/use_cases/get_evolution_chain.dart';
import 'package:pokechallenge/domain/use_cases/get_pokemon_form.dart';
import 'package:pokechallenge/domain/use_cases/get_pokemon_list.dart';
import 'package:pokechallenge/domain/use_cases/get_pokemon_species.dart';
import 'package:pokechallenge/presentation/blocs/evolution_chain/evolution_chain_bloc.dart';
import 'package:pokechallenge/presentation/blocs/internet_connection/internet_connection_bloc.dart';
import 'package:pokechallenge/presentation/blocs/pokemon_form/pokemon_form_bloc.dart';
import 'package:pokechallenge/presentation/blocs/pokemon_list/pokemon_list_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:pokechallenge/presentation/blocs/pokemon_species/pokemon_species_bloc.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  // Blocs
  getIt.registerLazySingleton(
    () => PokemonListBloc(
      getPokemonList: getIt<GetPokemonList>(),
    ),
  );
  getIt.registerLazySingleton(
    () => PokemonFormBloc(
      getPokemonForm: getIt<GetPokemonForm>(),
    ),
  );
  getIt.registerLazySingleton(
    () => PokemonSpeciesBloc(
      getPokemonSpecies: getIt<GetPokemonSpecies>(),
    ),
  );
  getIt.registerLazySingleton(
    () => EvolutionChainBloc(
      getEvolutionChain: getIt<GetEvolutionChain>(),
    ),
  );
  getIt.registerLazySingleton(
    () => InternetConnectionBloc(),
  );

  // Use cases
  getIt.registerLazySingleton(
    () => GetPokemonList(
      getIt<PokemonRepository>(),
    ),
  );
  getIt.registerLazySingleton(
    () => GetPokemonForm(
      getIt<PokemonRepository>(),
    ),
  );
  getIt.registerLazySingleton(
    () => GetPokemonSpecies(
      getIt<PokemonRepository>(),
    ),
  );
  getIt.registerLazySingleton(
    () => GetEvolutionChain(
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
    () => RemoteDataSourceImpl(
      graphqlClient: getIt(),
      httpClient: getIt(),
    ),
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
  getIt.registerLazySingleton(() => http.Client());
}
