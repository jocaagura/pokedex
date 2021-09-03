class ModelVersion {
  String id;
  String nombre;
  String url;
  String version;
  int versionApp;

  ModelVersion({
    this.id = '',
    this.nombre = '',
    this.url = 'https//:jocaagura.com',
    this.version = '0.0.1',
    this.versionApp = 1,
  });

  factory ModelVersion.fromJson(Map<String, dynamic> json) => ModelVersion(
    id: json["id"].toString(),
    nombre: json["nombre"].toString(),
    url: json["url"].toString(),
    version: json["version"].toString(),
    versionApp: int.parse(json["versionApp"].toString()),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nombre": nombre,
    "url": url,
    "version": version,
    "versionApp": versionApp,
  };
}