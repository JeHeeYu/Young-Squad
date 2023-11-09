import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:young_squad/controller/bottom_navigation_controller.dart';
import 'package:young_squad/statics/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(UserColors.mainBackGround),
      body: Column(
        children: [
          Expanded(
            child: Container(),
          ),
          BottomNavigationController(
            tabIndex: 0,
          ),
        ],
      ),
    );
  }
}
