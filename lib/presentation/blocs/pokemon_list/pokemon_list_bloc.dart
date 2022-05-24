import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pokechallenge/domain/models/pokemon.dart';
import 'package:pokechallenge/domain/use_cases/get_pokemon_list.dart';
import 'package:pokechallenge/domain/use_cases/use_case.dart';

part 'pokemon_list_event.dart';
part 'pokemon_list_state.dart';

class PokemonListBloc extends Bloc<PokemonListEvent, PokemonListState> {
  PokemonListBloc({
    required this.getPokemonList,
  }) : super(const PokemonListInitial()) {
    on<OnGetPokemonList>(_onGetPokemonList);
  }

  final GetPokemonList getPokemonList;

  Future<void> _onGetPokemonList(OnGetPokemonList event, Emitter emit) async {
    emit(const LoadingPokemonList());
    final failureOrPokemonList = await getPokemonList(NoParams());
    emit(
      failureOrPokemonList.fold(
        (failure) => const LoadErrorPokemonList(),
        (pokemonList) => LoadedPokemonList(pokemonList: pokemonList),
      ),
    );
  }
}
