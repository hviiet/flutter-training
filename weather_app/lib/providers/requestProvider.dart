import 'package:flutter/material.dart';

class Requestprovider extends ChangeNotifier {
  String email = "";
  String location = "";
  DateTime? selectedDate;

  void setEmail(String value){
    email = value;
    notifyListeners();
  }

  void setLocation(String value){
    location = value;
    notifyListeners();
  }

  void setDate(DateTime value){
    selectedDate = value;
    notifyListeners();
  }
}