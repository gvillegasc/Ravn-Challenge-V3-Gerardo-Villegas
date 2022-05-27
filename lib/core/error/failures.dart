import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object> get props => [];
}

class NetworkFailure extends Failure {}

class ServerFailure extends Failure {}

class CacheFailure extends Failure {}

class UnauthorizedFailure extends Failure {}

class RequestFailure extends Failure {}
