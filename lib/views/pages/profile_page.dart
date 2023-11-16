import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:young_squad/views/widgets/app_bar_widget.dart';

import '../../controller/bottom_navigation_controller.dart';
import '../../providers/main_provider.dart';
import '../../routes/routes_name.dart';
import '../../statics/colors.dart';
import '../../statics/images.dart';
import '../../statics/strings.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
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
          color: backgroundColor,
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

void setUserId(int value) async {
  final prefs = await SharedPreferences.getInstance();

  prefs.setInt('uId', value);
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => MainProvider(),
      child: Scaffold(
        backgroundColor: const Color(UserColors.mainBackGround),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 65),
              const Text(
                Strings.myProfile,
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Pretendard",
                    fontWeight: FontWeight.w600,
                    fontSize: 16),
              ),
              const SizedBox(height: 10),
              Stack(
                children: [
                  bgRectangle(380, 189, 12),
                  Positioned(
                    top: 16,
                    left: 16,
                    child: GestureDetector(
                      onTap: () {},
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
                          style: TextStyle(
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
                        const SizedBox(height: 25),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, RoutesName.onboardingFirst);
                          },
                          child: bgTextRectangle(195, 35, 4, Strings.otherTrip,
                              const Color(0xFF819AC0), 14),
                        ),
                      ],
                    ),
                  ),
                  const Positioned(
                    left: 20,
                    bottom: 21,
                    child: Text(
                      Strings.profileSubGuide,
                      style: TextStyle(
                          color: Colors.grey,
                          fontFamily: "Pretendard",
                          fontWeight: FontWeight.w400,
                          fontSize: 11),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 34),
              const Text(
                Strings.busHistory,
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Pretendard",
                    fontWeight: FontWeight.w600,
                    fontSize: 16),
              ),
              const SizedBox(height: 19),
              Padding(
                padding: const EdgeInsets.only(right: 50.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      Strings.showBusReservation,
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Pretendard",
                          fontWeight: FontWeight.w500,
                          fontSize: 14),
                    ),
                    GestureDetector(
                      onTap: () {
                        // uid 0 here
                        Navigator.pushNamed(context, RoutesName.homePage);
                      },
                      child: SvgPicture.asset(
                        Images.selectArrowRightEnable,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 19),
              const Text(
                Strings.tripInformation,
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Pretendard",
                    fontWeight: FontWeight.w600,
                    fontSize: 16),
              ),
              const SizedBox(height: 19),
              Padding(
                padding: const EdgeInsets.only(right: 50.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      Strings.editTripInformation,
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Pretendard",
                          fontWeight: FontWeight.w500,
                          fontSize: 14),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: SvgPicture.asset(
                        Images.selectArrowRightEnable,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 95.0, top: 105.0),
                child: Image.asset(Images.icoTrip),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationController(
          tabIndex: 3,
        ),
      ),
    );
  }
}
