import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:young_squad/controller/bottom_navigation_controller.dart';
import 'package:young_squad/statics/colors.dart';

import '../../statics/images.dart';
import '../widgets/bus_reservation_dialog.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(UserColors.mainBackGround),
      body: Column(
        children: [
          const SizedBox(height: 63),
          Expanded(
            child: Column(
              children: [
                SvgPicture.asset(
                  Images.logoGroundK,
                  width: 79,
                  height: 24,
                ),
                const SizedBox(height: 10),
                Stack(
                  children: [
                    bgRectangle(380, 94, 12),
                    Positioned(
                      top: 16,
                      left: 16,
                      child: GestureDetector(
                        onTap: (){
                          BusReservationDialog.showBusReservationDialog(context);
                        },
                        child: Container(
                          width: 42,
                          height: 42,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.red,
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
                            '안녕하세요, 최정아님',
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Pretendard",
                                fontWeight: FontWeight.w600,
                                fontSize: 16),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            '부산 여행 중',
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Pretendard",
                                fontWeight: FontWeight.w400,
                                fontSize: 11),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            '2023-1109 ~ 2023-1116',
                            style: TextStyle(
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
                Stack(
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
                            '부산행 / BUSAN',
                            style: TextStyle(
                                color: const Color(UserColors.enableColor),
                                fontFamily: "Pretendard",
                                fontWeight: FontWeight.w600,
                                fontSize: 16),
                          ),
                          Text(
                            '2023/11/09',
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Pretendard",
                                fontWeight: FontWeight.w600,
                                fontSize: 11),
                          ),
                          Text(
                            'AM 10 : 42',
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
                        '2023.11.09',
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
                                  SvgPicture.asset(
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
                                  SvgPicture.asset(
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
                                  SvgPicture.asset(
                                    Images.stampGood,
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
                Stack(
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
                            '해운대에서 한명 모래찜질 시켜주기',
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Pretendard",
                                fontWeight: FontWeight.w700,
                                fontSize: 16),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15.0),
                            child: bgTextRectangle(328, 38, 8, "함께할 친구 찾으러 가기",
                                const Color(UserColors.greyColor), 16),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    bgRectangle(360, 62, 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          bgTextRectangle(65, 32, 12, "개인 미션",
                              const Color(UserColors.enableColor), 12),
                          Container(
                            width: 230,
                            child: Text(
                              '해운대에서 한명 모래찜질 시켜주기',
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
                  ],
                ),
              ],
            ),
          ),
          BottomNavigationController(
            tabIndex: 0,
          ),
        ],
      ),
    );
  }
}
