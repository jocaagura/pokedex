import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class TitlePokedexWidget extends StatelessWidget {
  const TitlePokedexWidget({
    required this.heightTab,
  });

  final double heightTab;

  @override
  Widget build(BuildContext context) {
    final double maxFontSize = (heightTab * 0.75).floorToDouble();

    return Container(
      alignment: Alignment.center,
      width: heightTab * 3.0,
      height: heightTab,
      child: AutoSizeText(
        'POKEDEX',
        minFontSize: 15,
        maxFontSize: maxFontSize,
        style: TextStyle(
          color: Theme.of(context).backgroundColor,
          fontSize: maxFontSize,
        ),
      ),
    );
  }
}
