import 'package:dio/dio.dart';
import 'package:weather_app/models/login_respone.dart';
import 'package:weather_app/models/user_model.dart';
import 'package:weather_app/services/storage_service.dart';

class AuthService {
  final Dio dio = Dio();

  // login
  Future<LoginResponse> login(String email, String password) async {
    try{
      final response =  await dio.post(
      "https://api.escuelajs.co/api/v1/auth/login",
      data: {
        "email": email,
        "password": password,
      },
    );

    return LoginResponse.fromJson(response.data);
    }catch(e){
      print("Error during login: $e");
      rethrow;
    }
  }

  //profile
  Future<UserModel> getProfile(String accessToken) async {
    try{
      final response = await dio.get(
        "https://api.escuelajs.co/api/v1/auth/profile",
        options: Options(
          headers: {
            "Authorization": "Bearer $accessToken",
          },
        ),
      );

      return UserModel.fromJson(response.data);
    }
    catch(e){
      print("Error fetching profile: $e");
      rethrow;
    }
  }

  //refreshtoken
  Future<LoginResponse> refreshToken() async{
    final StorageService storage = StorageService();
    final refresh_token = await storage.getRefreshToken();
    try{
      final response = await dio.post(
        "https://api.escuelajs.co/api/v1/auth/refresh-token",
        data: {
          "refreshToken": refresh_token,
        },
      );

      return LoginResponse.fromJson(response.data);
    }
    catch(e){
      print("Error refreshing token: $e");
      rethrow;
    }
  }
  
}