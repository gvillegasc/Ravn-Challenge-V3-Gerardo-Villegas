import 'package:mocktail/mocktail.dart';
import 'package:pokechallenge/domain/use_cases/get_evolution_chain.dart';
import 'package:pokechallenge/domain/use_cases/get_pokemon_form.dart';
import 'package:pokechallenge/domain/use_cases/get_pokemon_list.dart';
import 'package:pokechallenge/domain/use_cases/get_pokemon_species.dart';

class MockGetPokemonList extends Mock implements GetPokemonList {}

class MockGetPokemonForm extends Mock implements GetPokemonForm {}

class MockGetPokemonSpecies extends Mock implements GetPokemonSpecies {}

class MockGetEvolutionChain extends Mock implements GetEvolutionChain {}
