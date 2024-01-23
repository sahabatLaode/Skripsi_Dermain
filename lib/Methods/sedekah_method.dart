import 'package:dermain/Models/sedekah_model.dart';
import 'package:dermain/globals.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SedekahMethod {
  static Future<List<Sedekah>> loadAllSedekah() async {
    final url = Uri.http(addressUrl, subSedekah);
    List<Sedekah> allSedekahs = [];

    final response = await http.get(url);

    if (response.headers['content-type'] == 'application/json') {
      Map<String, dynamic> body = json.decode(response.body);
      bool status = body['status'];

      if (status) {
        for (final sedekah in body['data']) {
          Sedekah tempSedekah = Sedekah(
            id: sedekah['id'].toString(),
            nominal: sedekah['nominal'],
            nama: sedekah['nama'],
            email: sedekah['email'],
            phone: sedekah['phone'],
            jenis_donasi: sedekah['jenis_donasi'],
            created_at: sedekah['created_at'],
          );
          allSedekahs.add(tempSedekah);
        }
      }
    } else {
      print('Unexpected response: ${response.body}');
    }

    return allSedekahs;
  }

  static Future<bool> addSedekah(
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

  static Future<bool> removeSedekah(String id) async {
    final url = Uri.http(addressUrl, '$subZakat/$id');

    final response = await http.delete(url);

    Map<String, dynamic> body = json.decode(response.body);

    return body['status'];
  }
}
