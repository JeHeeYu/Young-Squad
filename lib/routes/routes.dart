import 'package:flutter/material.dart';
import 'package:young_squad/routes/routes_name.dart';

import '../views/pages/contents_page.dart';
import '../views/pages/find_colleague_page.dart';
import '../views/pages/home_page.dart';
import '../views/pages/profile_page.dart';
import '../views/pages/record_page.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.contentsPage:
        return MaterialPageRoute(
            builder: (BuildContext context) => const ContentsPage());
      case RoutesName.recordPage:
        return MaterialPageRoute(
            builder: (BuildContext context) => const RecordPage());
      case RoutesName.profilePage:
        return MaterialPageRoute(
            builder: (BuildContext context) => const ProfilePage());
      case RoutesName.homePage:
      default:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomePage());
    }
  }
}
