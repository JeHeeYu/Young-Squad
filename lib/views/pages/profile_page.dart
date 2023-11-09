import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:young_squad/views/widgets/app_bar_widget.dart';

import '../../controller/bottom_navigation_controller.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const AppBarWidget(title: "내 정보"),
      bottomNavigationBar: BottomNavigationController(tabIndex: 3,),
    );
  }
}
