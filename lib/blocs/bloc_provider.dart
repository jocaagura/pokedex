import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import '../config.dart';
import '../models/model_version.dart';
import '../pages/home_page.dart';

class BlocProvider {
  /// [drawerMenu] permite saber si el menu esta expandido
  /// o contraido
  bool drawerMenu = false;

  /// [showMenu] permite mostrar u ocultar el menú
  bool showMenu = true;

  /// [cover] Contiene el widget que se muestra en la parte frontal del
  /// menu desplegable
  Widget _cover = Image.asset('assets/logo.png');

  set cover(Widget tmp) {
    print('Seteado');
    _cover = tmp;
  }

  Widget get cover => _cover;

  // usamos el patron singleton para mantener la información completa del provider
  static final BlocProvider _blocProvider = BlocProvider._internal();

  /// Zona de controladores
  final _navigatorController = BehaviorSubject<Map<String, Widget>?>();
  final _loadingMessageController = BehaviorSubject<String?>();
  final _versionController = BehaviorSubject<ModelVersion?>();

  List<String> historial = [];

  addToHistory(String clave) {
    List<String> listaTmp = [];
    if (historial.length > 0) {
      historial.forEach((pagina) {
        if (pagina != clave) {
          listaTmp.add(pagina);
        }
      });
    }
    listaTmp.add(clave);
    historial = listaTmp;
  }

  removeFromHistory(String clave) {
    historial.remove(clave);
  }

  /// setters para los controladores
  set navigatorMap(Map<String, Widget>? mapaNavegacionTmp) {
    if (mapaNavegacionTmp == null) {
      final Map<String, Widget> tmp = new Map();
      historial = ["home"];
      tmp["home"] = HomePage();
      mapaNavegacionTmp = tmp;
    }
    _navigatorController.sink.add(mapaNavegacionTmp);
  }

  mostrarMenuSuperior([bool mostrar = true]) {
    showMenu = mostrar;
  }

  /// [loadingMessage] muestra la pagina de procesamiento
  /// para la pantalla de carga
  set loadingMessage(String? mensajeCarga) {
    _loadingMessageController.sink.add(mensajeCarga);
  }

  Future<void> cargando2(String mensajeCarga) async {
    loadingMessage = mensajeCarga;
    await Future.delayed(Duration(milliseconds: 500));
    return;
  }

  String? get loadingMessage => _cargandoCtrl();

  String? _cargandoCtrl() {
    if (_loadingMessageController.valueOrNull != null) {
      return _loadingMessageController.valueOrNull;
    }
    return '';
  }

  /// streams
  Stream<Map<String, Widget>?> get navigatorMapStream =>
      _navigatorController.stream;

  Stream<String?> get loadingStream => _loadingMessageController.stream;

  addPage(String nombrePagina, Widget pagina, [bool pop = false]) {
    /// se agrega la pagina a la ruta de navegacion impidiendo que se duplique el widget
    if (pop) {
      removePage(historial.last);
    }
    addToHistory(nombrePagina);
    showMenu = true;
  }

  removePage(String clave) {
    /// se agrega la pagina a la ruta de navegacion impidiendo que se duplique el widget
    removeFromHistory(clave);
  }

  /// limpiar mapaNavegacion
  clearNavigatorMap() {
    navigatorMap = null;
  }

  final Map<String, Function> backFunction = {};

  agregarFuncionesAtras(String key, Function funcion) {
    backFunction[key] = funcion;
  }

  removerFuncionesAtras(String key) {
    backFunction.remove(key);
  }

  Future<bool> back() async {
    if (loadingMessage != '') {
      return false;
    }
    removePage(historial.last);
    return false;
  }

  factory BlocProvider() {
    return _blocProvider;
  }

  BlocProvider._internal() {
    init();
  }

  void init() {
    // inicializamos la clase aqui
    navigatorMap = null;
    loadingMessage = '';
    _suscribirVersion();
  }

  // Aqui vamos a agregar las cosas relacionadas con la aplicacion

  /// sistema de versiones
  dispose() {
    _navigatorController.close();
    _loadingMessageController.close();
    _versionController.close();

    /// Subscripciones
    _version?.cancel();
  }

  /// para el procesador de carga
  bool? processLoad = false;
  StreamSubscription? _version;

  _suscribirVersion() {
    /// TODO: generar verificacion de version online para la app
  }

  bool actualizar() {
    bool tmp = false;
    if (modeloVersion != null) {
      if (modeloVersion!.versionApp > Config().kVersion.versionApp) {
        tmp = true;
      }
    }
    return tmp;
  }

  set modelVersion(ModelVersion? modeloVersionTmp) {
    _versionController.sink.add(modeloVersionTmp);
  }

  ModelVersion? get modeloVersion => _versionController.value;

  Stream<ModelVersion?> get modeloVersionStream => _versionController.stream;

  /// [guardarEstadoApp] guarda el estado actual de la app para
  /// re-activar en el lugar que estabamos
  guardarEstadoApp() async {}
}
