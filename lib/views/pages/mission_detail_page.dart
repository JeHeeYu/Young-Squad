import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:young_squad/statics/colors.dart';
import 'package:young_squad/views/widgets/complete_dialog.dart';

import '../../network/network_manager.dart';
import '../../providers/main_provider.dart';
import '../../statics/images.dart';
import '../../statics/strings.dart';
import '../widgets/app_bar_widget.dart';

import 'dart:io';

class MisstionDetailPage extends StatefulWidget {
  const MisstionDetailPage({super.key});

  @override
  State<MisstionDetailPage> createState() => _MisstionDetailPageState();
}

class _MisstionDetailPageState extends State<MisstionDetailPage> {
  XFile? uploadImage;
  final ImagePicker picker = ImagePicker();

  Future getImage(ImageSource imageSource) async {
    final XFile? pickedFile = await picker.pickImage(source: imageSource);

    if (pickedFile != null) {
      setState(() {
        uploadImage = XFile(pickedFile.path);
      });
    }
  }

  Widget _buildPhotoArea() {
    return uploadImage != null
        ? Container(
            width: 360,
            height: 360,
            child: Image.file(File(uploadImage!.path)),
          )
        : SvgPicture.asset(
            Images.imageUpload,
            width: 360,
            height: 360,
          );
  }

  @override
  Widget build(BuildContext context) {
    Uint8List? bytes; // 변수를 nullable로 선언

    if (uploadImage != null) {
      bytes = File(uploadImage!.path).readAsBytesSync();
    }

    NetworkManager networkManager = NetworkManager();
    TextEditingController recordController = TextEditingController();
    void deletePopupSelection(int option) async {
      if (option == 0) {
        print("Jehee ${Image.file(File(uploadImage!.path))}");

        Map<String, dynamic> userData = {
          "uid": 0,
          "missionType": "",
          "missionId": context.read<MainProvider>().getPersonMissionId,
          "recordImage": Image.file(File(uploadImage!.path)),
          "recordComment":
              recordController.text, //context.read<MainProvider>().travelWith,
          "travelId": context.read<MainProvider>().getTravelId,
        };

        String serverUrl = "http://43.202.106.98:8080/record/create";

        if (bytes != null) {
          await networkManager.imagePost(serverUrl, userData, bytes);
        }
      } else {}

      Navigator.of(context).pop();
    }

    return ChangeNotifierProvider(
      create: (BuildContext context) => MainProvider(),
      child: Scaffold(
        backgroundColor: const Color(UserColors.mainBackGround),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22.0),
            child: Column(
              children: [
                AppBarWidget(
                    title: context.read<MainProvider>().personMissionTitle),
                Container(
                  width: 100,
                  child: Text(
                    context.read<MainProvider>().personMissionDetail,
                    style: const TextStyle(
                      color: Colors.black,
                      fontFamily: "Pretendard",
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                const SizedBox(height: 9),
                Image.asset(
                  Images.missionDestination,
                  width: 340,
                  height: 179,
                ),
                const SizedBox(height: 19),
                SvgPicture.asset(Images.titleLine),
                const SizedBox(height: 18),
                GestureDetector(
                  onTap: () async {
                    getImage(ImageSource.gallery);
                  },
                  child: _buildPhotoArea(),
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
                    controller: recordController,
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
                  child: GestureDetector(
                    onTap: () {
                      showCompleteDialog(context, deletePopupSelection,
                          Strings.challenageCompleteQuestion);
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
                            Strings.missionComplete,
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
      ),
    );
  }
}
