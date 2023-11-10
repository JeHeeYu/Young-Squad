import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';

import '../../statics/colors.dart';
import '../../statics/images.dart';

class BusReservationDialog {
  static TextStyle blueStyle = const TextStyle(
    fontSize: 14,
    fontFamily: "Pretendard",
    fontWeight: FontWeight.w500,
    color: Color(UserColors.enableColor),
  );

  static TextStyle guideStyle = const TextStyle(
    fontSize: 11,
    color: Colors.grey,
  );

  static void show(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext ctx) {
        return Dialog(
          child: Container(
            width: 281,
            height: 458,
            child: Column(
              children: [
                const SizedBox(height: 27),
                SvgPicture.asset(Images.progressBarHalf),
                const SizedBox(height: 24),
                Text(
                  '셔틀버스 예약',
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Pretendard",
                      fontWeight: FontWeight.w700,
                      fontSize: 16),
                ),
                const SizedBox(height: 19),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(text: "부산 / BUSAN ", style: blueStyle),
                      TextSpan(text: "행", style: guideStyle),
                    ],
                  ),
                ),
                const SizedBox(height: 26),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Text(
                        '날짜',
                        style: TextStyle(
                          color: Colors.grey,
                          fontFamily: "Pretendard",
                          fontWeight: FontWeight.w500,
                          fontSize: 11,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 65.0),
                      child: SvgPicture.asset(Images.icoCalendar),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '2023.11.09',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Pretendard",
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 23),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Text(
                        '예약 인원',
                        style: TextStyle(
                          color: Colors.grey,
                          fontFamily: "Pretendard",
                          fontWeight: FontWeight.w500,
                          fontSize: 11,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Padding(
                      padding: const EdgeInsets.only(left: 45.0),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: 47,
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Colors.white,
                              border: Border.all(color: Colors.grey),
                            ),
                          ),
                          Text(
                            '4',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Pretendard",
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 26),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 249,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.white,
                        border: Border.all(color: Colors.grey),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 29.0),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            Images.radioButtonDisable,
                            width: 24,
                            height: 24,
                          ),
                          const SizedBox(width: 18),
                          Text(
                            '10시 30분 출발',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Pretendard",
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(width: 13),
                          Text(
                            '잔여석',
                            style: TextStyle(
                              color: Colors.grey,
                              fontFamily: "Pretendard",
                              fontWeight: FontWeight.w500,
                              fontSize: 11,
                            ),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            '17',
                            style: blueStyle,
                          ),
                          Text(
                            ' / 30',
                            style: TextStyle(
                              color: Color(UserColors.grey2Color),
                              fontFamily: "Pretendard",
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 249,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.white,
                        border: Border.all(color: Colors.grey),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 29.0),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            Images.radioButtonDisable,
                            width: 24,
                            height: 24,
                          ),
                          const SizedBox(width: 18),
                          Text(
                            '16시 10분 출발',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Pretendard",
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(width: 13),
                          Text(
                            '잔여석',
                            style: TextStyle(
                              color: Colors.grey,
                              fontFamily: "Pretendard",
                              fontWeight: FontWeight.w500,
                              fontSize: 11,
                            ),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            '17',
                            style: blueStyle,
                          ),
                          Text(
                            ' / 30',
                            style: TextStyle(
                              color: Color(UserColors.grey2Color),
                              fontFamily: "Pretendard",
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 22),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 249,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Color(UserColors.enableColor),
                        border: Border.all(color: Colors.grey),
                      ),
                    ),
                    Center(
                      child: Text(
                        '예약하기',
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
                const SizedBox(height: 12),
                Text(
                  '가는 버스편은 괜찮아요',
                  style: TextStyle(
                    color: Color(UserColors.disableColor),
                    fontFamily: "Pretendard",
                    fontWeight: FontWeight.w400,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
