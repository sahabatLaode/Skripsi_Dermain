import 'package:dermain/Methods/koinSurga_method.dart';
import 'package:dermain/Providers/koinSurga_provider.dart';
import 'package:dermain/Reusable%20Components/Widget/catatan_form.dart';
import 'package:dermain/Reusable%20Components/Widget/dropdowm_form.dart';
import 'package:dermain/Reusable%20Components/Widget/tanggal_form.dart';
import 'package:dermain/Reusable%20Components/Widget/waktu_form.dart';
import 'package:dermain/route_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dermain/theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class PermintaanKoin extends ConsumerStatefulWidget {
  const PermintaanKoin({super.key});

  @override
  ConsumerState<PermintaanKoin> createState() => _PermintaanKoinState();
}

class _PermintaanKoinState extends ConsumerState<PermintaanKoin> {
  final catatanController = TextEditingController();
  final tanggalController = TextEditingController();
  final titleController = TextEditingController();
  final pukulController = TextEditingController();
  final jenisController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool isLoading = false;

  void _addKoinSurga() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();
    bool status = await KoinSurgaMethod.addKoinSurga(
      titleController.text,
      jenisController.text,
      catatanController.text,
      tanggalController.text,
      pukulController.text,
    );

    if (status) {
      _formKey.currentState!.reset();

      ref
          .read(koinSurgasProvider.notifier)
          .addKoinSurgas(await KoinSurgaMethod.loadAllKoinSurga());
      if (!mounted) return;
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Koin surga successfully added')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cWhite,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: c1,
        iconTheme: IconThemeData(
          color: c2,
        ),
        centerTitle: true,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              titleController.text = 'Koin Surga',
              style: GoogleFonts.poppins(
                color: cWhite,
                fontSize: 18,
                fontWeight: semibold,
              ),
            ),
          ],
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: c1,
          statusBarIconBrightness: Brightness.light,
        ),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
          children: [
            // catatan
            const SizedBox(height: 12),
            CatatanForm(
              controller: catatanController,
              title: 'Catatan',
              subtitle: 'Boleh dikosongi',
            ),

            // tanggal
            const SizedBox(height: 12),
            TanggalForm(
              controller: tanggalController,
              title: 'Tanggal',
              warna: c1,
            ),

            // pukul
            const SizedBox(height: 12),
            WaktuForm(
              title: 'Pukul',
              warna: c1,
              controller: pukulController,
            ),

            // jenis permintaan
            const SizedBox(height: 12),
            DropdownForm(
              list: const [
                'Antar Kencleng Koin Surga',
                'Jemput Kencleng Koin Surga'
              ],
              controller: jenisController,
              warnaIcon: c1,
              title: 'Jenis Permintaan',
              warning: 'Pastikan jenis permintaan sudah benar',
              icon: Iconsax.more_circle,
            ),

            // tombol
            const SizedBox(height: 120),
            tombol(),
          ],
        ),
      ),
    );
  }

  Widget tombol() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // TOMBOL BATALKAN
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(right: 8),
            height: 60,
            child: TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    // pop up
                    return AlertDialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      title: Text(
                        'Yakin untuk membatalkan?',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                        ),
                      ),
                      actionsAlignment: MainAxisAlignment.spaceBetween,
                      actions: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 48,
                              width: 120,
                              child: TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                style: TextButton.styleFrom(
                                  backgroundColor: c1,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: Text(
                                  'Tidak',
                                  style: GoogleFonts.poppins(
                                    color: cWhite,
                                    fontSize: 16,
                                    fontWeight: semibold,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            SizedBox(
                              height: 48,
                              width: 120,
                              child: TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/navbar');
                                },
                                style: TextButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      style: BorderStyle.solid,
                                      color: c1,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: Text(
                                  'Ya',
                                  style: GoogleFonts.poppins(
                                    color: c1,
                                    fontSize: 16,
                                    fontWeight: semibold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                );
              },
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    style: BorderStyle.solid,
                    color: c1,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Text(
                'Batalkan',
                style: GoogleFonts.poppins(
                  color: c1,
                  fontSize: 16,
                  fontWeight: semibold,
                ),
              ),
            ),
          ),
        ),

        // TOMBOL PESAN
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(left: 8),
            height: 56,
            child: TextButton(
              onPressed: () {
                setState(() {
                  isLoading = true;
                });
                Future.delayed(const Duration(seconds: 2), () {
                  setState(() {
                    isLoading = false;
                  });
                  if (catatanController.text.isEmpty &&
                          tanggalController.text.isEmpty ||
                      pukulController.text.isEmpty ||
                      jenisController.text.isEmpty) {
                  } else {
                    if (catatanController.text.isEmpty) {
                      catatanController.text = 'Tidak ada catatan';
                    }
                    _addKoinSurga();
                    Navigator.of(context).push(konfirmasiDonasi());
                  }
                });
              },
              style: TextButton.styleFrom(
                backgroundColor: c1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: isLoading
                  ? CircularProgressIndicator(
                      color: cWhite,
                      backgroundColor: c6,
                    )
                  : Text(
                      'Pesan',
                      style: GoogleFonts.poppins(
                        color: cWhite,
                        fontSize: 16,
                        fontWeight: semibold,
                      ),
                    ),
            ),
          ),
        ),
      ],
    );
  }
}
