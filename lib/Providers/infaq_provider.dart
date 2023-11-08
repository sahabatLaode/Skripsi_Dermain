import 'package:dermain/Models/infaq_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InfaqsNotifier extends StateNotifier<List<Infaq>> {
  InfaqsNotifier() : super([]);

  void addInfaq(Infaq infaq) {
    state = [
      ...state,
      Infaq(
        id: infaq.id,
        nominal: infaq.nominal,
        nama: infaq.nama,
        email: infaq.email,
        phone: infaq.phone,
        jenis_donasi: infaq.jenis_donasi,
        created_at: infaq.created_at,
      ),
    ];
  }

  void addInfaqs(List<Infaq> infaqs) {
    state = infaqs;
  }

  // Zakat findZakat(String id) {
  //   Zakat tempZakat = state.firstWhere((zakat) => zakat.id == id);

  //   return tempZakat;
  // }
}

final infaqsProvider = StateNotifierProvider<InfaqsNotifier, List<Infaq>>(
    (ref) => InfaqsNotifier());
