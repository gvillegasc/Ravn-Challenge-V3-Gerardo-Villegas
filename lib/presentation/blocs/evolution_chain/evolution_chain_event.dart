part of 'evolution_chain_bloc.dart';

abstract class EvolutionChainEvent extends Equatable {
  const EvolutionChainEvent();

  @override
  List<Object> get props => [];
}

class OnGetEvolutionChain extends EvolutionChainEvent {
  const OnGetEvolutionChain(this.chainId, this.pokemonId);

  final int chainId;
  final int pokemonId;

  @override
  List<Object> get props => [chainId, pokemonId];
}
