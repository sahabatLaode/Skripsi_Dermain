import 'package:dermain/Methods/koinSurga_method.dart';
import 'package:dermain/Navbar/Components/Aktivitas/Aktivitas%20Permintaan/aktivitas_item_permintaan.dart';
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
  void _loadAllKoinSurgas() async {
    setState(() {
      status = false;
    });
    ref
        .read(koinSurgasProvider.notifier)
        .addKoinSurgas(await KoinSurgaMethod.loadAllKoinSurga());
    setState(() {
      status = true;
    });
  }

  @override
  void initState() {
    _loadAllKoinSurgas();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final koinSurgas = ref.watch(koinSurgasProvider);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (koinSurgas.isNotEmpty)
            status
                ? ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: koinSurgas.length,
                    itemBuilder: (context, index) {
                      final koinSurga =
                          koinSurgas.length > index ? koinSurgas[index] : null;

                      return AktivitasItemPermintaan(
                        koinSurga: koinSurga,
                      );
                    },
                  )
                : Center(
                    child: LoadingAnimationWidget.staggeredDotsWave(
                      color: c1,
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
                      color: c1,
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
                        color: c1,
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
