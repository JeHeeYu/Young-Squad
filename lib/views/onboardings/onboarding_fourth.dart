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

class OnboardingFourth extends StatelessWidget {
  const OnboardingFourth({super.key});

  @override
  Widget build(BuildContext context) {
    int selectIndex = 0;

    Widget bgTextRectangle(BuildContext context, String text, int index) {
      return GestureDetector(
        onTap: () {
          selectIndex = index;

          print("Jehee $selectIndex");
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 170,
              height: 78,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.white, //const Color(UserColors.enableColor),
              ),
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
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22.0),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    const SizedBox(height: 87),
                    SvgPicture.asset(
                      Images.onboardingFourth,
                      width: 420,
                    ),
                    const SizedBox(height: 65),
                    const Text(
                      Strings.roleNow,
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Pretendard",
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 198),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        bgTextRectangle(context, Strings.isMate, 0),
                        bgTextRectangle(context, Strings.isLeader, 1),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 64),
                child: GestureDetector(
                  onTap: () {
                    context.read<MainProvider>().setMyRole(selectIndex);
                    Navigator.pushNamed(context, RoutesName.onboardingFifth);
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