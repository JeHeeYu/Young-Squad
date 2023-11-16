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

class OnboardingSecond extends StatefulWidget {
  const OnboardingSecond({super.key});

  @override
  State<OnboardingSecond> createState() => _OnboardingSecondState();
}

class _OnboardingSecondState extends State<OnboardingSecond> {
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
                borderRadius: BorderRadius.circular(4),
                color: color, //const Color(UserColors.enableColor),
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
                    const SizedBox(height: 57),
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
                        selectIndex == 0
                            ? bgTextRectangle(context, "한국어", 0,
                                Color(UserColors.enableColor))
                            : bgTextRectangle(context, "한국어", 0, Colors.white),
                        selectIndex == 1
                            ? bgTextRectangle(context, "English", 1,
                                Color(UserColors.enableColor))
                            : bgTextRectangle(
                                context, "English", 1, Colors.white)
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        selectIndex == 2
                            ? bgTextRectangle(
                                context, "中文", 2, Color(UserColors.enableColor))
                            : bgTextRectangle(context, "中文", 2, Colors.white),
                        selectIndex == 3
                            ? bgTextRectangle(context, "日本語", 3,
                                Color(UserColors.enableColor))
                            : bgTextRectangle(context, "日本語", 3, Colors.white)
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        selectIndex == 4
                            ? bgTextRectangle(context, "Deutsch", 4,
                                Color(UserColors.enableColor))
                            : bgTextRectangle(
                                context, "Deutsch", 4, Colors.white),
                        selectIndex == 5
                            ? bgTextRectangle(context, "Castellano", 5,
                                Color(UserColors.enableColor))
                            : bgTextRectangle(
                                context, "Castellano", 5, Colors.white)
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        selectIndex == 6
                            ? bgTextRectangle(context, "Français", 6,
                                Color(UserColors.enableColor))
                            : bgTextRectangle(
                                context, "Français", 6, Colors.white),
                        selectIndex == 7
                            ? bgTextRectangle(context, "Tiếng Việ", 7,
                                Color(UserColors.enableColor))
                            : bgTextRectangle(
                                context, "Tiếng Việ", 7, Colors.white)
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 44),
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
      ),
    );
  }
}
