import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';

import '../../routes/routes_name.dart';
import '../../statics/colors.dart';
import '../../statics/images.dart';

class OnboardingSeven extends StatelessWidget {
  const OnboardingSeven({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(UserColors.mainBackGround),
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                const SizedBox(height: 87),
                SvgPicture.asset(
                  Images.progressBarHalf,
                  width: 420,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 64),
            child: GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, RoutesName.onboardingEighth);
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
    );
  }
}
