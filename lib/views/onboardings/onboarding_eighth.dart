import 'dart:convert';
import 'dart:math';

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
    int previousNumber = 0;

    int selectIndex = 0;
    String data = "";
    TravelData travelData;

    String userName = "";
    String userImage = "";
    String travelName = "";
    String travelDate = "";
    int travelId = 0;
    String teamMissionTitle = "";
    String teamMissionDetail = "";
    int teamMissionId = 0;
    String personMissionTitle = "";
    String personMissionDetail = "";
    int personMissionId = 0;
    String destination = "";
    String date = "";
    String time = "";

    List<String> dailyMissions = [];

    List<String> imageList = [
      Images.destinationJeonju,
      Images.destinationKyungju,
      Images.destinationGongju,
      Images.destinationAndong,
      Images.destinationDaegu,
      Images.destinationKwangju,
      Images.destinationYeosu,
      Images.destinationBusan
    ];

    void getData() async {
      String getUrl = "http://43.202.106.98:8080/home/view?uid=0";

      data = await networkManager.get(getUrl);
      travelData = TravelData.fromJson(json.decode(data));

      print("Jehee getTest : ${data}");

      userName = travelData.data.userName;
      userImage = travelData.data.userImage;
      travelName = travelData.data.travelName;
      travelDate = travelData.data.travelDate;
      travelId = travelData.data.travelId;
      teamMissionTitle = travelData.data.teamMission.title;
      teamMissionDetail = travelData.data.teamMission.detail;
      teamMissionId = travelData.data.teamMission.id;
      personMissionTitle = travelData.data.personMission.title;
      personMissionDetail = travelData.data.personMission.detail;
      personMissionId = travelData.data.personMission.id;
      destination = travelData.data.reservations[0].destination;
      date = travelData.data.reservations[0].date;
      time = travelData.data.reservations[0].time;

      dailyMissions = [];

      for (var mission in travelData.data.dailyMissions) {
        dailyMissions.add(mission.title);
      }
    }

    getData();

    int generateRandomNumber() {
      Random random = Random();

      while (true) {
        int randomNumber = random.nextInt(8);

        if (randomNumber != previousNumber) {
          previousNumber = randomNumber;
          return randomNumber;
        }
      }
    }

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
                      child: Image.asset(imageList[generateRandomNumber()])),
                  const SizedBox(height: 10),
                  GestureDetector(
                      onTap: () {
                        selectIndex = 1;
                      },
                      child: Image.asset(imageList[generateRandomNumber()])),
                  const SizedBox(height: 10),
                  GestureDetector(
                      onTap: () {
                        selectIndex = 2;
                      },
                      child: Image.asset(imageList[generateRandomNumber()])),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 64),
              child: GestureDetector(
                onTap: () async {
                  Map<String, dynamic> userData = {
                    "age": "",
                    "uid": context.read<MainProvider>().getUserNumber,
                    "birth": context.read<MainProvider>().getBirthday,
                    "lang": "EN",
                    "travelWith": context.read<MainProvider>().travelWith,
                    "role": context.read<MainProvider>().getMyRole,
                    "travelStartDate": context.read<MainProvider>().getInDate,
                    "travelEndDate": context.read<MainProvider>().getOutDate,
                    "transport": context.read<MainProvider>().getAirport,
                    //"themaId": context.read<MainProvider>().tripThema,
                    "destination": context.read<MainProvider>().getDestination,
                  };

                  print("JEheeJEheeJEheeJEheeJEhee ${context.read<MainProvider>().getInDate}");
                  print("JEheeJEheeJEheeJEheeJEhee ${context.read<MainProvider>().getOutDate}");

                  print("Jehee Jehee Jehee ${context.read<MainProvider>().getUserNumber}");

                  context.read<MainProvider>().setName(userName);
                  context.read<MainProvider>().setUserImage(userImage);
                  context.read<MainProvider>().setTravelName(travelName);
                  context.read<MainProvider>().setTravelDate(travelDate);
                  context.read<MainProvider>().setTravelId(travelId);
                  context
                      .read<MainProvider>()
                      .setTeamMissionTitle(teamMissionTitle);
                  context
                      .read<MainProvider>()
                      .setTeamMissionDetail(teamMissionDetail);
                  // context.read<MainProvider>().setTeamMissionId(teamMissionId);

                  context
                      .read<MainProvider>()
                      .setPersonMissionTitle(personMissionTitle);
                  context
                      .read<MainProvider>()
                      .setPersonMissionDetail(personMissionDetail);
                  // context
                  //     .read<MainProvider>()
                  //     .setPersonMissionId(personMissionId);

                  context.read<MainProvider>().setDailyMissions(dailyMissions);

                  context.read<MainProvider>().setDestination(destination);
                  context.read<MainProvider>().setDate(date);
                  context.read<MainProvider>().setTime(time);

                  try {
                    String serverUrl =
                        "http://43.202.106.98:8080/onboard/complete";

                    await networkManager.post(serverUrl, userData);
                  } catch (e) {
                    print("오류 발생: $e");
                  }

                  String status = context.read<MainProvider>().getTravelName;

                  if(status.isEmpty) {
                    Navigator.pushNamed(context, RoutesName.homePage);
                  }
                  else {
                    Navigator.pushNamed(context, RoutesName.homePage);
                  }
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
