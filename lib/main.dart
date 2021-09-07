import 'package:flutter/material.dart';

import './pages/landing_page.dart';
import '../../blocs/bloc_central.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ThemeData>(
        stream: BlocCentral().streamTheme,
        builder: (context, snapshot) {
          return MaterialApp(
            title: 'Pokedex Albert J. Jiménez P.',
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
