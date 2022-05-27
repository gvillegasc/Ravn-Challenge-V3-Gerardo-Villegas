part of 'internet_connection_bloc.dart';

abstract class InternetConnectionEvent extends Equatable {
  const InternetConnectionEvent();

  @override
  List<Object> get props => [];
}

class OnConnectionStatus extends InternetConnectionEvent {
  const OnConnectionStatus(this.connectionStatus);

  final DataConnectionStatus connectionStatus;

  @override
  List<Object> get props => [connectionStatus];
}
