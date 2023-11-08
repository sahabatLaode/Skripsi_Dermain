import 'package:dermain/Methods/zakat_method.dart';
import 'package:dermain/Navbar/Components/Aktivitas/Aktivitas%20Donasi/aktivitas_item.dart';
import 'package:dermain/Providers/zakat_provider.dart';
import 'package:dermain/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class AktivitasList extends ConsumerStatefulWidget {
  const AktivitasList(Center center, {super.key});

  @override
  ConsumerState<AktivitasList> createState() => _AktivitasListState();
}

class _AktivitasListState extends ConsumerState<AktivitasList> {
  bool status = false;
  void _loadAllZakats() async {
    setState(() {
      status = false;
    });
    ref
        .read(zakatsProvider.notifier)
        .addZakats(await ZakatMethod.loadAllZakat());
    setState(() {
      status = true;
    });
  }

  @override
  void initState() {
    _loadAllZakats();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final zakats = ref.watch(zakatsProvider);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (zakats.isNotEmpty)
            status
                ? ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: zakats.length,
                    itemBuilder: (context, index) {
                      final zakat =
                          zakats.length > index ? zakats[index] : null;

                      return AktivitasItem(
                        zakat: zakat,
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
