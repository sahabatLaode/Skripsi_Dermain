import 'package:dermain/Methods/ambulan_method.dart';
import 'package:dermain/Providers/ambulans_provider.dart';
import 'package:dermain/Reusable%20Components/Widget/custom_snackbar.dart';
import 'package:dermain/Reusable%20Components/Widget/dropdowm_form.dart';
import 'package:dermain/Reusable%20Components/Widget/lokasi_form.dart';
import 'package:dermain/Reusable%20Components/Widget/nama_form.dart';
import 'package:dermain/Reusable%20Components/Widget/tanggal_form.dart';
import 'package:dermain/Reusable%20Components/Widget/waktu_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../route_animation.dart';
import '../../../../theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class PermintaanAmbulan extends ConsumerStatefulWidget {
  const PermintaanAmbulan({super.key});

  @override
  ConsumerState<PermintaanAmbulan> createState() => _PermintaanAmbulanState();
}

class _PermintaanAmbulanState extends ConsumerState<PermintaanAmbulan> {
  final titleController = TextEditingController();
  final namaPemesanController = TextEditingController();
  final namaPasienController = TextEditingController();
  final beratBadanController = TextEditingController();
  final levelDaruratController = TextEditingController();
  final tanggalController = TextEditingController();
  final pukulController = TextEditingController();
  final lokasiJemputController = TextEditingController();
  final lokasiAntarController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool isLoading = false;

  void _addAmbulan() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();
    bool status = await AmbulanMethod.addAmbulan(
      titleController.text,
      namaPemesanController.text,
      namaPasienController.text,
      beratBadanController.text,
      levelDaruratController.text,
      tanggalController.text,
      pukulController.text,
      lokasiJemputController.text,
      lokasiAntarController.text,
    );

    if (status) {
      _formKey.currentState!.reset();

      ref
          .read(ambulansProvider.notifier)
          .addAmbulans(await AmbulanMethod.loadAllAmbulan());
      if (!mounted) return;
      // ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        CustomSnackBar(
          message: 'Permintaan ambulans anda sudah ditambahkan',
          icon: Iconsax.truck,
          background: c3,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cWhite,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: c3,
        centerTitle: true,
        title: Text(
          titleController.text = 'Ambulans',
          style: GoogleFonts.poppins(
            color: cWhite,
            fontSize: 18,
            fontWeight: semibold,
          ),
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: c3,
          statusBarIconBrightness: Brightness.light,
        ),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              // pemesan
              NamaForm(
                title: 'Nama Pemesan',
                controller: namaPemesanController,
                hint: 'Nama',
                warning: 'Masukkan nama pemesan',
                color: c3,
              ),

              // pasien
              const SizedBox(height: 12),
              NamaForm(
                title: 'Nama Pasien',
                controller: namaPasienController,
                hint: 'Nama lengkap',
                warning: 'Masukkan nama lengkap pasien',
                color: c3,
              ),

              // lokasi jemput
              const SizedBox(height: 12),
              LokasiForm(
                title: 'Lokasi Jemput',
                hint: 'Pilih lokasi jemput di peta',
                color: c3,
                controller: lokasiJemputController,
                iconData: Iconsax.gps,
              ),

              // lokasi antar
              const SizedBox(height: 12),
              LokasiForm(
                title: 'Lokasi Antar',
                hint: 'Pilih lokasi antar di peta',
                color: c3,
                controller: lokasiAntarController,
                iconData: Iconsax.location,
              ),

              // tanggal
              const SizedBox(height: 12),
              TanggalForm(
                controller: tanggalController,
                title: 'Tanggal',
                warna: c3,
              ),

              // waktu,
              const SizedBox(height: 12),
              WaktuForm(
                title: 'Pukul',
                warna: c3,
                controller: pukulController,
              ),

              // berat badan
              const SizedBox(height: 12),
              DropdownForm(
                list: const ['1-30kg', '31-60kg', '61-90kg', '>90kg'],
                controller: beratBadanController,
                warnaIcon: c3,
                title: 'Berat Badan',
                warning: 'Pastikan berat badan sudah benar',
                icon: Iconsax.weight,
              ),

              // level darurat
              const SizedBox(height: 12),
              DropdownForm(
                list: const ['Ringan', 'Sedang', 'Berat'],
                controller: levelDaruratController,
                warnaIcon: c3,
                title: 'Level Darurat',
                warning: 'Pastikan level darurat sudah benar',
                icon: Iconsax.level,
              ),

              // tombol
              const SizedBox(height: 32),
              tombol(),
              const SizedBox(height: 20),
            ],
          ),
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
                                  backgroundColor: c3,
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
                                      color: c3,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: Text(
                                  'Ya',
                                  style: GoogleFonts.poppins(
                                    color: c3,
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
                    color: c3,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Text(
                'Batalkan',
                style: GoogleFonts.poppins(
                  color: c3,
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
                  if (namaPemesanController.text.isEmpty ||
                      namaPasienController.text.isEmpty ||
                      beratBadanController.text.isEmpty ||
                      levelDaruratController.text.isEmpty ||
                      tanggalController.text.isEmpty ||
                      pukulController.text.isEmpty ||
                      lokasiJemputController.text.isEmpty &&
                          lokasiAntarController.text.isEmpty) {
                  } else {
                    _addAmbulan();
                    Navigator.of(context).push(konfirmasiDonasi());
                  }
                });
              },
              style: TextButton.styleFrom(
                backgroundColor: c3,
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
