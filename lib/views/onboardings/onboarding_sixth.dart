import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../providers/main_provider.dart';
import '../../routes/routes_name.dart';
import '../../statics/colors.dart';
import '../../statics/images.dart';
import '../../statics/strings.dart';

class OnboardingSixth extends StatefulWidget {
  const OnboardingSixth({super.key});

  @override
  State<OnboardingSixth> createState() => _OnboardingSixthState();
}

class _OnboardingSixthState extends State<OnboardingSixth> {
  int selectIndex = 0;
  @override
  Widget build(BuildContext context) {
    Widget bgTextRectangle(
        BuildContext context, String text, int index, Color color) {
      return GestureDetector(
        onTap: () {
          selectIndex = index;

          setState(() {});
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 170,
              height: 78,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4), color: color),
            ),
            Text(
              text,
              style: const TextStyle(
                  color: Colors.black,
                  fontFamily: "Pretendard",
                  fontWeight: FontWeight.w600,
                  fontSize: 16),
            ),
          ],
        ),
      );
    }

    return ChangeNotifierProvider(
      create: (BuildContext context) => MainProvider(),
      child: Scaffold(
        backgroundColor: const Color(UserColors.mainBackGround),
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22.0),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 57),
                    SvgPicture.asset(
                      Images.onboardingSixth,
                      width: 420,
                    ),
                    const SizedBox(height: 65),
                    const Text(
                      Strings.entranceAirport,
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Pretendard",
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        selectIndex == 0
                            ? bgTextRectangle(context, Strings.incheonAirport,
                                0, Color(UserColors.enableColor))
                            : bgTextRectangle(context, Strings.incheonAirport,
                                0, Colors.white),
                        selectIndex == 1
                            ? bgTextRectangle(context, Strings.kimpoAirport, 1,
                                Color(UserColors.enableColor))
                            : bgTextRectangle(
                                context, Strings.kimpoAirport, 1, Colors.white),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        selectIndex == 2
                            ? bgTextRectangle(context, Strings.kimhaeAirport, 2,
                                Color(UserColors.enableColor))
                            : bgTextRectangle(context, Strings.kimhaeAirport, 2,
                                Colors.white),
                        selectIndex == 3
                            ? bgTextRectangle(context, Strings.jaejuAirport, 3,
                                Color(UserColors.enableColor))
                            : bgTextRectangle(
                                context, Strings.jaejuAirport, 3, Colors.white),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        selectIndex == 4
                            ? bgTextRectangle(context, Strings.daeguAirport, 4,
                                Color(UserColors.enableColor))
                            : bgTextRectangle(
                                context, Strings.daeguAirport, 4, Colors.white),
                        selectIndex == 5
                            ? bgTextRectangle(context, Strings.other, 5,
                                Color(UserColors.enableColor))
                            : bgTextRectangle(
                                context, Strings.other, 5, Colors.white),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 44),
                child: GestureDetector(
                  onTap: () {
                    context.read<MainProvider>().setAirport(selectIndex);
                    Navigator.pushNamed(context, RoutesName.onboardingSeventh);
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 420,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: const Color(UserColors.enableColor),
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
      ),
    );
  }
}
