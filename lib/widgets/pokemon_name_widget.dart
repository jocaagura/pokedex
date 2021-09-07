import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class PokemonNameWidget extends StatelessWidget {
  const PokemonNameWidget({
    required this.sizeTitle,
  });

  final Size sizeTitle;

  @override
  Widget build(BuildContext context) {
    final double maxFontSize = (sizeTitle.height * 0.7).floorToDouble();

    return Container(
      width: sizeTitle.width * 0.45,
      height: sizeTitle.height,
      alignment: Alignment.centerLeft,
      child: AutoSizeText(
        'Charizard'.toUpperCase(),
        minFontSize: 4.0,
        maxFontSize: maxFontSize,
        maxLines: 1,
        style: TextStyle(fontSize: maxFontSize),
      ),
    );
  }
}
