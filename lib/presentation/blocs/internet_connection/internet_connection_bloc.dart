import 'package:bloc/bloc.dart';
import 'package:data_connection_checker_nulls/data_connection_checker_nulls.dart';
import 'package:equatable/equatable.dart';

part 'internet_connection_event.dart';
part 'internet_connection_state.dart';

class InternetConnectionBloc
    extends Bloc<InternetConnectionEvent, InternetConnectionState> {
  InternetConnectionBloc() : super(const InternetConnectionInitial()) {
    on<OnConnectionStatus>(_onConnectionStatus);
  }

  Future<void> _onConnectionStatus(
      OnConnectionStatus event, Emitter emit) async {
    if (event.connectionStatus == DataConnectionStatus.disconnected) {
      emit(const InternetDisconnected());
    } else {
      emit(const InternetConnected());
    }
  }
}
