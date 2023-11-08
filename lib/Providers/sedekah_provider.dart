import 'package:dermain/Models/sedekah_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SedekahsNotifier extends StateNotifier<List<Sedekah>> {
  SedekahsNotifier() : super([]);

  void addSedekah(Sedekah sedekah) {
    state = [
      ...state,
      Sedekah(
        id: sedekah.id,
        nominal: sedekah.nominal,
        nama: sedekah.nama,
        email: sedekah.email,
        phone: sedekah.phone,
        jenis_donasi: sedekah.jenis_donasi,
        created_at: sedekah.created_at,
      ),
    ];
  }

  void addSedekahs(List<Sedekah> sedekahs) {
    state = sedekahs;
  }

  // Zakat findZakat(String id) {
  //   Zakat tempZakat = state.firstWhere((zakat) => zakat.id == id);

  //   return tempZakat;
  // }
}

final sedekahsProvider = StateNotifierProvider<SedekahsNotifier, List<Sedekah>>(
    (ref) => SedekahsNotifier());
