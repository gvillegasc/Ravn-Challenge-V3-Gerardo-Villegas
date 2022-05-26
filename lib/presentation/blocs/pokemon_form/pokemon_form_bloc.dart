import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pokechallenge/domain/models/pokemon_form.dart';
import 'package:pokechallenge/domain/use_cases/get_pokemon_form.dart';

part 'pokemon_form_event.dart';
part 'pokemon_form_state.dart';

class PokemonFormBloc extends Bloc<PokemonFormEvent, PokemonFormState> {
  PokemonFormBloc({required this.getPokemonForm})
      : super(const PokemonFormInitial()) {
    on<OnGetPokemonForm>(_onGetPokemonForm);
  }

  final GetPokemonForm getPokemonForm;

  Future<void> _onGetPokemonForm(OnGetPokemonForm event, Emitter emit) async {
    emit(const LoadingPokemonForm());
    final failureOrPokemonForm =
        await getPokemonForm(GetPokemonFormParams(pokemonId: event.pokemonId));
    emit(
      failureOrPokemonForm.fold((failure) => const LoadErrorPokemonForm(),
          (pokemonForm) => LoadedPokemonForm(pokemonForm: pokemonForm)),
    );
  }
}
