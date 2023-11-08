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
          catatan: koinSurga['catatan'],
          tanggal: koinSurga['tanggal'],
          jenis_permintaan: koinSurga['jenis_permintaan'],
          created_at: koinSurga['created_at'],
        );
        allKoinSurgas.add(tempKoinSurga);
      }
    }
    return allKoinSurgas;
  }

  static Future<bool> addKoinSurga(
      String jenisPermintaan, String catatan, String tanggal) async {
    final url = Uri.http(addressUrl, subKoin);
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'jenis_permintaan': jenisPermintaan,
        'catatan': catatan,
        'tanggal': tanggal,
      }),
    );
    Map<String, dynamic> body = json.decode(response.body);
    return body['status'];
  }

  static Future<bool> removeKoinSurga(String id) async {
    final url = Uri.http(addressUrl, '$subKoin/$id');

    final response = await http.delete(url);

    Map<String, dynamic> body = json.decode(response.body);

    return body['status'];
  }
}
