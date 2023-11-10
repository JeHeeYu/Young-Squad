import 'package:flutter/material.dart';
import 'package:young_squad/routes/routes_name.dart';
import 'package:young_squad/views/onboardings/onboarding_fifth.dart';
import 'package:young_squad/views/pages/mission_detail_page.dart';

import '../views/onboardings/onboarding_first.dart';
import '../views/onboardings/onboarding_eighth.dart';
import '../views/onboardings/onboarding_fourth.dart';
import '../views/onboardings/onboarding_seventh.dart';
import '../views/onboardings/onboarding_sixth.dart';
import '../views/onboardings/onboarding_second.dart';
import '../views/onboardings/onboarding_third.dart';
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
      case RoutesName.onboardingFirst:
        return MaterialPageRoute(
            builder: (BuildContext context) => const OnboardingFirst());
      case RoutesName.onboardingSecond:
        return MaterialPageRoute(
            builder: (BuildContext context) => const OnboardingSecond());
      case RoutesName.onboardingThird:
        return MaterialPageRoute(
            builder: (BuildContext context) => const OnboardingThird());
      case RoutesName.onboardingFourth:
        return MaterialPageRoute(
            builder: (BuildContext context) => const OnboardingFourth());
      case RoutesName.onboardingFifth:
        return MaterialPageRoute(
            builder: (BuildContext context) => const OnboardingFifth());
      case RoutesName.onboardingSixth:
        return MaterialPageRoute(
            builder: (BuildContext context) => const OnboardingSixth());
      case RoutesName.onboardingSeventh:
        return MaterialPageRoute(
            builder: (BuildContext context) => const OnboardingSeventh());
      case RoutesName.onboardingEighth:
        return MaterialPageRoute(
            builder: (BuildContext context) => const OnboardingEighth());
      case RoutesName.missionDetailPage:
        return MaterialPageRoute(
            builder: (BuildContext context) => const MisstionDetailPage());
      case RoutesName.findColleaguePage:
        return MaterialPageRoute(
            builder: (BuildContext context) => const FindColleaguePage());
      case RoutesName.homePage:
      default:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomePage());
    }
  }
}
