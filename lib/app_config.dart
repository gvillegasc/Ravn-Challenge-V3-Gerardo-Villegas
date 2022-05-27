class AppConfig {
  AppConfig();
  AppConfig._internal();

  void init({
    required String database,
    required String apiGraphql,
    required String apiRest,
  }) {
    _database = database;
    _apiGraphql = apiGraphql;
    _apiRest = apiRest;
  }

  late String _database;
  late String _apiGraphql;
  late String _apiRest;

  static final AppConfig _instance = AppConfig._internal();

  static AppConfig get instance => _instance;
  String get database => _database;
  String get apiGraphql => _apiGraphql;
  String get apiRest => _apiRest;
}
