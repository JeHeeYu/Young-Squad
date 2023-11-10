import 'package:fluttertoast/fluttertoast.dart';
import 'package:young_squad/views/pages/contents_page.dart';
import 'package:young_squad/views/pages/home_page.dart';
import 'package:young_squad/views/pages/profile_page.dart';
import 'package:young_squad/views/pages/record_page.dart';
import 'controller/bottom_navigation_controller.dart';

import 'package:flutter/material.dart';
import 'package:young_squad/routes/routes.dart';
import 'package:young_squad/routes/routes_name.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Young Squad',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //initialRoute: RoutesName.onboardingFirst,
      // need edit route
      initialRoute: RoutesName.homePage,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
