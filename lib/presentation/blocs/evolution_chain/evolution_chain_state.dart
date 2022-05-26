part of 'evolution_chain_bloc.dart';

abstract class EvolutionChainState extends Equatable {
  const EvolutionChainState();

  @override
  List<Object> get props => [];
}

class EvolutionChainInitial extends EvolutionChainState {
  const EvolutionChainInitial();

  @override
  List<Object> get props => [];
}

class LoadedEvolutionChain extends EvolutionChainState {
  const LoadedEvolutionChain({required this.evolutionChain});

  final EvolutionChain evolutionChain;

  @override
  List<Object> get props => [EvolutionChain];
}

class LoadingEvolutionChain extends EvolutionChainState {
  const LoadingEvolutionChain();

  @override
  List<Object> get props => [];
}

class LoadErrorEvolutionChain extends EvolutionChainState {
  const LoadErrorEvolutionChain();

  @override
  List<Object> get props => [];
}
