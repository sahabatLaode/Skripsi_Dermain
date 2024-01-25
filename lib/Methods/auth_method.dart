import 'dart:convert';
import 'package:dermain/Models/user_model.dart';
import 'package:dermain/globals.dart' as globals;
import 'package:dermain/globals.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthMethod {
  static Future<bool> register(UserModel user) async {
    final url = Uri.http(globals.addressUrl, subRegister);

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode(
        {
          'id': user.id,
          'name': user.name,
          'email': user.email,
          // 'phone': user.phone,
          // 'birth': user.birth,
          // 'nik': user.nik,
          // 'address': user.address,
          // 'ranting': user.ranting,
          'password': user.password,
          'password_confirmation': user.passwordConfirmation,
        },
      ),
    );

    Map<String, dynamic> body = json.decode(response.body);
    return body['status'];
  }

  Future<UserModel> fetchUserData(String id, String name, String email) async {
    final response = await http.get(
      Uri.parse(addressUrl, 'user/data/$id' as int),
    );

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return UserModel.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load user data');
    }
  }

  Future<UserModel> updateUserPassword(String name, String email) async {
    final response = await http.put(
      Uri.parse(addressUrl, 'user/data/{id}' as int),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'name': name,
        'email': email,
      }),
    );

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return UserModel.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to update password.');
    }
  }

  static Future<UserModel?> getUserData() async {
    String? token = await AuthMethod.getToken();
    print('Token: $token');
    final url = Uri.http(globals.addressUrl, subUser);
    if (token != null) {
      final response = await http.get(
        url,
        headers: {'Authorization': 'Bearer $token'},
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> body = json.decode(response.body);
        final status = body['status'];
        if (status) {
          var user = body['data'][0];
          return UserModel(
            id: user['id'].toString(),
            name: user['name'],
            email: user['email'],
            // phone: user['phone'],
            password: '',
            passwordConfirmation: '',
          );
        }
      }
    }
    return null;
  }

  static Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  static Future<bool> setToken(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString('token', value);
  }

  static Future<bool> login(String? email, String? password) async {
    final url = Uri.http(globals.addressUrl, sublogin);
    final response = await http.post(
      url,
      body: {
        'email': email,
        'password': password,
      },
    );

    Map<String, dynamic> body = json.decode(response.body);
    await setToken(body['token']);
    return body['status'];
  }

  static Future<bool> logout() async {
    final url = Uri.http(globals.addressUrl, sublogout);
    // bool status = false;
    String? token = await AuthMethod.getToken();
    if (token != null) {
      final response = await http.get(
        url,
        headers: {'Authorization': 'Bearer $token'},
      );
      Map<String, dynamic> body = json.decode(response.body);
      return body['status'];
    }
    return false;
  }
}
