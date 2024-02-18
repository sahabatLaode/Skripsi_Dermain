import 'package:dermain/Models/zakat_model.dart';
// import 'package:dermain/globals.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:http/http.dart' as http;

class ZakatsNotifier extends StateNotifier<List<Zakat>> {
  ZakatsNotifier() : super([]);

  void addZakat(Zakat zakat) {
    state = [
      ...state,
      Zakat(
        id: zakat.id,
        nominal: zakat.nominal,
        nama: zakat.nama,
        email: zakat.email,
        phone: zakat.phone,
        jenis_donasi: zakat.jenis_donasi,
        status: zakat.status,
        created_at: zakat.created_at,
      ),
    ];
  }

  void addZakats(List<Zakat> zakats) {
    state = zakats;
  }

  // Future<void> changeStatus(String requestId, String newStatus) async {
  //   var url = Uri.parse(addressUrl, 'api/changeStatus' as int);
  //   var response = await http
  //       .post(url, body: {'request_id': requestId, 'new_status': newStatus});

  //   if (response.statusCode == 200) {
  //     for (var zakat in state) {
  //       if (zakat.id == requestId) {
  //         zakat.status = newStatus;
  //         state = [
  //           ...state
  //         ];
  //         break;
  //       }
  //     }
  //   } else {
  //     print('Failed to change status.');
  //   }
  // }
}

final zakatsProvider = StateNotifierProvider<ZakatsNotifier, List<Zakat>>(
    (ref) => ZakatsNotifier());
