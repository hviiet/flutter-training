import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  String? name;
  String? mail;
  String? avatarUrl;

  void setUser({required String name, required String mail, required String avatarUrl}){
    this.name = name;
    this.mail = mail;
    this.avatarUrl = avatarUrl;
    notifyListeners();
  }

  void clearUser(){
    name = null;
    mail = null;
    avatarUrl = null;
    notifyListeners();
  }
}