import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../Models/ambulan_model.dart';

class AmbulansNotifier extends StateNotifier<List<Ambulan>> {
  AmbulansNotifier() : super([]);

  void addAmbulan(Ambulan ambulan) {
    state = [
      ...state,
      Ambulan(
        id: ambulan.id,
        nama_pemesan: ambulan.nama_pemesan,
        nama_pasien: ambulan.nama_pasien,
        berat_badan: ambulan.berat_badan,
        level_darurat: ambulan.level_darurat,
        pukul: ambulan.pukul,
        tanggal: ambulan.tanggal,
        lokasi: ambulan.lokasi,
        created_at: ambulan.created_at,
      ),
    ];
  }

  void addAmbulans(List<Ambulan> ambulans) {
    state = ambulans;
  }
}

final ambulansProvider = StateNotifierProvider<AmbulansNotifier, List<Ambulan>>(
    (ref) => AmbulansNotifier());
