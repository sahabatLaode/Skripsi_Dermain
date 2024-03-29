import 'package:dermain/Models/koinSurga_model.dart';
import 'package:dermain/globals.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class KoinSurgaMethod {
  static Future<List<KoinSurga>> loadAllKoinSurga() async {
    final url = Uri.http(addressUrl, subKoin);
    List<KoinSurga> allKoinSurgas = [];

    final response = await http.get(url);
    Map<String, dynamic> body = json.decode(response.body);
    bool status = body['status'];

    if (status) {
      for (final koinSurga in body['data']) {
        KoinSurga tempKoinSurga = KoinSurga(
          id: koinSurga['id'].toString(),
          title: koinSurga['title'],
          catatan: koinSurga['catatan'],
          tanggal: koinSurga['tanggal'],
          pukul: koinSurga['pukul'],
          jenis_permintaan: koinSurga['jenis_permintaan'],
          created_at: koinSurga['created_at'],
        );
        allKoinSurgas.add(tempKoinSurga);
      }
    }
    return allKoinSurgas;
  }

  static Future<bool> addKoinSurga(
    String title,
    String jenisPermintaan,
    String catatan,
    String tanggal,
    String pukul,
  ) async {
    final url = Uri.http(addressUrl, subKoin);
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'title': title,
        'jenis_permintaan': jenisPermintaan,
        'catatan': catatan,
        'tanggal': tanggal,
        'pukul': pukul,
      }),
    );
    Map<String, dynamic> body = json.decode(response.body);
    return body['status'];
  }
}
