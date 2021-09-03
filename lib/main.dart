import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

import './pages/landing_page.dart';
import '../../blocs/bloc_central.dart';

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    FlutterError.onError = (FlutterErrorDetails details) {
      FlutterError.dumpErrorToConsole(details);
      exit(1);
    };
    runApp(MyApp());
  }, (Object error, StackTrace stack) {
    print('Some unknow error');
    print(error);
    print(stack);
    exit(1);
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ThemeData>(
        stream: BlocCentral().streamTheme,
        builder: (context, snapshot) {
          return MaterialApp(
            title: 'Portfolio Albert J. Jiménez P.',
            debugShowCheckedModeBanner: false,
            theme: snapshot.data ??
                ThemeData(
                  primarySwatch: Colors.purple,
                ),
            home: LandingPage(),
          );
        });
  }
}
