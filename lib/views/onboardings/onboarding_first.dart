import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_provider/flutter_provider.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../providers/main_provider.dart';
import '../../routes/routes_name.dart';
import '../../statics/colors.dart';
import '../../statics/images.dart';
import '../../statics/strings.dart';

class OnboardingFirst extends StatefulWidget {
  const OnboardingFirst({super.key});

  @override
  State<OnboardingFirst> createState() => _OnboardingFirstState();
}

class _OnboardingFirstState extends State<OnboardingFirst> {
  int sex = 0;
  int selectIndex = 0;
  final birthdayController = TextEditingController();
  final userNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Widget bgTextRectangle(
        BuildContext context, String text, int index, Color color) {
      return GestureDetector(
        onTap: () {
          selectIndex = index;

          print("Jehee test : ${selectIndex}");
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
                color: color,
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

    return Scaffold(
      backgroundColor: const Color(UserColors.mainBackGround),
      resizeToAvoidBottomInset: false,
      body: ChangeNotifierProvider(
        create: (BuildContext context) => MainProvider(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22.0),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 57),
                    SvgPicture.asset(
                      Images.onboardingFirst,
                      width: 420,
                    ),
                    const SizedBox(height: 65),
                    const Text(
                      Strings.sexGuide,
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
                            ? bgTextRectangle(context, Strings.man, 0,
                                Color(UserColors.enableColor))
                            : bgTextRectangle(
                                context, Strings.man, 0, Colors.white),
                        selectIndex == 1
                            ? bgTextRectangle(context, Strings.girl, 1,
                                Color(UserColors.enableColor))
                            : bgTextRectangle(
                                context, Strings.girl, 1, Colors.white),
                      ],
                    ),
                    const SizedBox(height: 61),
                    const Text(
                      Strings.birthdayGuide,
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Pretendard",
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 32),
                    TextField(
                      controller: birthdayController,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.black,
                          fontFamily: "Pretendard",
                          fontWeight: FontWeight.w700,
                          fontSize: 16),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 15),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: BorderSide.none),
                      ),
                    ),
                    const SizedBox(height: 82),
                    const Text(
                      Strings.userNumberGuide,
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Pretendard",
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 32),
                    TextField(
                      controller: userNumberController,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.black,
                          fontFamily: "Pretendard",
                          fontWeight: FontWeight.w700,
                          fontSize: 16),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 15),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: BorderSide.none),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 44),
                child: GestureDetector(
                  onTap: () {
                    context.read<MainProvider>().setSex(sex);
                    context
                        .read<MainProvider>()
                        .setBirthday(birthdayController.text);

                    var one = int.parse(userNumberController.text);
                    context
                        .read<MainProvider>()
                        .setUserNumber(one);

                    Navigator.pushNamed(context, RoutesName.onboardingSecond);
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
