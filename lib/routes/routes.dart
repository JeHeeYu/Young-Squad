import 'package:flutter/material.dart';
import 'package:young_squad/routes/routes_name.dart';

import '../views/pages/find_colleague_page.dart';
import '../views/pages/home_page.dart';
import '../views/pages/profile_page.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.findColleaguePage:
        return MaterialPageRoute(
            builder: (BuildContext context) => const FindColleaguePage());
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
