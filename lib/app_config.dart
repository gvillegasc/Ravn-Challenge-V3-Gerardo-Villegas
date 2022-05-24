class AppConfig {
  AppConfig();
  AppConfig._internal();

  void init({
    required String database,
  }) {
    _database = database;
  }

  late String _database;

  static final AppConfig _instance = AppConfig._internal();

  static AppConfig get instance => _instance;
  String get database => _database;
}
