import 'package:flutter/cupertino.dart';
import 'package:line_icons/line_icons.dart';

enum NavBar {
  home,
  search,
  settings,
}

extension NavBarExtension on NavBar {
  IconData get iconData {
    switch (this) {
      case NavBar.home:
        return LineIcons.home;
      case NavBar.search:
        return LineIcons.search;
      case NavBar.settings:
        return LineIcons.cog;
    }
  }
}
