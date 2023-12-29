import 'package:dermain/Models/ambulan_model.dart';
import 'package:dermain/globals.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AmbulanMethod {
  static Future<List<Ambulan>> loadAllAmbulan() async {
    final url = Uri.http(addressUrl, subAmbulan);
    List<Ambulan> allAmbulans = [];

    final response = await http.get(url);
    Map<String, dynamic> body = json.decode(response.body);
    bool status = body['status'];

    if (status) {
      for (final ambulan in body['data']) {
        Ambulan tempAmbulan = Ambulan(
          id: ambulan['id'].toString(),
          title: ambulan['title'],
          pemesan: ambulan['pemesan'],
          pasien: ambulan['pasien'],
          berat: ambulan['berat'],
          darurat: ambulan['darurat'],
          tanggal: ambulan['tanggal'],
          pukul: ambulan['pukul'],
          lokasi: ambulan['lokasi'],
          created_at: ambulan['created_at'],
        );
        allAmbulans.add(tempAmbulan);
      }
    }
    return allAmbulans;
  }

  static Future<bool> addAmbulan(
    String title,
    String pemesan,
    String pasien,
    String berat,
    String darurat,
    String tanggal,
    String pukul,
    String lokasi,
  ) async {
    final url = Uri.http(addressUrl, subAmbulan);
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'title': title,
        'pemesan': pemesan,
        'pasien': pasien,
        'berat': berat,
        'darurat': darurat,
        'tanggal': tanggal,
        'pukul': pukul,
        'lokasi': lokasi,
      }),
    );
    Map<String, dynamic> body = json.decode(response.body);
    return body['status'];
  }

  static Future<bool> removeAmbulan(String id) async {
    final url = Uri.http(addressUrl, '$subAmbulan/$id');

    final response = await http.delete(url);

    Map<String, dynamic> body = json.decode(response.body);

    return body['status'];
  }
}
