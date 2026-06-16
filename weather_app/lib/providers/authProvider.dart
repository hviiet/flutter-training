import 'package:flutter/material.dart';
import 'package:weather_app/models/login_respone.dart';
import 'package:weather_app/models/user_model.dart';
import 'package:weather_app/services/auth_service.dart';
import 'package:weather_app/services/storage_service.dart';

class Authprovider extends ChangeNotifier {
  final AuthService authService = AuthService();
  final StorageService storageService = StorageService();

  UserModel? currentUser;
  // bool isLoading = false;
  String? errorMessage;

  Future<bool> login(String email, String password) async {
    try{
      final token = await authService.login(email, password);
      await storageService.saveAccessToken(token.accessToken);
      await storageService.saveRefreshToken(token.refreshToken);

      currentUser = await authService.getProfile(token.accessToken);
      return true;
    }
    catch(e){
      errorMessage = e.toString();
      return false;
    }
  }

  Future<bool> getProfile() async{
    try{

      final access_token = await storageService.getAccessToken();

      if(access_token == null){
        return false;
      }
      currentUser = await authService.getProfile(access_token);
      return true;

    }
    catch(e){
      try{
        final LoginResponse newtoken = await authService.refreshToken();
        await storageService.saveAccessToken(newtoken.accessToken);
        await storageService.saveRefreshToken(newtoken.refreshToken);
        
        currentUser = await authService.getProfile(newtoken.accessToken);
        return true;
      }
      catch(e){
        errorMessage = e.toString();
        return false;
      }
    }
  }

  // Future<bool> checkLogin() async {
  //   final token = await storageService.getAccessToken();
  //   return token != null;
  // }

  Future<bool> checkAuth() async {
    try {
      return await getProfile();
    } 
    catch(e){
      return false;
    }
  }

}