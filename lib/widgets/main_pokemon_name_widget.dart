import 'package:flutter/material.dart';

import 'pokemon_name_widget.dart';
import 'pokemon_type_image_widget.dart';

class MainPokemonNameWidget extends StatelessWidget {
  const MainPokemonNameWidget({
    required this.sizeTitle,
  });

  final Size sizeTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: sizeTitle.width,
      height: sizeTitle.height,
      decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          borderRadius: BorderRadius.circular(7.5)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          PokemonTypeImageWidget(sizeTitle: sizeTitle),
          SizedBox(
            width: 10.0,
          ),
          PokemonNameWidget(sizeTitle: sizeTitle)
        ],
      ),
    );
  }
}
