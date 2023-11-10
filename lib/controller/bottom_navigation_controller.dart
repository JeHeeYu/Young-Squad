import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';

import '../routes/routes_name.dart';
import '../statics/images.dart';

class BottomNavigationController extends StatefulWidget {
  BottomNavigationController({Key? key, required this.tabIndex})
      : super(key: key);

  int tabIndex;

  @override
  State<BottomNavigationController> createState() =>
      _BottomNavigationControllerState();
}

class _BottomNavigationControllerState
    extends State<BottomNavigationController> {
  void bottomTab(index) {
    switch (index) {
      case 0:
        Navigator.pushNamed(context, RoutesName.homePage);
        break;
      case 1:
        Navigator.of(context).pushNamed(RoutesName.contentsPage);
        break;
      case 2:
        Navigator.pushNamed(context, RoutesName.recordPage);
        break;
      case 3:
        Navigator.pushNamed(context, RoutesName.profilePage);
        break;
      default:
        Navigator.pushNamed(context, RoutesName.recordPage);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SvgPicture.asset(
          Images.bgBottom,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, RoutesName.homePage);
              },
              child: SvgPicture.asset(
                widget.tabIndex == 0
                ? Images.navigationHomeEnable
                : Images.navigationHomeDisable,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, RoutesName.contentsPage);
              },
              child: SvgPicture.asset(
                widget.tabIndex == 1
                ? Images.navigationContentsEnable
                : Images.navigationContentsDisable,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, RoutesName.recordPage);
              },
              child: SvgPicture.asset(
                widget.tabIndex == 2
                ? Images.navigationRecordEnable
                : Images.navigationRecordDisable,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, RoutesName.profilePage);
              },
              child: SvgPicture.asset(
                widget.tabIndex == 3
                ? Images.navigationProfileEnable
                : Images.navigationProfileDisable,
              ),
            ),
          ],
        ),
      ],
    );
  }
}