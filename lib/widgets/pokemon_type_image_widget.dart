import 'package:flutter/material.dart';

class PokemonTypeImageWidget extends StatelessWidget {
  const PokemonTypeImageWidget({
    required this.sizeTitle,
  });

  final Size sizeTitle;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(5.0)),
      child: Container(
        width: sizeTitle.height,
        height: sizeTitle.height,
        child: Image.asset('assets/pokedex/flame.gif'),
      ),
    );
  }
}