import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';

import '../../routes/routes_name.dart';
import '../../statics/colors.dart';
import '../../statics/images.dart';

class OnboardingFourth extends StatelessWidget {
  const OnboardingFourth({super.key});

  Widget bgTextRectangle(String text) {
    return Stack(
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
          style: TextStyle(
              color: Colors.black,
              fontFamily: "Pretendard",
              fontWeight: FontWeight.w600,
              fontSize: 16),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  Text(
                    '이번 여행에서 여행자님의 역할은 무엇인가요?',
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
                      bgTextRectangle("리더에요!"),
                      bgTextRectangle("메이트에요!"),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 64),
              child: GestureDetector(
                onTap: () {
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
                        color: Color(UserColors.enableColor),
                        border: Border.all(color: Colors.grey),
                      ),
                    ),
                    Center(
                      child: Text(
                        '다음',
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
    );
  }
}