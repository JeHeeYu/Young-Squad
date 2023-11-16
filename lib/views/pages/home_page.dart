import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:young_squad/controller/bottom_navigation_controller.dart';
import 'package:young_squad/statics/colors.dart';
import 'package:young_squad/views/widgets/bus_check_dialog.dart';

import '../../network/network_manager.dart';
import '../../providers/main_provider.dart';
import '../../routes/routes_name.dart';
import '../../statics/images.dart';
import '../../statics/strings.dart';
import '../widgets/bus_reservation_dialog.dart';
import '../widgets/complete_dialog.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

Widget bgRectangle(double width, double height, double radius) {
  return Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(radius),
      color: Colors.white,
    ),
  );
}

Widget bgTextRectangle(double width, double height, double radius, String text,
    Color backgroundColor, double fontSize) {
  return Stack(
    alignment: Alignment.center,
    children: [
      Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: backgroundColor, //const Color(UserColors.enableColor),
        ),
      ),
      Text(
        text,
        style: TextStyle(
            color: Colors.white,
            fontFamily: "Pretendard",
            fontWeight: FontWeight.w600,
            fontSize: fontSize),
      ),
    ],
  );
}

class _HomePageState extends State<HomePage> {
  NetworkManager networkManager = NetworkManager();

  @override
  void initState() {
    super.initState();
    print("Jehee init");

    String serverUrl = "http://43.202.106.98:8080/home/view?travelId=9";

    //networkManager.get(serverUrl);
  }

  void firstDeletePopupSelection(int option) {
    if (option == 0) {
      context.read<MainProvider>().setFirstDailyMission(true);
    } else {
      context.read<MainProvider>().setFirstDailyMission(false);
    }

    setState(() {});
  }

  void secondDeletePopupSelection(int option) {
    if (option == 0) {
      context.read<MainProvider>().setSecondDailyMission(true);
    } else {
      context.read<MainProvider>().setSecondDailyMission(false);
    }

    setState(() {});
  }

  void thirdDeletePopupSelection(int option) {
    if (option == 0) {
      context.read<MainProvider>().setThirdDailyMission(true);
    } else {
      context.read<MainProvider>().setThirdDailyMission(false);
    }

    setState(() {});
  }

  String getToday() {
    DateTime now = DateTime.now();
    DateFormat format = DateFormat('yyyy.MM.dd');
    String today = format.format(now);

    return today;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => MainProvider(),
      child: Scaffold(
        backgroundColor: const Color(UserColors.mainBackGround),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 63),
              Stack(
                children: [
                  bgRectangle(380, 94, 12),
                  Positioned(
                    top: 16,
                    left: 16,
                    child: GestureDetector(
                      onTap: () {
                        //BusReservationDialog.show(context);
                      },
                      child: Container(
                        width: 42,
                        height: 42,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: ClipOval(
                          child: Image.network(
                            context.read<MainProvider>().getUserImage,
                            width: 42,
                            height: 42,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 70.0, top: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          context.read<MainProvider>().getName,
                          style: const TextStyle(
                              color: Colors.black,
                              fontFamily: "Pretendard",
                              fontWeight: FontWeight.w600,
                              fontSize: 16),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          context.read<MainProvider>().getTravelName,
                          style: const TextStyle(
                              color: Colors.black,
                              fontFamily: "Pretendard",
                              fontWeight: FontWeight.w400,
                              fontSize: 11),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          context.read<MainProvider>().getTravelDate,
                          style: const TextStyle(
                              color: Colors.black,
                              fontFamily: "Pretendard",
                              fontWeight: FontWeight.w400,
                              fontSize: 11),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              GestureDetector(
                onTap: () {
                  BusCheckDialog.show(context);
                },
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    bgRectangle(360, 63, 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SvgPicture.asset(Images.icoBus),
                          Text(
                            context.read<MainProvider>().getDestination,
                            style: const TextStyle(
                                color: const Color(UserColors.enableColor),
                                fontFamily: "Pretendard",
                                fontWeight: FontWeight.w600,
                                fontSize: 16),
                          ),
                          Text(
                            context.read<MainProvider>().getDate,
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Pretendard",
                                fontWeight: FontWeight.w600,
                                fontSize: 11),
                          ),
                          Text(
                            context.read<MainProvider>().getTime,
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Pretendard",
                                fontWeight: FontWeight.w600,
                                fontSize: 11),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Stack(
                alignment: Alignment.center,
                children: [
                  bgRectangle(360, 152, 16),
                  Positioned(
                    top: 8.0,
                    left: 165,
                    child: Text(
                      '미션 진행도',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Pretendard",
                          fontWeight: FontWeight.w600,
                          fontSize: 14),
                    ),
                  ),
                  Positioned(
                    top: 15.0,
                    left: 310,
                    child: Text(
                      getToday(),
                      style: TextStyle(
                          color: Colors.grey,
                          fontFamily: "Pretendard",
                          fontWeight: FontWeight.w600,
                          fontSize: 11),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 20.0, left: 40.0, right: 40.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Image.asset(
                                  Images.stampGood,
                                  width: 73,
                                  height: 73,
                                ),
                                Text(
                                  '단체 미션',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: "Pretendard",
                                      fontWeight: FontWeight.w700,
                                      fontSize: 11),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Image.asset(
                                  Images.stampGood,
                                  width: 73,
                                  height: 73,
                                ),
                                Text(
                                  '개인 미션',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: "Pretendard",
                                      fontWeight: FontWeight.w700,
                                      fontSize: 11),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Image.asset(
                                  Images.stampEmpty,
                                  width: 73,
                                  height: 73,
                                ),
                                Text(
                                  '일일 챌린지',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: "Pretendard",
                                      fontWeight: FontWeight.w700,
                                      fontSize: 11),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                      context, RoutesName.teamMissionDetailPage);
                },
                child: Stack(
                  children: [
                    bgRectangle(360, 152, 16),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, left: 10.0),
                      child: bgTextRectangle(86, 32, 12, "함께하는 미션",
                          const Color(UserColors.enableColor), 12),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 55.0, left: 15.0),
                      child: Column(
                        children: [
                          Text(
                            context.read<MainProvider>().getTeamMissionTitle,
                            style: const TextStyle(
                                color: Colors.black,
                                fontFamily: "Pretendard",
                                fontWeight: FontWeight.w700,
                                fontSize: 16),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15.0),
                            child: GestureDetector(
                              onTap: () {
                                //Navigator.pushNamed(
                                //context, RoutesName.findColleaguePage);
                              },
                              child: bgTextRectangle(
                                  328,
                                  38,
                                  8,
                                  Strings.findColleague,
                                  const Color(UserColors.greyColor),
                                  16),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Stack(
                alignment: Alignment.center,
                children: [
                  bgRectangle(360, 62, 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                            context, RoutesName.missionDetailPage);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          bgTextRectangle(65, 32, 12, "개인 미션",
                              const Color(UserColors.enableColor), 12),
                          Container(
                            width: 230,
                            child: Text(
                              context
                                  .read<MainProvider>()
                                  .getPersonMissionTitle,
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Pretendard",
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: SvgPicture.asset(
                              Images.arrowRight,
                              width: 10,
                              height: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    bgRectangle(360, 214, 12),
                    Positioned(
                      top: 12,
                      left: 37,
                      child: bgTextRectangle(86, 32, 12, "일일 챌린지",
                          const Color(UserColors.enableColor), 12),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 37.0),
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  const SizedBox(height: 25),
                                  context
                                          .read<MainProvider>()
                                          .getFirstDailyMission
                                      ? SvgPicture.asset(Images.checkBox)
                                      : SvgPicture.asset(Images.unCheckBox),
                                  const SizedBox(height: 28),
                                  context
                                          .read<MainProvider>()
                                          .getSecondDailyMission
                                      ? SvgPicture.asset(Images.checkBox)
                                      : SvgPicture.asset(Images.unCheckBox),
                                  const SizedBox(height: 28),
                                  context
                                          .read<MainProvider>()
                                          .getThirdDailyMission
                                      ? SvgPicture.asset(Images.checkBox)
                                      : SvgPicture.asset(Images.unCheckBox),
                                ],
                              ),
                              const SizedBox(width: 14),
                              Column(
                                children: [
                                  const SizedBox(height: 26),
                                  GestureDetector(
                                    onTap: () {
                                      showCompleteDialog(
                                          context,
                                          firstDeletePopupSelection,
                                          Strings.challenageCompleteQuestion);
                                    },
                                    child: Text(
                                      context
                                              .read<MainProvider>()
                                              .getDailyMissions[0]
                                              .isEmpty
                                          ? ""
                                          : context
                                              .read<MainProvider>()
                                              .getDailyMissions[0],
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontFamily: "Pretendard",
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16),
                                    ),
                                  ),
                                  const SizedBox(height: 26),
                                  GestureDetector(
                                    onTap: () {
                                      showCompleteDialog(
                                          context,
                                          secondDeletePopupSelection,
                                          Strings.challenageCompleteQuestion);
                                    },
                                    child: Text(
                                      context
                                              .read<MainProvider>()
                                              .getDailyMissions[1]
                                              .isEmpty
                                          ? ""
                                          : context
                                              .read<MainProvider>()
                                              .getDailyMissions[1],
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontFamily: "Pretendard",
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16),
                                    ),
                                  ),
                                  const SizedBox(height: 26),
                                  GestureDetector(
                                    onTap: () {
                                      showCompleteDialog(
                                          context,
                                          thirdDeletePopupSelection,
                                          Strings.challenageCompleteQuestion);
                                    },
                                    child: Text(
                                      context
                                              .read<MainProvider>()
                                              .getDailyMissions[0]
                                              .isEmpty
                                          ? ""
                                          : context
                                              .read<MainProvider>()
                                              .getDailyMissions[2],
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontFamily: "Pretendard",
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationController(
          tabIndex: 0,
        ),
      ),
    );
  }
}
