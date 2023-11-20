import 'dart:convert';
import 'package:dermain/globals.dart';
import 'package:dio/dio.dart';

class DioProvider {
  Future<dynamic> getToken(String email, String password) async {
    try {
      var response = await Dio().post('$addressUrl, $subUser',
          data: {'email': email, 'password': password});

      // if request succesfully. then return token
      if (response.statusCode == 200 && response.data != '') {
        return response.data;
      }
    } catch (error) {
      return error;
    }
  }

  // get user data
  Future<dynamic> getUser(String token) async {
    try {
      var user = await Dio().get('$addressUrl, $subUser',
          options: Options(headers: {'Authorization': 'Bearer $token'}));

      // if request succesfully, then return user data
      if (user.statusCode == 200 && user.data != '') {
        return json.encode(user.data);
      }
    } catch (error) {
      return error;
    }
  }
}
