import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:young_squad/controller/bottom_navigation_controller.dart';
import 'package:young_squad/statics/colors.dart';
import 'package:young_squad/views/widgets/bus_check_dialog.dart';

import '../../network/network_manager.dart';
import '../../providers/main_provider.dart';
import '../../routes/routes_name.dart';
import '../../statics/images.dart';
import '../../statics/strings.dart';
import '../widgets/bus_reservation_dialog.dart';
import '../widgets/complete_dialog.dart';

class EmptyHomePage extends StatefulWidget {
  const EmptyHomePage({super.key});

  @override
  State<EmptyHomePage> createState() => _EmptyHomePageState();
}

Widget bgRectangle(double width, double height, double radius) {
  return Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(radius),
      color: Colors.white,
    ),
  );
}

Widget bgTextRectangle(double width, double height, double radius, String text,
    Color backgroundColor, double fontSize) {
  return Stack(
    alignment: Alignment.center,
    children: [
      Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: backgroundColor, //const Color(UserColors.enableColor),
        ),
      ),
      Text(
        text,
        style: TextStyle(
            color: Colors.white,
            fontFamily: "Pretendard",
            fontWeight: FontWeight.w600,
            fontSize: fontSize),
      ),
    ],
  );
}

class _EmptyHomePageState extends State<EmptyHomePage> {
  NetworkManager networkManager = NetworkManager();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => MainProvider(),
      child: Scaffold(
        backgroundColor: const Color(UserColors.mainBackGround),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 63),
              Stack(
                children: [
                  bgRectangle(380, 94, 12),
                  Positioned(
                    top: 16,
                    left: 16,
                    child: GestureDetector(
                      onTap: () {
                        BusReservationDialog.show(context);
                      },
                      child: Container(
                        width: 42,
                        height: 42,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: ClipOval(
                          child: Image.network(
                            context.read<MainProvider>().getUserImage,
                            width: 42,
                            height: 42,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 70.0, top: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          context.read<MainProvider>().getName,
                          style: const TextStyle(
                              color: Colors.black,
                              fontFamily: "Pretendard",
                              fontWeight: FontWeight.w600,
                              fontSize: 16),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          context.read<MainProvider>().getTravelName,
                          style: const TextStyle(
                              color: Colors.black,
                              fontFamily: "Pretendard",
                              fontWeight: FontWeight.w400,
                              fontSize: 11),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          context.read<MainProvider>().getTravelDate,
                          style: const TextStyle(
                              color: Colors.black,
                              fontFamily: "Pretendard",
                              fontWeight: FontWeight.w400,
                              fontSize: 11),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Image.asset(Images.emptyHomeGuide),
              Padding(
                padding: const EdgeInsets.only(bottom: 44),
                child: GestureDetector(
                  onTap: () {},
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 420,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Color(UserColors.enableColor),
                          border: Border.all(color: Colors.grey),
                        ),
                      ),
                      const Center(
                        child: Text(
                          Strings.next,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Pretendard",
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationController(
          tabIndex: 0,
        ),
      ),
    );
  }
}
