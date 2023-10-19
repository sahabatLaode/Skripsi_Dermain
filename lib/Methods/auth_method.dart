import 'dart:convert';
import 'package:dermain/Models/user_model.dart';
import 'package:dermain/globals.dart' as globals;
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

  static Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  static Future<bool> setToken(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString('token', value);
  }

  static Future<bool> login(String username, String password) async {
    final url = Uri.http(globals.addressUrl, 'api/login');
    final response = await http.post(
      url,
      body: {
        'username': username,
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
