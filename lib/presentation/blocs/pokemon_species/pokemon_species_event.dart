part of 'pokemon_species_bloc.dart';

abstract class PokemonSpeciesEvent extends Equatable {
  const PokemonSpeciesEvent();

  @override
  List<Object> get props => [];
}

class OnGetPokemonSpecies extends PokemonSpeciesEvent {
  const OnGetPokemonSpecies(this.pokemonId);

  final int pokemonId;

  @override
  List<Object> get props => [pokemonId];
}
