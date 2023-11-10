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

class OnboardingFifth extends StatelessWidget {
  const OnboardingFifth({Key? key});

  @override
  Widget build(BuildContext context) {
    final inDateController = TextEditingController();
    final outDateController = TextEditingController();

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
                      Images.onboardingFifth,
                      width: 420,
                    ),
                    const SizedBox(height: 65),
                    const Text(
                      Strings.inputTripDate,
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Pretendard",
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 75),
                    const Text(
                      Strings.fromKorea,
                      style: TextStyle(
                        color: Colors.grey,
                        fontFamily: "Pretendard",
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: inDateController,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.black,
                          fontFamily: "Pretendard",
                          fontWeight: FontWeight.w700,
                          fontSize: 16),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: BorderSide.none),
                      ),
                    ),
                    const SizedBox(height: 103),
                    const Text(
                      Strings.toHomeTown,
                      style: TextStyle(
                        color: Colors.grey,
                        fontFamily: "Pretendard",
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: outDateController,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.black,
                          fontFamily: "Pretendard",
                          fontWeight: FontWeight.w700,
                          fontSize: 16),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
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
                  onTap: (){
                    context.read<MainProvider>().setInDate(inDateController.text);
                    context.read<MainProvider>().setOutDate(outDateController.text);
                    Navigator.pushNamed(context, RoutesName.onboardingSixth);
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
      ),
    );
  }
}
