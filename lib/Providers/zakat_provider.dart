import 'package:dermain/Models/zakat_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
        created_at: zakat.created_at,
        FotoZakat: zakat.FotoZakat,
      ),
    ];
  }

  void addZakats(List<Zakat> zakats) {
    state = zakats;
  }

  // Zakat findZakat(String id) {
  //   Zakat tempZakat = state.firstWhere((zakat) => zakat.id == id);

  //   return tempZakat;
  // }
}

final zakatsProvider = StateNotifierProvider<ZakatsNotifier, List<Zakat>>(
    (ref) => ZakatsNotifier());
