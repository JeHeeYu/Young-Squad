import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_provider/flutter_provider.dart';
import 'package:flutter_svg/svg.dart';

import '../../providers/main_provider.dart';
import '../../routes/routes_name.dart';
import '../../statics/colors.dart';
import '../../statics/images.dart';
import '../../statics/strings.dart';

class OnboardingFirst extends StatelessWidget {
  const OnboardingFirst({super.key});

  @override
  Widget build(BuildContext context) {
    //MainProvider mainProvider = Provider.of<MainProvider>(context);
    int sex = 0;
    int selectIndex = 0;
    final birthdayController = TextEditingController();

    Widget bgRectangle(int index) {
      return Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 420,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: selectIndex == index
              ? const Color(UserColors.enableColor)
              : Colors.white,
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
      );
    }

    return Scaffold(
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
                      GestureDetector(
                        onTap: () {
                          sex = 0;
                          selectIndex = 0;
                        },
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: 170,
                              height: 78,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: Colors.white,
                              ),
                            ),
                            const Text(
                              Strings.man,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Pretendard",
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          sex = 1;
                          selectIndex = 1;
                        },
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: 170,
                              height: 78,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: Colors.white,
                              ),
                            ),
                            const Text(
                              Strings.girl,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Pretendard",
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 131),
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
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 64),
              child: GestureDetector(
                onTap: () {
                  //mainProvider.setSex(sex);
                  //mainProvider.setBirthday(birthdayController.text);
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
