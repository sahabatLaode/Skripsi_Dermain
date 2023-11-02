import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:dermain/Models/zakat_model.dart';

class ZakatMethod {
  static const addressUrl = '10.0.2.2:8000';
  static const subAddress = 'api/zakat';

  static Future<List<Zakat>> loadAllZakat() async {
    final url = Uri.http(addressUrl, subAddress);
    List<Zakat> allZakats = [];

    final response = await http.get(url);
    Map<String, dynamic> body = json.decode(response.body);
    bool status = body['status'];

    if (status) {
      for (final zakat in body['data']) {
        Zakat tempZakat = Zakat(
          id: zakat['id'].toString(),
          nominal: zakat['nominal'],
          nama: zakat['nama'],
          email: zakat['email'],
          phone: zakat['phone'],
          jenis_donasi: zakat['jenis_donasi'],
          created_at: zakat['created_at'],
        );
        allZakats.add(tempZakat);
      }
    }
    return allZakats;
  }

  static Future<bool> addZakat(String jenisDonasi, String nominal, String nama,
      String email, String phone) async {
    final url = Uri.http(addressUrl, subAddress);
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
}
