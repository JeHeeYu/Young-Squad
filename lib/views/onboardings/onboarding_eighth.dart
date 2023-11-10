import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../network/network_manager.dart';
import '../../providers/main_provider.dart';
import '../../routes/routes_name.dart';
import '../../statics/colors.dart';
import '../../statics/images.dart';
import '../../statics/strings.dart';

class OnboardingEighth extends StatelessWidget {
  const OnboardingEighth({super.key});

  @override
  Widget build(BuildContext context) {
    NetworkManager networkManager = NetworkManager();
    int selectIndex = 0;

    return ChangeNotifierProvider(
      create: (BuildContext context) => MainProvider(),
      child: Scaffold(
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
                  const Text(
                    Strings.selectLastDestination,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Pretendard",
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    Strings.selectThemaGuide,
                    style: TextStyle(
                      color: Colors.grey,
                      fontFamily: "Pretendard",
                      fontWeight: FontWeight.w500,
                      fontSize: 11,
                    ),
                  ),
                  const SizedBox(height: 25),
                  GestureDetector(
                      onTap: () {
                        selectIndex = 0;
                      },
                      child: SvgPicture.asset(Images.destinationBusan)),
                  const SizedBox(height: 10),
                  GestureDetector(
                      onTap: () {
                        selectIndex = 1;
                      },
                      child: SvgPicture.asset(Images.destinationJeonju)),
                  const SizedBox(height: 10),
                  GestureDetector(
                      onTap: () {
                        selectIndex = 2;
                      },
                      child: SvgPicture.asset(Images.destinationKyungju)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 64),
              child: GestureDetector(
                onTap: () async {
                  Map<String, dynamic> userData = {
                    "age": "20",
                    "birth": context.read<MainProvider>().getBirthday,
                    "lang": "EN",
                    "travelWith": context.read<MainProvider>().travelWith,
                    "role": context.read<MainProvider>().getMyRole,
                    "travelStartDate": context.read<MainProvider>().getInDate,
                    "travelEndDate": context.read<MainProvider>().getOutDate,
                    "transport": context.read<MainProvider>().getAirport,
                    "themaId": context.read<MainProvider>().tripThema,
                    "destination": context.read<MainProvider>().getDestination,
                  };

                  try {
                    print("Jehee 1");
                    String serverUrl = "http://43.202.106.98:8080/onboard/complete";

                    dynamic response =
                        await networkManager.post(serverUrl, userData);

                    print("서버 응답: $response");
                  } catch (e) {
                    print("오류 발생: $e");
                  }

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
                        color: const Color(UserColors.enableColor),
                        border: Border.all(color: Colors.grey),
                      ),
                    ),
                    const Center(
                      child: Text(
                        Strings.hereGo,
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
