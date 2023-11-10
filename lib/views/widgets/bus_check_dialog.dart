import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../statics/colors.dart';
import '../../statics/images.dart';

class BusCheckDialog {
  static PageController pageController = PageController();

  static void show(BuildContext context) {
    final pages = List.generate(
      4,
      (index) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(
              Images.selectArrowLeftDisable,
            ),
            SvgPicture.asset(
              Images.qrCode,
            ),
            SvgPicture.asset(
              Images.selectArrowRightEnable,
            ),
          ],
        ),
      ),
    );

    showDialog(
      context: context,
      builder: (BuildContext ctx) {
        return Dialog(
          child: Container(
            width: 281,
            height: 494,
            child: Column(
              children: [
                const SizedBox(height: 40),
                Text(
                  '예약 정보',
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Pretendard",
                      fontWeight: FontWeight.w700,
                      fontSize: 16),
                ),
                const SizedBox(height: 7),
                SizedBox(
                  height: 140,
                  child: PageView.builder(
                    controller: pageController,
                    itemBuilder: (_, index) {
                      return pages[index % pages.length];
                    },
                  ),
                ),
                const SizedBox(height: 10),
                SmoothPageIndicator(
                  controller: pageController,
                  count: 4,
                  effect: ScrollingDotsEffect(
                      activeDotColor: Theme.of(context).primaryColor,
                      dotColor: Colors
                          .grey, //Theme.of(context).colorScheme.background,
                      radius: 8,
                      dotHeight: 8,
                      dotWidth: 8),
                  onDotClicked: (index) {},
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.only(left: 50.0),
                  child: Row(
                    children: [
                      SvgPicture.asset(Images.startEnd),
                      const SizedBox(width: 12.0),
                      Column(
                        children: [
                          Text(
                            '출발',
                            style: TextStyle(
                                color: Colors.grey,
                                fontFamily: "Pretendard",
                                fontWeight: FontWeight.w600,
                                fontSize: 11),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            '도착',
                            style: TextStyle(
                                color: Colors.grey,
                                fontFamily: "Pretendard",
                                fontWeight: FontWeight.w600,
                                fontSize: 11),
                          ),
                        ],
                      ),
                      const SizedBox(width: 30.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '인천공항',
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Pretendard",
                                fontWeight: FontWeight.w600,
                                fontSize: 14),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            '부산',
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Pretendard",
                                fontWeight: FontWeight.w600,
                                fontSize: 14),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 22),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '출발일',
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Pretendard",
                                fontWeight: FontWeight.w600,
                                fontSize: 12),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            '출발 시간',
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Pretendard",
                                fontWeight: FontWeight.w600,
                                fontSize: 12),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            '좌석 번호',
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Pretendard",
                                fontWeight: FontWeight.w600,
                                fontSize: 12),
                          ),
                        ],
                      ),
                      const SizedBox(width: 40),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '2023.11.09',
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Pretendard",
                                fontWeight: FontWeight.w700,
                                fontSize: 16),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            '18:30',
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Pretendard",
                                fontWeight: FontWeight.w700,
                                fontSize: 16),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            '12',
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Pretendard",
                                fontWeight: FontWeight.w700,
                                fontSize: 16),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
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
                        '확인',
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
              ],
            ),
          ),
        );
      },
    );
  }
}
