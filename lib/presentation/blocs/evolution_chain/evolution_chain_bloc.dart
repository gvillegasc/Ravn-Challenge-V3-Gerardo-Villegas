import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pokechallenge/domain/models/evolution_chain.dart';
import 'package:pokechallenge/domain/use_cases/get_evolution_chain.dart';

part 'evolution_chain_event.dart';
part 'evolution_chain_state.dart';

class EvolutionChainBloc
    extends Bloc<EvolutionChainEvent, EvolutionChainState> {
  EvolutionChainBloc({
    required this.getEvolutionChain,
  }) : super(const EvolutionChainInitial()) {
    on<OnGetEvolutionChain>(_onGetEvolutionChain);
  }

  final GetEvolutionChain getEvolutionChain;

  Future<void> _onGetEvolutionChain(
      OnGetEvolutionChain event, Emitter emit) async {
    emit(const LoadingEvolutionChain());
    final failureOrEvolutionChain = await getEvolutionChain(
        GetEvolutionChainParams(
            chainId: event.chainId, pokemonId: event.pokemonId));
    emit(
      failureOrEvolutionChain.fold(
          (failure) => const LoadErrorEvolutionChain(),
          (evolutionChain) =>
              LoadedEvolutionChain(evolutionChain: evolutionChain)),
    );
  }
}
