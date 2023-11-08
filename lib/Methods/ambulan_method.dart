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
      for (final ambulans in body['data']) {
        Ambulan tempAmbulan = Ambulan(
          id: ambulans['id'].toString(),
          nama_pemesan: ambulans['nama_pemesan'],
          nama_pasien: ambulans['nama_pasien'],
          berat_badan: ambulans['berat_badan'],
          level_darurat: ambulans['level_darurat'],
          pukul: ambulans['pukul'],
          tanggal: ambulans['tanggal'],
          titik_antar: ambulans['titik_antar'],
          titik_jemput: ambulans['titik_jemput'],
          created_at: ambulans['created_at'],
        );
        allAmbulans.add(tempAmbulan);
      }
    }
    return allAmbulans;
  }

  static Future<bool> addAmbulan(
      String namaPemesan,
      String namaPasien,
      String beratBadan,
      String levelDarurat,
      String pukul,
      String tanggal,
      String titikAntar,
      String titikJemput) async {
    final url = Uri.http(addressUrl, subAmbulan);
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'nama_pemesan': namaPemesan,
        'nama_pasien': namaPasien,
        'berat_badan': beratBadan,
        'level_darurat': levelDarurat,
        'pukul': pukul,
        'tanggal': tanggal,
        'titik_antar': titikAntar,
        'titik_jemput': titikJemput,
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
