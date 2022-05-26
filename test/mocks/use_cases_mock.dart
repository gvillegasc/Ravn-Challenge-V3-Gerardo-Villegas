import 'package:mocktail/mocktail.dart';
import 'package:pokechallenge/domain/use_cases/get_pokemon_form.dart';
import 'package:pokechallenge/domain/use_cases/get_pokemon_list.dart';

class MockGetPokemonList extends Mock implements GetPokemonList {}

class MockGetPokemonForm extends Mock implements GetPokemonForm {}
