import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../blocs/bloc_central.dart';
import '../enums.dart';

class FooterContainer extends StatelessWidget {
  const FooterContainer();

  @override
  Widget build(BuildContext context) {
    final BlocCentral _blocCentral = BlocCentral();
    double heightFooter = _blocCentral.size.width * 0.5;
    double heightItem = heightFooter * 0.35;
    bool movil = true;
    if (_blocCentral.displayModo == ModoDisplay.desktop ||
        _blocCentral.displayModo == ModoDisplay.tv) {
      heightFooter = _blocCentral.size.height * 0.18;
      heightItem = heightFooter * 0.5;
      movil = false;
    }

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(5.0),
            bottomRight: Radius.circular(5.0)),
        color: Theme.of(context).backgroundColor,
      ),
      margin: EdgeInsets.only(bottom: 20.0),
      width: _blocCentral.size.width * 0.96,
      height: heightFooter,
      child: movil
          ? _MenuInfMovilWidget(
              heightFooter: heightFooter, heightItem: heightItem)
          : _MenuInfTvDesktopWidget(
              heightFooter: heightFooter, heightItem: heightItem),
    );
  }
}

class _MenuInfTvDesktopWidget extends StatelessWidget {
  const _MenuInfTvDesktopWidget({
    required this.heightFooter,
    required this.heightItem,
  });

  final double heightFooter;
  final double heightItem;

  @override
  Widget build(BuildContext context) {
    double maxFontSize = (heightFooter * 0.15).floorToDouble();
    final BlocCentral _blocCentral = BlocCentral();
    return Row(
      children: [
        Container(
          width: _blocCentral.size.width * 0.325,
          height: heightFooter * 0.15,
          alignment: Alignment.center,
          child: AutoSizeText(
            'OTHERS',
            maxFontSize: maxFontSize,
            minFontSize: 8.0,
            style: TextStyle(fontSize: maxFontSize),
          ),
        ),
        Container(
          width: _blocCentral.size.width * 0.4,
          height: heightFooter * 0.8,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _PokemonButtonWidget(
                pokemonAsset: 'assets/pokedex/squirtle.png',
                height: heightItem,
              ),
              _PokemonButtonWidget(
                pokemonAsset: 'assets/pokedex/mewtwo.png',
                height: heightItem,
              ),
              _PokemonButtonWidget(
                pokemonAsset: 'assets/pokedex/solgaleo.png',
                height: heightItem,
              ),
              _PokemonButtonWidget(
                pokemonAsset: 'assets/pokedex/bulbasaur.png',
                height: heightItem,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _MenuInfMovilWidget extends StatelessWidget {
  const _MenuInfMovilWidget({
    required this.heightFooter,
    required this.heightItem,
  });

  final double heightFooter;
  final double heightItem;

  @override
  Widget build(BuildContext context) {
    final BlocCentral _blocCentral = BlocCentral();
    double maxFontSize = (heightFooter * 0.08).floorToDouble();

    return Column(
      children: [
        Container(
          width: _blocCentral.size.width,
          height: heightFooter * 0.15,
          alignment: Alignment.center,
          child: AutoSizeText(
            'OTHERS',
            maxFontSize: maxFontSize,
            minFontSize: 8.0,
            style: TextStyle(fontSize: maxFontSize),
          ),
        ),
        Container(
          width: _blocCentral.size.width,
          height: heightFooter * 0.8,
          alignment: Alignment.center,
          child: Container(
            width: heightFooter * 0.86,
            height: heightFooter * 0.8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _PokemonButtonWidget(
                      pokemonAsset: 'assets/pokedex/squirtle.png',
                      height: heightItem,
                    ),
                    _PokemonButtonWidget(
                      pokemonAsset: 'assets/pokedex/mewtwo.png',
                      height: heightItem,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _PokemonButtonWidget(
                      pokemonAsset: 'assets/pokedex/solgaleo.png',
                      height: heightItem,
                    ),
                    _PokemonButtonWidget(
                      pokemonAsset: 'assets/pokedex/bulbasaur.png',
                      height: heightItem,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _PokemonButtonWidget extends StatefulWidget {
  const _PokemonButtonWidget(
      {required this.height, required this.pokemonAsset});

  final String pokemonAsset;
  final double height;

  @override
  __PokemonButtonWidgetState createState() => __PokemonButtonWidgetState();
}

class __PokemonButtonWidgetState extends State<_PokemonButtonWidget> {
  bool isHover = false;
  @override
  void initState() {
    super.initState();
    if(!kIsWeb){
      isHover = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    _switchIsHover(bool value) {
      setState(() {
        isHover = !isHover;
      });
    }

    return InkWell(
      onTap: () {
        if(!kIsWeb){
        print(widget.pokemonAsset);
          _switchIsHover(true);
        }
      },
      child: MouseRegion(
        onEnter: (event) => _switchIsHover(true),
        onExit: (event) => _switchIsHover(false),
        child: Container(
          width: widget.height,
          height: widget.height,
          padding: EdgeInsets.all(widget.height * 0.15),
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).accentColor),
            color: isHover
                ? Theme.of(context).backgroundColor
                : Theme.of(context).accentColor,
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: isHover
              ? Image.asset(
                  widget.pokemonAsset,
                )
              : ColorFiltered(
              colorFilter: ColorFilter.mode(Colors.black, BlendMode.modulate),
              child: Image.asset(
                widget.pokemonAsset,
              )),
          /*
              : ColorFiltered(
                  colorFilter: ColorFilter.matrix([
                    0.2126,
                    0.7152,
                    0.0722,
                    0,
                    0,
                    0.2126,
                    0.7152,
                    0.0722,
                    0,
                    0,
                    0.2126,
                    0.7152,
                    0.0722,
                    0,
                    0,
                    0,
                    0,
                    0,
                    1,
                    0,
                  ]),
                  child: Image.asset(
                    widget.pokemonAsset,
                  )),

           */
        ),
      ),
    );
  }
}
