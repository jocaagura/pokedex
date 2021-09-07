import 'package:flutter/material.dart';

import '../widgets/footer_widget.dart';
import '../widgets/main_container_tv_desktop_widget.dart';
import '../widgets/title_widget.dart';

class PortraitTvDisplayPage extends StatelessWidget {
  const PortraitTvDisplayPage();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleWidget(),
        MainContainerTvDesktopWidget(),
        FooterContainer()
      ],
    );
  }
}
