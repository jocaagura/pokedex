import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rxdart/rxdart.dart';

import '../enums.dart';
import 'bloc_central.dart';

class BlocTheme {
  /// This class acts like main bloc of app
  /// Singleton pattern
  static final BlocTheme _blocTheme = BlocTheme._internal();

  factory BlocTheme() => _blocTheme;

  BlocTheme._internal() {
    /// All of initial checks will be written here and
    /// will be executed once
    /// buscamos si hay un tema guardado
    defaultMaterialColor = MaterialColor(_primaryColorHexValue, {
      50: _listDefaultColors[0],
      100: _listDefaultColors[1],
      200: _listDefaultColors[2],
      300: _listDefaultColors[3],
      400: _listDefaultColors[4],
      500: _listDefaultColors[5],
      600: _listDefaultColors[6],
      700: _listDefaultColors[7],
      800: _listDefaultColors[8],
      900: _listDefaultColors[9],
    });
    _defaultFont = GoogleFonts.lato();
    loadThemeFromUserPrefs();
  }

  late TextStyle _defaultFont;

  final _themeController = BehaviorSubject<ThemeData>();
  final _themeControllerTmp = BehaviorSubject<MaterialColor?>();
  final _sizeController = BehaviorSubject<Size>();

  /// Default material color
  final int _primaryColorHexValue = 4284508017;
  final _listDefaultColors = <Color>[
    Color(4294967295),
    Color(4293325567),
    Color(4294967295),
    Color(4293322469),
    Color(4284508017),
    Color(4290032561),
    Color(4289242788),
    Color(4279858898),
    Color(4278190090),
    Color(4279572253)
  ];
  late MaterialColor defaultMaterialColor;

  MaterialColor materialColor = MaterialColor(4284508017, {
    50: Color(4294967295),
    100: Color(4293325567),
    200: Color(4294967295),
    300: Color(4293322469),
    400: Color(4284508017),
    500: Color(4290032561),
    600: Color(4289242788),
    700: Color(4279858898),
    800: Color(4278190090),
    900: Color(4279572253),
  });

  Size? sizeControl;
  double get sizeDrawer => _sizeDrawer();

  double _sizeDrawer(){
    double tmp = 100.0;
    if(modoDisplay == ModoDisplay.desktop){
      tmp = (size.width * 0.3).clamp(0, 300);
    }
    return tmp;
  }

  ModoDisplay modoDisplay = ModoDisplay.movil;

  /// setters and getters
  set theme(ThemeData themeTmp) {
    saveTheme();
    _themeController.sink.add(themeTmp);
  }

  set themeTmp(MaterialColor? themeTmp) {
    _themeControllerTmp.sink.add(themeTmp);
  }

  set size(Size sizeTmp) {
    /// Set the size of app only if is different
    if(size.width != sizeTmp.width || size.width == 1){
      if(550 < sizeTmp.width && sizeTmp.width < 800){
        modoDisplay = ModoDisplay.tablet;
      }else if(800 < sizeTmp.width && sizeTmp.width < 1900){
        modoDisplay = ModoDisplay.desktop;
      }else if(sizeTmp.width >= 1900){
        modoDisplay = ModoDisplay.tv;
      }else{
        modoDisplay = ModoDisplay.movil;
      }
      _sizeController.sink.add(sizeTmp);
    }
  }

  Size get size => _sizeController.valueOrNull ?? Size(1,1);

  ThemeData get theme => _themeController.value;

  Stream<Size?> get sizeStream => _sizeController.stream;

  Stream<ThemeData> get streamTheme => _themeController.stream;

  saveTheme() async {
    /// guardar el tema en material
    BlocCentral()
        .saveIntoSharedPreferences('primarycolor', materialColor.value);
    BlocCentral().saveIntoSharedPreferences(
        'materialcolor50', materialColor[50]?.value ?? _listDefaultColors[0]);
    BlocCentral().saveIntoSharedPreferences(
        'materialcolor100', materialColor[100]?.value ?? _listDefaultColors[1]);
    BlocCentral().saveIntoSharedPreferences(
        'materialcolor200', materialColor[200]?.value ?? _listDefaultColors[2]);
    BlocCentral().saveIntoSharedPreferences(
        'materialcolor300', materialColor[300]?.value ?? _listDefaultColors[3]);
    BlocCentral().saveIntoSharedPreferences(
        'materialcolor400', materialColor[400]?.value ?? _listDefaultColors[4]);
    BlocCentral().saveIntoSharedPreferences(
        'materialcolor500', materialColor[500]?.value ?? _listDefaultColors[5]);
    BlocCentral().saveIntoSharedPreferences(
        'materialcolor600', materialColor[600]?.value ?? _listDefaultColors[6]);
    BlocCentral().saveIntoSharedPreferences(
        'materialcolor700', materialColor[700]?.value ?? _listDefaultColors[7]);
    BlocCentral().saveIntoSharedPreferences(
        'materialcolor800', materialColor[800]?.value ?? _listDefaultColors[8]);
    BlocCentral().saveIntoSharedPreferences(
        'materialcolor900', materialColor[900]?.value ?? _listDefaultColors[9]);
  }

  themeFromMaterial(MaterialColor? materialColor) {
    this.materialColor = materialColor ?? defaultMaterialColor;
    if (materialColor is MaterialColor) {
      theme = ThemeData(
          fontFamily: _defaultFont.fontFamily ?? 'Opensans',
          primarySwatch: materialColor,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          canvasColor: materialColor[50],
          scaffoldBackgroundColor: materialColor[50],
          cardColor: materialColor[100],
          buttonColor: materialColor[100],
          dividerColor: materialColor[500],
          splashColor: materialColor[500],
          unselectedWidgetColor: materialColor[800],
          bottomAppBarColor: materialColor[50],
          textTheme: TextTheme(
            bodyText1: TextStyle(color: materialColor[900]),
            bodyText2: TextStyle(color: materialColor[900]),
            headline1: TextStyle(color: materialColor[800]),
            headline2: TextStyle(color: materialColor[800]),
            headline3: TextStyle(color: materialColor[800]),
            headline4: TextStyle(color: materialColor[800]),
            headline5: TextStyle(color: materialColor[900]),
            headline6: TextStyle(color: materialColor[900]),
            subtitle1: TextStyle(color: materialColor[900]),
            subtitle2: TextStyle(color: materialColor[900]),
            caption: TextStyle(color: materialColor[800]),
            overline: TextStyle(color: materialColor[800]),
          ));
    }
  }

  resetTema() {
    themeFromMaterial(defaultMaterialColor);
  }

  /// Load custom theme from user
  loadThemeFromUserPrefs() async {
    materialColor = defaultMaterialColor;
    _themeController.sink.add(ThemeData(
        fontFamily: _defaultFont.fontFamily ?? 'Opensans',
        primarySwatch: materialColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        canvasColor: materialColor[50],
        scaffoldBackgroundColor: materialColor[50],
        cardColor: materialColor[100],
        buttonColor: materialColor[100],
        dividerColor: materialColor[500],
        splashColor: materialColor[500],
        unselectedWidgetColor: materialColor[800],
        bottomAppBarColor: materialColor[50],
        textTheme: TextTheme(
          bodyText1: TextStyle(color: materialColor[900]),
          bodyText2: TextStyle(color: materialColor[900]),
          headline1: TextStyle(color: materialColor[800]),
          headline2: TextStyle(color: materialColor[800]),
          headline3: TextStyle(color: materialColor[800]),
          headline4: TextStyle(color: materialColor[800]),
          headline5: TextStyle(color: materialColor[900]),
          headline6: TextStyle(color: materialColor[900]),
          subtitle1: TextStyle(color: materialColor[900]),
          subtitle2: TextStyle(color: materialColor[900]),
          caption: TextStyle(color: materialColor[800]),
          overline: TextStyle(color: materialColor[800]),
        )));

    if (!kIsWeb) {
      try {
        int primaryColor = await BlocCentral().getIntValue('primarycolor') != 0
            ? await BlocCentral().getIntValue('primarycolor')
            : _primaryColorHexValue;
        int materialColor50 =
            await BlocCentral().getIntValue('materialcolor50') != 0
                ? await BlocCentral().getIntValue('primarycolor')
                : _listDefaultColors[0].value;
        int materialColor100 =
            await BlocCentral().getIntValue('materialcolor100') != 0
                ? await BlocCentral().getIntValue('materialcolor100')
                : _listDefaultColors[1].value;
        int materialColor200 =
            await BlocCentral().getIntValue('materialcolor200') != 0
                ? await BlocCentral().getIntValue('materialcolor200')
                : _listDefaultColors[2].value;
        int materialColor300 =
            await BlocCentral().getIntValue('materialcolor300') != 0
                ? await BlocCentral().getIntValue('materialcolor300')
                : _listDefaultColors[3].value;
        int materialColor400 =
            await BlocCentral().getIntValue('materialcolor400') != 0
                ? await BlocCentral().getIntValue('materialcolor400')
                : _listDefaultColors[4].value;
        int materialColor500 =
            await BlocCentral().getIntValue('materialcolor500') != 0
                ? await BlocCentral().getIntValue('materialcolor500')
                : _listDefaultColors[5].value;
        int materialColor600 =
            await BlocCentral().getIntValue('materialcolor600') != 0
                ? await BlocCentral().getIntValue('materialcolor600')
                : _listDefaultColors[6].value;
        int materialColor700 =
            await BlocCentral().getIntValue('materialcolor700') != 0
                ? await BlocCentral().getIntValue('materialcolor700')
                : _listDefaultColors[7].value;
        int materialColor800 =
            await BlocCentral().getIntValue('materialcolor800') != 0
                ? await BlocCentral().getIntValue('materialcolor800')
                : _listDefaultColors[8].value;
        int materialColor900 =
            await BlocCentral().getIntValue('materialcolor900') != 0
                ? await BlocCentral().getIntValue('materialcolor900')
                : _listDefaultColors[9].value;
        themeFromMaterial(MaterialColor(primaryColor, {
          50: Color(materialColor50),
          100: Color(materialColor100),
          200: Color(materialColor200),
          300: Color(materialColor300),
          400: Color(materialColor400),
          500: Color(materialColor500),
          600: Color(materialColor600),
          700: Color(materialColor700),
          800: Color(materialColor800),
          900: Color(materialColor900),
        }));
      } catch (e) {
        resetTema();
      }
    }
  }

  /// Lighten or darken a color
  Color darkenColor(Color color, {double amount = .1}) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(color);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

    return hslDark.toColor();
  }

  Color lightenColor(Color color, {double amount = .1}) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(color);
    final hslLight =
        hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));
    return hslLight.toColor();
  }

  /// [themeFromRGB] generaa un ThemeData desde los valores aportados por el usuario para
  /// el tema desde RGB
  themeFromRGB(int r, int g, int b) {
    try {
      Map<int, Color> colorMap = {
        50: lightenColor(Color.fromRGBO(r, g, b, 1.0), amount: .5),
        100: lightenColor(Color.fromRGBO(r, g, b, 1.0), amount: .35),
        200: lightenColor(Color.fromRGBO(r, g, b, 1.0), amount: .25),
        300: lightenColor(Color.fromRGBO(r, g, b, 1.0), amount: .1),
        400: Color.fromRGBO(r, g, b, 1.0),
        500: darkenColor(Color.fromRGBO(r, g, b, 1.0), amount: .1),
        600: darkenColor(Color.fromRGBO(r, g, b, 1.0), amount: .15),
        700: darkenColor(Color.fromRGBO(r, g, b, 1.0), amount: .25),
        800: darkenColor(Color.fromRGBO(r, g, b, 1.0), amount: .375),
        900: darkenColor(Color.fromRGBO(r, g, b, 1.0), amount: .45)
      };
      MaterialColor colorJoao = MaterialColor(
          int.parse(
              Color.fromRGBO(r, g, b, 1.0)
                  .toString()
                  .replaceAll('Color(', '')
                  .replaceAll(')', '')
                  .substring(2),
              radix: 16),
          colorMap);
      materialColor = colorJoao;
      themeFromMaterial(materialColor);
    } catch (e) {
      resetTema();
    }
  }

  dispose() {
    _themeController.close();
    _themeControllerTmp.close();
    _sizeController.close();
  }
}
