import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';

import '../../routes/routes_name.dart';
import '../../statics/colors.dart';
import '../../statics/images.dart';
import '../../statics/strings.dart';

class OnboardingSeventh extends StatefulWidget {
  const OnboardingSeventh({super.key});

  @override
  State<OnboardingSeventh> createState() => _OnboardingSeventhState();
}

class _OnboardingSeventhState extends State<OnboardingSeventh> {
  List<String> imageList = [
    Images.foodEnable,
    Images.historyEnable,
    Images.mountainEnable,
    Images.oceanEnable,
    Images.leisureEnable,
    Images.showppingEnable
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(UserColors.mainBackGround),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 57),
            SvgPicture.asset(
              Images.onboardingSeventh,
              width: 420,
            ),
            const SizedBox(height: 16),
            const Text(
              Strings.themaSelect,
              style: TextStyle(
                color: Colors.black,
                fontFamily: "Pretendard",
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              Strings.themaSelectGuide,
              style: TextStyle(
                color: Colors.grey,
                fontFamily: "Pretendard",
                fontWeight: FontWeight.w500,
                fontSize: 11,
              ),
            ),
            Expanded(
              child: GridView.builder(
                itemCount: 6,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    width: 110,
                    height: 110,
                    child: Image.asset(imageList[index]),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 44),
              child: GestureDetector(
                onTap: () {
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
    );
  }
}
