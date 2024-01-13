import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../Models/ambulan_model.dart';

class AmbulansNotifier extends StateNotifier<List<Ambulan>> {
  AmbulansNotifier() : super([]);

  void addAmbulan(Ambulan ambulan) {
    state = [
      ...state,
      Ambulan(
        id: ambulan.id,
        title: ambulan.title,
        pemesan: ambulan.pemesan,
        pasien: ambulan.pasien,
        berat: ambulan.berat,
        darurat: ambulan.darurat,
        tanggal: ambulan.tanggal,
        pukul: ambulan.pukul,
        lokasiJemput: ambulan.lokasiJemput,
        lokasiAntar: ambulan.lokasiAntar,
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
