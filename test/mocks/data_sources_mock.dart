import 'package:mocktail/mocktail.dart';
import 'package:pokechallenge/data/data_sources/local_data_source.dart';
import 'package:pokechallenge/data/data_sources/remote_data_source.dart';

class MockRemoteDataSource extends Mock implements RemoteDataSource {}

class MockLocalDataSource extends Mock implements LocalDataSource {}
