import 'package:flutter/material.dart';

class MainProvider extends ChangeNotifier {
  String name = "";
  String get getName => name;

  void setName(String nm) {
    name = nm;

    notifyListeners();
  }

  String userImage = "";
  String get getUserImage => userImage;

  void setUserImage(String image) {
    userImage = image;

    notifyListeners();
  }

  String travelName = "";
  String get getTravelName => travelName;

  void setTravelName(String name) {
    travelName = name;

    notifyListeners();
  }

  String travelDate = "";
  String get getTravelDate => travelDate;

  void setTravelDate(String date) {
    travelDate = date;

    print("Jehee travelDate $travelDate");

    notifyListeners();
  }

  int travelId = 0;
  int get getTravelId => travelId;

  void setTravelId(int id) {
    travelId = id;

    print("Jehee travelId $travelId");

    notifyListeners();
  }

  int sex = 0;
  int get getSex => sex;

  void setSex(int value) {
    print("Jehee value : $value");
    sex = value;

    notifyListeners();
  }

  String birthday = "";
  String get getBirthday => birthday;

  void setBirthday(String day) {
    print("Jehee $day");
    birthday = day;

    notifyListeners();
  }

  int userNumber = 0;
  int get getUserNumber => userNumber;

  void setUserNumber(int number) {
    userNumber = number;

    notifyListeners();
  }

  int language = 0;
  int get getLanguage => language;

  void setLanguage(int value) {
    print("Jehee $value");
    language = value;

    notifyListeners();
  }

  int travelWith = 0;
  int get getTravelWith => travelWith;

  void setTravelWith(int value) {
    print("Jehee $value");
    travelWith = value;

    notifyListeners();
  }

  int myRole = 0;
  int get getMyRole => myRole;

  void setMyRole(int value) {
    myRole = value;

    notifyListeners();
  }

  String inDate = "";
  String get getInDate => inDate;

  void setInDate(String date) {
    inDate = date;

    notifyListeners();
  }

  String outDate = "";
  String get getOutDate => outDate;

  void setOutDate(String date) {
    outDate = date;

    notifyListeners();
  }

  int airport = 0;
  int get getAirport => airport;

  void setAirport(int value) {
    airport = value;

    notifyListeners();
  }

  int tripThema = 0;
  int get getTripThema => tripThema;

  void setTripThema(int thema) {
    tripThema = thema;

    notifyListeners();
  }

  String misstionImage = "";
  String get getMissionImage => misstionImage;

  void setMissionImage(String path) {
    misstionImage = path;

    notifyListeners();
  }

  String teamMissionTitle = "";
  String get getTeamMissionTitle => teamMissionTitle;

  void setTeamMissionTitle(String title) {
    teamMissionTitle = title;

    notifyListeners();
  }

  String teamMissionDetail = "";
  String get getTeamMissionDetail => teamMissionDetail;

  void setTeamMissionDetail(String detail) {
    teamMissionDetail = detail;

    notifyListeners();
  }

  int teamMissionId = 0;
  int get getTeamMissionId => teamMissionId;

  void setTeamMissionId(int id) {
    teamMissionId = id;

    notifyListeners();
  }

  String personMissionTitle = "";
  String get getPersonMissionTitle => personMissionTitle;

  void setPersonMissionTitle(String title) {
    personMissionTitle = title;

    notifyListeners();
  }

  String personMissionDetail = "";
  String get getPersonMissionDetail => personMissionDetail;

  void setPersonMissionDetail(String detail) {
    personMissionDetail = detail;

    notifyListeners();
  }

  int personMissionId = 0;
  int get getPersonMissionId => personMissionId;

  void setPersonMissionId(int id) {
    personMissionId = id;

    notifyListeners();
  }

  List<String> dailyMissions = [];
  List<String> get getDailyMissions => dailyMissions;

  void setDailyMissions(List<String> missions) {
    dailyMissions = missions;

    notifyListeners();
  }

  bool firstDailyMission = false;
  bool get getFirstDailyMission => firstDailyMission;

  void setFirstDailyMission(bool status) {
    firstDailyMission = status;

    notifyListeners();
  }

  bool secondDailyMission = false;
  bool get getSecondDailyMission => secondDailyMission;

  void setSecondDailyMission(bool status) {
    secondDailyMission = status;

    notifyListeners();
  }

  bool thirdDailyMission = false;
  bool get getThirdDailyMission => thirdDailyMission;

  void setThirdDailyMission(bool status) {
    thirdDailyMission = status;

    notifyListeners();
  }

  String destination = "";
  String get getDestination => destination;

  void setDestination(String value) {
    destination = value;

    notifyListeners();
  }

  String date = "";
  String get getDate => date;

  void setDate(String value) {
    date = value;

    notifyListeners();
  }

  String time = "";
  String get getTime => time;

  void setTime(String value) {
    time = value;

    notifyListeners();
  }

  int homeStatus = 0;
  int get getHomeStatus => homeStatus;

  void setHomeStatus(int value) {
    homeStatus = value;
  }
}
