part of 'pokemon_list_bloc.dart';

abstract class PokemonListState extends Equatable {
  const PokemonListState();

  @override
  List<Object> get props => [];
}

class PokemonListInitial extends PokemonListState {
  const PokemonListInitial();

  @override
  List<Object> get props => [];
}

class LoadedPokemonList extends PokemonListState {
  const LoadedPokemonList({required this.pokemonList});

  final List<Pokemon> pokemonList;

  @override
  List<Object> get props => [pokemonList];
}

class LoadingPokemonList extends PokemonListState {
  const LoadingPokemonList();

  @override
  List<Object> get props => [];
}

class LoadErrorPokemonList extends PokemonListState {
  const LoadErrorPokemonList();

  @override
  List<Object> get props => [];
}

class SearchEmptyPokemonList extends PokemonListState {
  const SearchEmptyPokemonList();

  @override
  List<Object> get props => [];
}

class SearchResultPokemonList extends PokemonListState {
  const SearchResultPokemonList({required this.pokemonList});

  final List<Pokemon> pokemonList;

  @override
  List<Object> get props => [pokemonList];
}
