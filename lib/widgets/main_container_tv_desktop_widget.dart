import 'package:flutter/material.dart';

import '../blocs/bloc_central.dart';
import 'info_table_pokemon_widget.dart';
import 'main_pokemon_avatar_widget.dart';
import 'main_pokemon_name_widget.dart';

class MainContainerTvDesktopWidget extends StatelessWidget {
  const MainContainerTvDesktopWidget();

  @override
  Widget build(BuildContext context) {
    final BlocCentral _blocCentral = BlocCentral();

    final double mainHeight = _blocCentral.size.height * 0.7;

    final Size sizeImage = Size(
      _blocCentral.size.width * 0.45,
      mainHeight * 0.9,
    );
    final Size sizeTitle = Size(
      _blocCentral.size.width * 0.4,
      mainHeight * 0.1,
    );
    final Size sizeInfoWidget = Size(
      _blocCentral.size.width * 0.35,
      mainHeight * 0.9,
    );

    final leftPosition = _blocCentral.size.width * 0.075;
    final marginTop = _blocCentral.size.height * 0.025;
    return Container(
      color: _blocCentral.theme.accentColor,
      width: _blocCentral.size.width,
      height: mainHeight,
      child: Stack(
        children: [
          Positioned(
            left: _blocCentral.size.width * 0.55,
            top: marginTop,
            child: InfoPokemonTableWidget(sizeInfoWidget: sizeInfoWidget),
          ),
          Positioned(
            left: _blocCentral.size.width * 0.025,
            top: marginTop * 1.75,
            child: MainPokemonAvatarWidget(sizeImage: sizeImage),
          ),
          Positioned(
            left: leftPosition,
            top: marginTop,
            child: MainPokemonNameWidget(sizeTitle: sizeTitle),
          ),
        ],
      ),
    );
  }
}
