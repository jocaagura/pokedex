import 'package:flutter/material.dart';

import '../../blocs/bloc_central.dart';
import '../../enums.dart';
import '../widgets/title_pokedex_widget.dart';
import 'avatar_logo_widget.dart';

class TitleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final BlocCentral _blocCentral = BlocCentral();

    double radius = _blocCentral.size.width * 0.025;
    double width = _blocCentral.size.width * 0.96;
    double heightTab = _blocCentral.size.width * 0.1;
    double marginTop = radius * 1.12;
    bool isMovilDisplay = true;
    if (_blocCentral.displayModo == ModoDisplay.tv ||
        _blocCentral.displayModo == ModoDisplay.desktop) {
      heightTab = _blocCentral.size.width * 0.035;
      width = _blocCentral.size.width;
      marginTop = radius * 0.125;
      radius = _blocCentral.size.width * 0.0075;
      isMovilDisplay = false;
    }

    return Container(
      margin: EdgeInsets.only(top: marginTop),
      width: width,
      height: heightTab,
      decoration: BoxDecoration(
          color: _blocCentral.theme.primaryColor,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(radius),
            topLeft: Radius.circular(radius),
          )),
      child: Row(
        mainAxisAlignment: isMovilDisplay ? MainAxisAlignment.center : MainAxisAlignment.start,
        children: [
          AvatarLogoWidget(heightTab: heightTab),
          TitlePokedexWidget(heightTab: heightTab)
        ],
      ),
    );
  }
}
