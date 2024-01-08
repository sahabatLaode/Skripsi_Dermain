import 'package:dermain/Methods/ambulan_method.dart';
import 'package:dermain/Methods/koinSurga_method.dart';
import 'package:dermain/Models/ambulan_model.dart';
import 'package:dermain/Models/koinSurga_model.dart';
import 'package:dermain/Navbar/Components/Aktivitas/Aktivitas%20Permintaan/aktivitas_item_permintaan.dart';
import 'package:dermain/Providers/ambulans_provider.dart';
import 'package:dermain/Providers/koinSurga_provider.dart';
import 'package:dermain/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class AktivitasListPermintaan extends ConsumerStatefulWidget {
  const AktivitasListPermintaan(Center center, {super.key});

  @override
  ConsumerState<AktivitasListPermintaan> createState() =>
      _AktivitasListPermintaanState();
}

class _AktivitasListPermintaanState
    extends ConsumerState<AktivitasListPermintaan> {
  bool status = false;

  void _loadAllKoinSurgasAndAmbulans() async {
    setState(() {
      status = false;
    });

    final koinSurgas = await KoinSurgaMethod.loadAllKoinSurga();
    final ambulans = await AmbulanMethod.loadAllAmbulan();

    ref.read(koinSurgasProvider.notifier).addKoinSurgas(koinSurgas);
    ref.read(ambulansProvider.notifier).addAmbulans(ambulans);

    setState(() {
      status = true;
    });
  }

  @override
  void initState() {
    _loadAllKoinSurgasAndAmbulans();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final koinSurgas = ref.watch(koinSurgasProvider);
    final ambulans = ref.watch(ambulansProvider);

    List<dynamic> combinedList = [];
    combinedList.addAll(koinSurgas);
    combinedList.addAll(ambulans);

    // Mengurutkan list berdasarkan tanggal penambahan
    combinedList.sort((a, b) => b.created_at.compareTo(a.created_at));

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (combinedList.isNotEmpty)
            status
                ? ListView.builder(
                    shrinkWrap: true,
                    // physics: const NeverScrollableScrollPhysics(),
                    itemCount: combinedList.length,
                    itemBuilder: (context, index) {
                      final item = combinedList[index];
                      if (item is KoinSurga) {
                        return AktivitasItemPermintaan(
                            koinSurga: item, ambulan: null);
                      } else if (item is Ambulan) {
                        return AktivitasItemPermintaan(
                            ambulan: item, koinSurga: null);
                      }
                      return null;
                    },
                  )
                : Center(
                    child: LoadingAnimationWidget.staggeredDotsWave(
                      color: cBlack,
                      size: 80,
                    ),
                  )
          else
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 16, top: 150),
                    height: 220,
                    child: Image.asset('assets/images/image_aktivitas1.png'),
                  ),
                  Text(
                    'Belum ada aktivitas',
                    style: GoogleFonts.poppins(
                      color: cBlack,
                      fontWeight: semibold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        '/donasiZakat',
                      );
                    },
                    child: Text(
                      'Mulai dengan zakat',
                      style: GoogleFonts.poppins(
                        color: cBlack,
                        fontWeight: semibold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
