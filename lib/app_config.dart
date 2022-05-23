class AppConfig {
  AppConfig();
  AppConfig._internal();

  void init() {}

  static final AppConfig _instance = AppConfig._internal();

  static AppConfig get instance => _instance;
}
