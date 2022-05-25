part of 'pokemon_list_bloc.dart';

abstract class PokemonListEvent extends Equatable {
  const PokemonListEvent();

  @override
  List<Object> get props => [];
}

class OnGetPokemonList extends PokemonListEvent {
  const OnGetPokemonList();

  @override
  List<Object> get props => [];
}

class OnSearchPokemon extends PokemonListEvent {
  const OnSearchPokemon(this.word);

  final String word;

  @override
  List<Object> get props => [word];
}
