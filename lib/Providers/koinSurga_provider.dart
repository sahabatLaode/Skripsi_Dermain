import 'package:dermain/Models/koinSurga_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class KoinSurgasNotifier extends StateNotifier<List<KoinSurga>> {
  KoinSurgasNotifier() : super([]);

  void addKoinSurga(KoinSurga koinSurga) {
    state = [
      ...state,
      KoinSurga(
        id: koinSurga.id,
        title: koinSurga.title,
        catatan: koinSurga.catatan,
        tanggal: koinSurga.tanggal,
        pukul: koinSurga.pukul,
        jenis_permintaan: koinSurga.jenis_permintaan,
        created_at: koinSurga.created_at,
      ),
    ];
  }

  void addKoinSurgas(List<KoinSurga> koinSurgas) {
    state = koinSurgas;
  }
}

final koinSurgasProvider =
    StateNotifierProvider<KoinSurgasNotifier, List<KoinSurga>>(
        (ref) => KoinSurgasNotifier());
