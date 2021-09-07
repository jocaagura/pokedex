import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class InfoPokemonTableWidget extends StatelessWidget {
  const InfoPokemonTableWidget({
    required this.sizeInfoWidget,
  });

  final Size sizeInfoWidget;

  @override
  Widget build(BuildContext context) {
    final heightTab = sizeInfoWidget.height * 1 / 8;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
        decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          borderRadius: BorderRadius.circular(heightTab * 0.15),
        ),
        width: sizeInfoWidget.width,
        height: sizeInfoWidget.height,
        child: ListView(
          children: [
            SizedBox(
              height: sizeInfoWidget.height * 0.15,
            ),
            InfoTabWidget(
              sizeInfoWidget: sizeInfoWidget,
              heightTab: heightTab,
              label1: 'NO',
              label2: '005',
            ),
            InfoTabWidget(
              sizeInfoWidget: sizeInfoWidget,
              heightTab: heightTab,
              label1: 'Level',
              label2: '100',
            ),
            InfoTabWidget(
              sizeInfoWidget: sizeInfoWidget,
              heightTab: heightTab,
              label1: 'TYPE',
              label2: 'FIRE',
            ),
            InfoTabWidget(
              sizeInfoWidget: sizeInfoWidget,
              heightTab: heightTab,
              label1: 'HABILITY',
              label2: 'FLAMES',
            ),
            InfoTabWidget(
              sizeInfoWidget: sizeInfoWidget,
              heightTab: heightTab,
              label1: 'Height',
              label2: '1.7m',
            ),
            InfoTabWidget(
              sizeInfoWidget: sizeInfoWidget,
              heightTab: heightTab,
              label1: 'Weight',
              label2: '90.5 KG',
            ),
          ],
        ));
  }
}

class InfoTabWidget extends StatelessWidget {
  const InfoTabWidget({
    required this.sizeInfoWidget,
    required this.heightTab,
    required this.label1,
    required this.label2,
  });

  final Size sizeInfoWidget;
  final double heightTab;
  final String label1;
  final String label2;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: sizeInfoWidget.width,
      height: heightTab,
      margin: EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          LabelInfoWidget(
            heightTab: heightTab,
            label: label1,
          ),
          LabelInfoWidget(
            heightTab: heightTab,
            label: label2,
          ),
        ],
      ),
    );
  }
}

class LabelInfoWidget extends StatelessWidget {
  const LabelInfoWidget({
    required this.heightTab,
    required this.label,
  });

  final double heightTab;
  final String label;

  @override
  Widget build(BuildContext context) {
    final double maxFontSize = (heightTab * 0.375).floorToDouble();

    return Container(
      alignment: Alignment.centerLeft,
      width: heightTab * 2,
      height: heightTab,
      child: AutoSizeText(
        label.toUpperCase(),
        minFontSize: 8.0,
        maxFontSize: maxFontSize,
        style: TextStyle(fontSize: maxFontSize),
      ),
    );
  }
}
