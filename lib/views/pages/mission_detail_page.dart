import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:young_squad/statics/colors.dart';

import '../../statics/images.dart';
import '../widgets/app_bar_widget.dart';

class MisstionDetailPage extends StatefulWidget {
  const MisstionDetailPage({super.key});

  @override
  State<MisstionDetailPage> createState() => _MisstionDetailPageState();
}

class _MisstionDetailPageState extends State<MisstionDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(UserColors.mainBackGround),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22.0),
          child: Column(
            children: [
              AppBarWidget(title: "버스킹"),
              Text(
                '[해운대란]\n해운대는 부산의 대표적인 해변가로, 도시의 활기찬 맥박과 탁 트인 해안선의 아름다움이 조화를 이루는 곳이에요. 넓게 펼쳐진 금빛 모래사작와 푸른 바다가 인상적인 이곳은 여름철에는 서핑과 수영을 즐기는 사람들로 붐비며, 겨울에는 산책하거나 해변가 카페에서 따듯한 음료를 즐기며 바다를 바라보며 여유를 만끽할 수 있는 장소로 변모합니다.\n\n\n[미션 상세설명]\n해운대는 버스킹 문화도 잘 발달 되어 있어요. 주말 낮시간이나 밤시간대에 버스킹 하는 사람들을 흔히 볼 수 있답니다! 이런 곳에서 버스킹을 보는 미션을 받다니.. 행운인걸요?\n\n\n[위치]\n부산 해운대구 우동',
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Pretendard",
                    fontWeight: FontWeight.w400,
                    fontSize: 14),
              ),
              const SizedBox(height: 9),
              SvgPicture.asset(
                Images.destinationBusan,
                width: 340,
                height: 179,
              ),
              const SizedBox(height: 19),
              SvgPicture.asset(Images.titleLine),
              const SizedBox(height: 18),
              SvgPicture.asset(
                Images.imageUpload,
                width: 360,
                height: 360,
              ),
              const SizedBox(height: 19),
              SvgPicture.asset(Images.titleLine),
              const SizedBox(height: 18),
              Container(
                width: 360,
                height: 150,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color(0xFFDEDEDE),
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextField(
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Pretendard",
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(UserColors.mainBackGround),
                    hintText: '미션과 사진에 대한 코멘트를 함께 남겨주세요!',
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(height: 18),
              Padding(
                padding: const EdgeInsets.only(bottom: 18.0),
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
                        '미션 완료하기',
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
            ],
          ),
        ),
      ),
    );
  }
}
