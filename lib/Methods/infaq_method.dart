import 'package:dermain/Models/infaq_model.dart';
import 'package:dermain/globals.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class InfaqMethod {
  static Future<List<Infaq>> loadAllInfaq() async {
    final url = Uri.http(addressUrl, subInfaq);
    List<Infaq> allInfaqs = [];

    final response = await http.get(url);

    if (response.headers['content-type'] == 'application/json') {
      Map<String, dynamic> body = json.decode(response.body);
      bool status = body['status'];

      if (status) {
        for (final infaq in body['data']) {
          Infaq tempInfaq = Infaq(
            id: infaq['id'].toString(),
            nominal: infaq['nominal'],
            nama: infaq['nama'],
            email: infaq['email'],
            phone: infaq['phone'],
            jenis_donasi: infaq['jenis_donasi'],
            created_at: infaq['created_at'],
          );
          allInfaqs.add(tempInfaq);
        }
      }
    } else {
      print('Unexpected response: ${response.body}');
    }

    return allInfaqs;
  }

  static Future<bool> addInfaq(
    String jenisDonasi,
    int nominal,
    String nama,
    String email,
    String phone,
  ) async {
    final url = Uri.http(addressUrl, subZakat);
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'jenis_donasi': jenisDonasi,
        'nominal': nominal,
        'nama': nama,
        'email': email,
        'phone': phone,
      }),
    );
    Map<String, dynamic> body = json.decode(response.body);
    return body['status'];
  }

  static Future<bool> removeInfaq(String id) async {
    final url = Uri.http(addressUrl, '$subZakat/$id');

    final response = await http.delete(url);

    Map<String, dynamic> body = json.decode(response.body);

    return body['status'];
  }
}
