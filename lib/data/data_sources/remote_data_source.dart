import 'dart:convert';

import 'package:graphql/client.dart';
import 'package:pokechallenge/app_config.dart';
import 'package:pokechallenge/domain/models/pokemon.dart';
import 'package:pokechallenge/domain/models/pokemon_form.dart';
import 'package:http/http.dart' as http;

class RequestHttpType {
  static const String get = 'get';
  static const String post = 'post';
  static const String put = 'put';
  static const String delete = 'delete';
}

abstract class RemoteDataSource {
  Future<List<Pokemon>> getPokemonList();
  Future<PokemonForm> getPokemonForm(int pokemonId);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  RemoteDataSourceImpl({
    required this.graphqlClient,
    required this.httpClient,
  });

  final GraphQLClient graphqlClient;
  final http.Client httpClient;

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

  @override
  Future<PokemonForm> getPokemonForm(int pokemonId) async {
    final resp = await _apiHttpRequest('/pokemon-form/$pokemonId');
    if (resp.statusCode == 200) {
      final decodedData = json.decode(resp.body);
      final pokemonForm = PokemonForm.fromJson(decodedData);
      return pokemonForm;
    } else {
      throw const ServerException();
    }
  }

  Future<http.Response> _apiHttpRequest(
    String endpoint, {
    String type = RequestHttpType.get,
    Map<String, dynamic>? body,
  }) async {
    final apiHost = AppConfig.instance.apiRest;

    final headers = {
      'Content-Type': 'application/json',
    };

    final url = Uri.parse('$apiHost$endpoint');

    http.Response resp;

    switch (type) {
      case RequestHttpType.get:
        resp = await httpClient.get(url, headers: headers);
        return resp;
      case RequestHttpType.post:
        resp = await httpClient.post(url,
            headers: headers, body: json.encode(body));
        return resp;
      default:
        resp = await http.get(url, headers: headers);
        return resp;
    }
  }
}
