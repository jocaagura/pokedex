import 'package:flutter/material.dart';

import '../blocs/bloc_central.dart';

class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = Size(0.0, 0.0);

    if (BlocCentral().processLoad == true) {
      size = MediaQuery.of(context).size;
    }

    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      decoration: BoxDecoration(color: Theme.of(context).primaryColorDark),
      width: size.width,
      height: size.height,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                width: size.width * 0.9,
                height: size.height * 0.35,
                child: Image.asset('assets/logo.png')),
            Text(
              'Procesando:\n${BlocCentral().loadingMessage}',
              style: TextStyle(
                color: Theme.of(context).backgroundColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
