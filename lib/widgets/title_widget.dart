import 'package:flutter/material.dart';

import '../../blocs/bloc_central.dart';

class TitleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final BlocCentral _blocCentral = BlocCentral();

    final double radius = _blocCentral.size.width * 0.05;

    return Container(
      width: _blocCentral.size.width * 0.96,
      height: _blocCentral.size.width * 0.1,
      decoration: BoxDecoration(
          color: _blocCentral.theme.primaryColor,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(radius),
            topLeft: Radius.circular(radius),
          )),
    );
  }
}
