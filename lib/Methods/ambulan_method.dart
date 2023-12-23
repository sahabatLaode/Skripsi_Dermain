import 'package:dermain/Models/ambulan_model.dart';
import 'package:dermain/globals.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

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
          lokasi: ambulans['lokasi'],
          created_at: ambulans['created_at'],
        );
        allAmbulans.add(tempAmbulan);
      }
    }
    return allAmbulans;
  }

  static Future<bool> addAmbulan(
      String nama_pemesan,
      String nama_pasien,
      String berat_badan,
      String level_darurat,
      String pukul,
      String tanggal,
      String lokasi) async {
    final url = Uri.http(addressUrl, subAmbulan);
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'nama_pemesan': nama_pemesan,
        'nama_pasien': nama_pasien,
        'berat_badan': berat_badan,
        'level_darurat': level_darurat,
        'pukul': pukul,
        'tanggal': tanggal,
        'lokasi' : lokasi,
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
