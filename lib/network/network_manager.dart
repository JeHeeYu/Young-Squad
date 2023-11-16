import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'dart:convert';

import '../providers/main_provider.dart';
import 'package:http_parser/http_parser.dart';

class NetworkManager {
  Map<String, String> commonHeaders = {
    "Content-Type": "application/json",
    "Accept": "application/json",
  };

  Future<void> post(String serverUrl, Map<String, dynamic> userData) async {
    try {
      String jsonData = jsonEncode(userData);

      final response = await http.post(
        Uri.parse(serverUrl),
        headers: commonHeaders,
        body: jsonData,
      );

      print("Jehee 3: ${response.body}");

      if (response.statusCode == 200) {
        print("POST 성공: ${response.body}");
      } else {
        print("POST 실패: ${response.statusCode}");
      }
    } catch (error) {
      print("에러 발생: $error");
    }
  }

  Future<dynamic> imagePost(String url, Map<String, dynamic> data, Uint8List bytes) async {
    final request = http.MultipartRequest('POST', Uri.parse(url));
    request.files.add( new http.MultipartFile.fromBytes("file", bytes, filename: "Photo.jpg", contentType: new MediaType("image", "jpg")));

    request.headers.addAll(commonHeaders);

    data.forEach((key, value) {
      request.fields[key] = value.toString();
    });

    try {
      final response = await request.send();

      final responseStream = await response.stream.bytesToString();
      print("서버 응답: $responseStream");

      if (response.statusCode == 201) {
        return json.decode(responseStream);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print("오류 발생: $e");
      throw Exception('Failed to load data');
    }
  }

  Future<String> get(String serverUrl) async {
    try {
      final response = await http.get(
        Uri.parse(serverUrl),
        headers: commonHeaders,
      );

      String responseBody = utf8.decode(response.bodyBytes);
      TravelData travelData = TravelData.fromJson(json.decode(responseBody));

      //print("Jehee 123 : ${travelData.data.userName}");

      // MainProvider mainProvider = new MainProvider();

      // mainProvider.setName(travelData.data.userName);

      return responseBody;
    } catch (error) {
      print("에러 발생: $error");
      return "";
    }
  }
}

class TravelData {
  bool success;
  int code;
  String msg;
  TravelInfo data;

  TravelData({
    required this.success,
    required this.code,
    required this.msg,
    required this.data,
  });

  factory TravelData.fromJson(Map<String, dynamic> json) {
    return TravelData(
      success: json['success'],
      code: json['code'],
      msg: json['msg'],
      data: TravelInfo.fromJson(json['data']),
    );
  }
}

class TravelInfo {
  String userName;
  String userImage;
  String travelName;
  String travelDate;
  int travelId;
  List<String> travelFreinds;
  List<Reservation> reservations;
  MissionComplete missionComplete;
  TeamMission teamMission;
  PersonMission personMission;
  String dailyMissionCount;
  List<DailyMission> dailyMissions;

  TravelInfo({
    required this.userName,
    required this.userImage,
    required this.travelName,
    required this.travelDate,
    required this.travelId,
    required this.travelFreinds,
    required this.reservations,
    required this.missionComplete,
    required this.teamMission,
    required this.personMission,
    required this.dailyMissionCount,
    required this.dailyMissions,
  });

  factory TravelInfo.fromJson(Map<String, dynamic> json) {
    return TravelInfo(
      userName: json['userName'],
      userImage: json['userImage'],
      travelName: json['travelName'],
      travelDate: json['travelDate'],
      travelId: json['travelId'],
      travelFreinds: List<String>.from(json['travelFreinds']),
      reservations: List<Reservation>.from(
        json['reservations'].map((x) => Reservation.fromJson(x)),
      ),
      missionComplete: MissionComplete.fromJson(json['missionComplete']),
      teamMission: TeamMission.fromJson(json['teamMission']),
      personMission: PersonMission.fromJson(json['personMission']),
      dailyMissionCount: json['dailyMissionCount'],
      dailyMissions: List<DailyMission>.from(
        json['dailyMissions'].map((x) => DailyMission.fromJson(x)),
      ),
    );
  }
}

class Reservation {
  String destination;
  String date;
  String time;

  Reservation({
    required this.destination,
    required this.date,
    required this.time,
  });

  factory Reservation.fromJson(Map<String, dynamic> json) {
    return Reservation(
      destination: json['destination'],
      date: json['date'],
      time: json['time'],
    );
  }
}

class MissionComplete {
  int team;
  int person;
  int daily;

  MissionComplete({
    required this.team,
    required this.person,
    required this.daily,
  });

  factory MissionComplete.fromJson(Map<String, dynamic> json) {
    return MissionComplete(
      team: json['team'],
      person: json['person'],
      daily: json['daily'],
    );
  }
}

class TeamMission {
  int id;
  String title;
  String detail;

  TeamMission({
    required this.id,
    required this.title,
    required this.detail,
  });

  factory TeamMission.fromJson(Map<String, dynamic> json) {
    return TeamMission(
      id: json['id'],
      title: json['title'],
      detail: json['detail'],
    );
  }
}

class PersonMission {
  int id;
  String title;
  String detail;

  PersonMission({
    required this.id,
    required this.title,
    required this.detail,
  });

  factory PersonMission.fromJson(Map<String, dynamic> json) {
    return PersonMission(
      id: json['id'],
      title: json['title'],
      detail: json['detail'],
    );
  }
}

class DailyMission {
  int id;
  String title;

  DailyMission({
    required this.id,
    required this.title,
  });

  factory DailyMission.fromJson(Map<String, dynamic> json) {
    return DailyMission(
      id: json['id'],
      title: json['title'],
    );
  }
}
