import 'package:flutter/material.dart';

import '../../blocs/bloc_central.dart';
import '../enums.dart';
import 'landscape_tablet_display_page.dart';
import 'portrait_desktop_display_page.dart';
import 'portrait_movil_display_page.dart';
import 'portrait_tv_display.dart';

class LandingPage extends StatelessWidget {
  const LandingPage();

  /// This is the main activity for the app
  /// Here we control the display and how the content is presented to the final user
  ///

  @override
  Widget build(BuildContext context) {
    /// We catch the size of the document to use it form ThemeData class
    BlocCentral().size = MediaQuery.of(context).size;
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          return BlocCentral().back();
        },
        child: StreamBuilder<Size?>(
            stream: BlocCentral().sizeStream,
            builder: (context, snapshot) {
              switch (BlocCentral().displayModo) {
                case ModoDisplay.tablet:
                  return LandscapeTabletDisplayPage();
                case ModoDisplay.desktop:
                  return PortraitDesktopDisplayPage();
                case ModoDisplay.tv:
                  return PortraitTvDisplayPage();
                default:
                  return PortraitMovilDisplayPage();
              }
            }),
      ),
    );
  }
}
