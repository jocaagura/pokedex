import 'models/model_version.dart';

class Config {
  /// Singleton pattern
  static final Config _config = Config._internal();

  factory Config() => _config;

  Config._internal();

  /// [kVersion] keep our control over app version control from external repository
  final kVersion = ModelVersion(
    id: '2',
    versionApp: 1,
    version: "0.0.1",
    url: "https://jocaagura.com",
    nombre: "com.jocaagura.base_dev",
  );
  final String nombreTablaVersion = 'apps';
}
