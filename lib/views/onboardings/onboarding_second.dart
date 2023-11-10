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

class OnboardingSecond extends StatelessWidget {
  const OnboardingSecond({super.key});

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
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22.0),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 87),
                    SvgPicture.asset(
                      Images.onboardingSecond,
                      width: 420,
                    ),
                    const SizedBox(height: 65),
                    const Text(
                      Strings.settingLanguage,
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
                        bgTextRectangle(context, "한국어", 0),
                        bgTextRectangle(context, "English", 1),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        bgTextRectangle(context, "中文", 2),
                        bgTextRectangle(context, "日本語", 3),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        bgTextRectangle(context, "Deutsch", 4),
                        bgTextRectangle(context, "Castellano", 5),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        bgTextRectangle(context, "Français", 6),
                        bgTextRectangle(context, "Tiếng Việt", 7),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 64),
                child: GestureDetector(
                  onTap: () {
                    context.read<MainProvider>().setLanguage(selectIndex);
                    Navigator.pushNamed(context, RoutesName.onboardingThird);
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
