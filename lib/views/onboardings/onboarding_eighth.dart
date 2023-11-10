import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';

import '../../routes/routes_name.dart';
import '../../statics/colors.dart';
import '../../statics/images.dart';

class OnboardingEighth extends StatelessWidget {
  const OnboardingEighth({super.key});

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
                  Images.onboardingEighth,
                  width: 420,
                ),
                const SizedBox(height: 32),
                Text(
                  '최종 여행지를 선택해주세요!',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Pretendard",
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '선택한 테마를 기반으로 추천하는 3곳의 여행지입니다.',
                  style: TextStyle(
                    color: Colors.grey,
                    fontFamily: "Pretendard",
                    fontWeight: FontWeight.w500,
                    fontSize: 11,
                  ),
                ),
                const SizedBox(height: 25),
                SvgPicture.network(Images.destinationBusan),
                const SizedBox(height: 10),
                SvgPicture.asset(Images.destinationJeonju),
                const SizedBox(height: 10),
                SvgPicture.asset(Images.destinationKyungju),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 64),
            child: GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, RoutesName.homePage);
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
                      '여기로 떠날래요',
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
