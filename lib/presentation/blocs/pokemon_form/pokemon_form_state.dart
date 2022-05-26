part of 'pokemon_form_bloc.dart';

abstract class PokemonFormState extends Equatable {
  const PokemonFormState();

  @override
  List<Object> get props => [];
}

class PokemonFormInitial extends PokemonFormState {
  const PokemonFormInitial();

  @override
  List<Object> get props => [];
}

class LoadedPokemonForm extends PokemonFormState {
  const LoadedPokemonForm({required this.pokemonForm});

  final PokemonForm pokemonForm;

  @override
  List<Object> get props => [pokemonForm];
}

class LoadingPokemonForm extends PokemonFormState {
  const LoadingPokemonForm();

  @override
  List<Object> get props => [];
}

class LoadErrorPokemonForm extends PokemonFormState {
  const LoadErrorPokemonForm();

  @override
  List<Object> get props => [];
}
