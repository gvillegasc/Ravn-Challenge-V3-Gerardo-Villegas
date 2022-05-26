part of 'pokemon_form_bloc.dart';

abstract class PokemonFormEvent extends Equatable {
  const PokemonFormEvent();

  @override
  List<Object> get props => [];
}

class OnGetPokemonForm extends PokemonFormEvent {
  const OnGetPokemonForm(this.pokemonId);

  final int pokemonId;

  @override
  List<Object> get props => [pokemonId];
}
