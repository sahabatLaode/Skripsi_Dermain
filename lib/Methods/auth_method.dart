import 'dart:convert';
import 'package:dermain/Models/user_model.dart';
import 'package:dermain/globals.dart' as globals;
import 'package:dermain/globals.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthMethod {
  static Future<bool> register(UserModel user) async {
    final url = Uri.http(globals.addressUrl, 'api/registrasi');

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode(
        {
          'id': user.id,
          'name': user.name,
          'email': user.email,
          'phone': user.phone,
          'password': user.password,
          'password_confirmation': user.password_confirmation,
        },
      ),
    );

    Map<String, dynamic> body = json.decode(response.body);

    return body['status'];
  }

  static Future<List<UserModel>> loadAllUser() async {
    final url = Uri.http(addressUrl, subUser);
    List<UserModel> allUsers = [];

    final response = await http.get(url);
    Map<String, dynamic> body = json.decode(response.body);
    bool status = body['status'];

    if (status) {
      for (final user in body['data']) {
        UserModel tempUser = UserModel(
          id: user['id'].toString(),
          name: user['name'],
          email: user['email'],
          phone: user['phone'],
          password: user['password'],
          password_confirmation: user['password_confirmation'],
        );
        allUsers.add(tempUser);
      }
    }
    return allUsers;
  }

  static Future<UserModel?> getUserData() async {
    String? token = await AuthMethod.getToken();
    print('Token: $token');
    final url = Uri.http(globals.addressUrl, 'api/user');
    if (token != null) {
      final response = await http.get(
        url,
        headers: {'Authorization': 'Bearer $token'},
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> body = json.decode(response.body);
        final status = body['status'];
        if (status) {
          final user = body['data'][0];
          return UserModel(
            id: user['id'].toString(),
            name: user['name'],
            email: user['email'],
            phone: user['phone'],
            password: '',
            password_confirmation: '',
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

  static Future<bool> login(String email, String password) async {
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
    final url = Uri.http(globals.addressUrl, 'api/logout');
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
