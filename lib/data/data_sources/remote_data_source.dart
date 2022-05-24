import 'package:graphql/client.dart';
import 'package:pokechallenge/domain/models/pokemon.dart';

class RequestHttpType {
  static const String get = 'get';
  static const String post = 'post';
  static const String put = 'put';
  static const String delete = 'delete';
}

abstract class RemoteDataSource {
  Future<List<Pokemon>> getPokemonList();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  RemoteDataSourceImpl({
    required this.graphqlClient,
  });

  final GraphQLClient graphqlClient;

  @override
  Future<List<Pokemon>> getPokemonList() async {
    const readListPokemon = r'''
                            query ListPokemonQuery {
                              allPokemon {
                                id,
                                name,
                                types {
                                  name
                                },
                                generation,
                                sprites {
                                  front_default
                                }
                              }
                            }
                            ''';

    final options = QueryOptions(
      document: gql(readListPokemon),
    );

    final result = await graphqlClient.query(options);

    if (result.hasException) {
      throw const ServerException();
    } else {
      final pokemonList =
          PokemonMapper.fromJsonList(result.data!['allPokemon']);
      return pokemonList.items;
    }
  }
}
