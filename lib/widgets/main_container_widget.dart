import 'package:flutter/material.dart';

import '../blocs/bloc_central.dart';

class MainContainer extends StatelessWidget {
  const MainContainer();

  @override
  Widget build(BuildContext context) {
    final BlocCentral _blocCentral = BlocCentral();
    return Container(
      color: Colors.black,
      width: _blocCentral.size.width * 0.96,
      height: _blocCentral.size.width,
    );
  }
}
