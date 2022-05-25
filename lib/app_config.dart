class AppConfig {
  AppConfig();
  AppConfig._internal();

  void init({
    required String database,
    required String apiGraphql,
  }) {
    _database = database;
    _apiGraphql = apiGraphql;
  }

  late String _database;
  late String _apiGraphql;

  static final AppConfig _instance = AppConfig._internal();

  static AppConfig get instance => _instance;
  String get database => _database;
  String get apiGraphql => _apiGraphql;
}
