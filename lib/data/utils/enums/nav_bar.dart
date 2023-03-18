import 'package:flutter/cupertino.dart';
import 'package:line_icons/line_icons.dart';

enum NavBar {
  home,
  weatherSearch,
  settings,
}

extension NavBarExtension on NavBar {
  IconData get iconData {
    switch (this) {
      case NavBar.home:
        return LineIcons.home;
      case NavBar.weatherSearch:
        return LineIcons.search;
      case NavBar.settings:
        return LineIcons.cog;
    }
  }
}
