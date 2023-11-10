import 'package:flutter/material.dart';

class MainProvider extends ChangeNotifier {
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

  int destination = 0;
  int get getDestination => destination;

  void setDestination(int value) {
    destination = value;

    notifyListeners();
  }

  String misstionImage = "";
  String get getMissionImage => misstionImage;

  void setMissionImage(String path) {
    misstionImage = path;

    notifyListeners();
  }
}