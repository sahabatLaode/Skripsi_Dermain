import 'package:dermain/Methods/zakat_method.dart';
import 'package:dermain/Navbar/Components/Aktivitas/aktivitas_item.dart';
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

    return zakats.isNotEmpty
        ? status
            ? ListView.builder(
                // scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: zakats.length,
                itemBuilder: (context, index) =>
                    AktivitasItem(zakat: zakats[index]),
              )
            : Center(
                child: LoadingAnimationWidget.staggeredDotsWave(
                  color: c1,
                  size: 80,
                ),
              )
        : Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 16),
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
          );
  }
}
