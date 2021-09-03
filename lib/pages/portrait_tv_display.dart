import 'package:flutter/material.dart';

import '../widgets/footer_widget.dart';
import '../widgets/main_container_widget.dart';
import '../widgets/title_widget.dart';

class PortraitTvDisplayPage extends StatelessWidget {
  const PortraitTvDisplayPage();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [TitleWidget(), MainContainer(), FooterContainer()],
    );
  }
}
