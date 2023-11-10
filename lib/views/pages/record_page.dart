import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:young_squad/views/widgets/app_bar_widget.dart';

import '../../controller/bottom_navigation_controller.dart';
import '../../statics/colors.dart';
import '../../statics/strings.dart';

class RecordPage extends StatefulWidget {
  const RecordPage({super.key});

  @override
  State<RecordPage> createState() => _RecordPageState();
}

class _RecordPageState extends State<RecordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22.0),
        child: Column(
          children: [
            const AppBarWidget(title: Strings.record),
            Expanded(
              child: GridView.builder(
                itemCount: 11,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    width: 110,
                    height: 110,
                    color: Colors.lightGreen,
                    child: Text(' Item : $index'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      backgroundColor: const Color(UserColors.mainBackGround),
      bottomNavigationBar: BottomNavigationController(tabIndex: 2),
    );
  }
}
