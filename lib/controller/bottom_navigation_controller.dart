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
/*
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
    return SizedBox(
      height: 86,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24.0),
          topRight: Radius.circular(24.0),
        ),
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  Images.navigationHome,
                ),
                label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "home2"),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "home3"),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "home4"),
          ],
          onTap: (int index) {
            bottomTab(index);
          },
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: true,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          currentIndex: widget.tabIndex,
        ),
      ),
    );
  }
}*/




/*
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
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "home1"),
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "home2"),
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "home3"),
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "home4"),
      ],
      onTap: (int index) {
        bottomTab(index);
      },
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: true,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      currentIndex: widget.tabIndex,
    );
  }
}
*/