import 'package:flutter/material.dart';

import '../blocs/bloc_central.dart';
import '../widgets/footer_widget.dart';
import '../widgets/main_container_widget.dart';
import '../widgets/title_widget.dart';

class PortraitDesktopDisplayPage extends StatelessWidget {
  const PortraitDesktopDisplayPage();

  @override
  Widget build(BuildContext context) {
    final _blocCentral = BlocCentral();

    return Stack(
      children: [
        TitleWidget(),
        MainContainer(),
        FooterContainer()

      ],
    );
  }
}
