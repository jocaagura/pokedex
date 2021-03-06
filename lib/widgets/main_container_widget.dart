import 'package:flutter/material.dart';

import '../blocs/bloc_central.dart';
import 'info_table_pokemon_widget.dart';
import 'main_pokemon_avatar_widget.dart';
import 'main_pokemon_name_widget.dart';

class MainContainer extends StatelessWidget {
  const MainContainer();

  @override
  Widget build(BuildContext context) {
    final BlocCentral _blocCentral = BlocCentral();

    final double mainHeight = _blocCentral.size.width * 1.5;

    final Size sizeImage = Size(
      _blocCentral.size.width * 0.8,
      mainHeight * 0.35,
    );
    final Size sizeTitle = Size(
      _blocCentral.size.width * 0.8,
      mainHeight * 0.06,
    );
    final Size sizeInfoWidget = Size(
      _blocCentral.size.width * 0.8,
      mainHeight * 0.615,
    );

    final leftPosition = _blocCentral.size.width * 0.075;

    return Container(
        color: _blocCentral.theme.accentColor,

      width: _blocCentral.size.width * 0.96,
      height: mainHeight,
      child: Stack(
        children: [
          Positioned(
            left: leftPosition,
            top: _blocCentral.size.width * 0.505,
            child: InfoPokemonTableWidget(sizeInfoWidget: sizeInfoWidget),
          ),
          Positioned(
            left: leftPosition,
            top: _blocCentral.size.width * 0.1,
            child: MainPokemonAvatarWidget(sizeImage: sizeImage),
          ),
          Positioned(
            left: leftPosition,
            top: _blocCentral.size.width * 0.065,
            child: MainPokemonNameWidget(sizeTitle: sizeTitle),
          ),
        ],
      ),
    );
  }
}
