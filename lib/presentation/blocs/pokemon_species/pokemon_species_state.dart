part of 'pokemon_species_bloc.dart';

abstract class PokemonSpeciesState extends Equatable {
  const PokemonSpeciesState();

  @override
  List<Object> get props => [];
}

class PokemonSpeciesInitial extends PokemonSpeciesState {
  const PokemonSpeciesInitial();

  @override
  List<Object> get props => [];
}

class LoadedPokemonSpecies extends PokemonSpeciesState {
  const LoadedPokemonSpecies({required this.pokemonSpecies});

  final PokemonSpecies pokemonSpecies;

  @override
  List<Object> get props => [pokemonSpecies];
}

class LoadingPokemonSpecies extends PokemonSpeciesState {
  const LoadingPokemonSpecies();

  @override
  List<Object> get props => [];
}

class LoadErrorPokemonSpecies extends PokemonSpeciesState {
  const LoadErrorPokemonSpecies();

  @override
  List<Object> get props => [];
}
