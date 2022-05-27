part of 'internet_connection_bloc.dart';

abstract class InternetConnectionState extends Equatable {
  const InternetConnectionState();

  @override
  List<Object> get props => [];
}

class InternetConnectionInitial extends InternetConnectionState {
  const InternetConnectionInitial();

  @override
  List<Object> get props => [];
}

class InternetConnected extends InternetConnectionInitial {
  const InternetConnected();

  @override
  List<Object> get props => [];
}

class InternetDisconnected extends InternetConnectionInitial {
  const InternetDisconnected();

  @override
  List<Object> get props => [];
}
