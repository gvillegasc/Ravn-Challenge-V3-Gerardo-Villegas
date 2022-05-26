import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pokechallenge/domain/models/pokemon_species.dart';
import 'package:pokechallenge/domain/use_cases/get_pokemon_species.dart';

part 'pokemon_species_event.dart';
part 'pokemon_species_state.dart';

class PokemonSpeciesBloc
    extends Bloc<PokemonSpeciesEvent, PokemonSpeciesState> {
  PokemonSpeciesBloc({
    required this.getPokemonSpecies,
  }) : super(const PokemonSpeciesInitial()) {
    on<OnGetPokemonSpecies>(_onGetPokemonSpecies);
  }

  final GetPokemonSpecies getPokemonSpecies;

  Future<void> _onGetPokemonSpecies(
      OnGetPokemonSpecies event, Emitter emit) async {
    emit(const LoadingPokemonSpecies());
    final failureOrPokemonSpecies = await getPokemonSpecies(
        GetPokemonSpeciesParams(pokemonId: event.pokemonId));
    emit(
      failureOrPokemonSpecies.fold(
          (failure) => const LoadErrorPokemonSpecies(),
          (pokemonSpecies) =>
              LoadedPokemonSpecies(pokemonSpecies: pokemonSpecies)),
    );
  }
}
