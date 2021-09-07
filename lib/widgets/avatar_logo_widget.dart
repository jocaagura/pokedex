import 'package:flutter/material.dart';

class AvatarLogoWidget extends StatelessWidget {
  const AvatarLogoWidget({
    required this.heightTab,
  });

  final double heightTab;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 5.0),
      padding: EdgeInsets.all(heightTab * 0.15),
      width: heightTab,
      height: heightTab,
      child: Image.asset('assets/pokedex/pokeball.png'),
    );
  }
}
