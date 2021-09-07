import 'package:flutter/material.dart';

class MainPokemonAvatarWidget extends StatelessWidget {
  const MainPokemonAvatarWidget({
    required this.sizeImage,
  });

  final Size sizeImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: sizeImage.width,
      height: sizeImage.height,
      alignment: Alignment.center,
      child: Image.asset(
        'assets/pokedex/charizard.png',
        fit: BoxFit.fitHeight,
      ),
    );
  }
}
