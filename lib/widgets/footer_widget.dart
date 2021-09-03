import 'package:flutter/material.dart';

import '../blocs/bloc_central.dart';

class FooterContainer extends StatelessWidget {
  const FooterContainer();

  @override
  Widget build(BuildContext context) {
    final BlocCentral _blocCentral = BlocCentral();
    return Container(
      color: Colors.red,
      width: _blocCentral.size.width * 0.96,
      height: _blocCentral.size.width * 0.3,
    );
  }
}
