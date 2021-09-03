import 'package:flutter/material.dart';

import '../widgets/footer_widget.dart';
import '../widgets/main_container_widget.dart';
import '../widgets/title_widget.dart';

class PortraitMovilDisplayPage extends StatelessWidget {
  const PortraitMovilDisplayPage();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(),
          TitleWidget(),
          MainContainer(),
          FooterContainer()
        ],
      ),
    );
  }
}
