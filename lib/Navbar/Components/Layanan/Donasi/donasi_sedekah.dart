import 'package:dermain/Methods/sedekah_method.dart';
import 'package:dermain/Providers/sedekah_provider.dart';
import 'package:dermain/Reusable%20Components/Widget/email_form.dart';
import 'package:dermain/Reusable%20Components/Widget/hp_form.dart';
import 'package:dermain/Reusable%20Components/Widget/nama_otomatis_form.dart';
import 'package:dermain/Reusable%20Components/Widget/nominal_form.dart';
import 'package:dermain/Reusable%20Components/Widget/peringatan_form.dart';
import 'package:dermain/route_animation.dart';
import 'package:flutter/material.dart';
import 'package:dermain/theme.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../Reusable Components/Widget/custom_snackbar.dart';

class DonasiSedekah extends ConsumerStatefulWidget {
  const DonasiSedekah({super.key});

  @override
  ConsumerState<DonasiSedekah> createState() => _DonasiSedekahState();
}

class _DonasiSedekahState extends ConsumerState<DonasiSedekah> {
  final nominalController = TextEditingController();
  final namaController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final jenisController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool isShowNominalError = false;
  bool isShowNamaError = false;
  bool isShowEmailError = false;
  bool isShowPhoneError = false;
  bool isLoading = false;
  bool isChecked = false;

  void _addSedekah() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();

    // Menghapus semua karakter non-numerik dan mengubahnya menjadi int
    String nominalText =
        nominalController.text.replaceAll(RegExp(r'[^0-9]'), '');
    int nominalValue = int.parse(nominalText);

    // Tambahkan pengecekan nilai di sini
    if (nominalValue < 10000) {
      // Tampilkan pesan error atau lakukan tindakan lain
      print('Nilai harus lebih besar atau sama dengan Rp10.000');
      return; // Hentikan eksekusi fungsi
    }

    bool status = await SedekahMethod.addSedekah(
      jenisController.text,
      nominalValue,
      namaController.text,
      emailController.text,
      phoneController.text,
    );

    if (status) {
      _formKey.currentState!.reset();

      ref
          .read(sedekahsProvider.notifier)
          .addSedekahs(await SedekahMethod.loadAllSedekah());
      if (!mounted) return;
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        CustomSnackBar(
          message: 'Sedekah anda sudah ditambahkan',
          icon: Iconsax.gift,
          background: c2,
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
        backgroundColor: c2,
        centerTitle: true,
        title: Text(
          jenisController.text = 'Sedekah',
          style: GoogleFonts.poppins(
            color: cWhite,
            fontSize: 18,
            fontWeight: semibold,
          ),
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: c2,
          statusBarIconBrightness: Brightness.light,
        ),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
          children: [
            // nominal
            const SizedBox(height: 12),
            NominalForm(
              judul: 'Nominal',
              warnaIcon: c2,
              controller: nominalController,
            ),

            // nama
            const SizedBox(height: 12),
            NamaOtomatisForm(
              title: 'Nama Lengkap',
              warnaIcon: c2,
              warnaCheckBox: c2,
              namaController: namaController,
            ),

            // email
            const SizedBox(height: 12),
            EmailForm(
              title: 'Email',
              warnaIcon: c2,
              controller: emailController,
            ),

            // hp
            const SizedBox(height: 12),
            HpForm(
              title: 'Nomor Telepon Aktif',
              warnaIcon: c2,
              controller: phoneController,
            ),

            // peringatan
            const SizedBox(height: 12),
            const PeringatanForm(
              teks1:
                  'Pastikan data yang anda isi sudah benar. Seperti nominal, nama lengkap, email serta nomor telepon. Untuk keperluan konfirmasi donasi.',
              teks2:
                  'Untuk pembayaran zakat, pastikan bahwa donatur/muzaki telah menghitungnya dengan benar sesuai dengan ketentuan syariah yang berlaku. Jika ragu, silahkan konsultasikan ke nomor layanan muzaki kami.',
            ),

            // tombol
            const SizedBox(height: 32),
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
                                  backgroundColor: c2,
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
                                      color: c2,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: Text(
                                  'Ya',
                                  style: GoogleFonts.poppins(
                                    color: c2,
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
                    color: c2,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Text(
                'Batalkan',
                style: GoogleFonts.poppins(
                  color: c2,
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
                  if (nominalController.text.isEmpty ||
                      namaController.text.isEmpty ||
                      emailController.text.isEmpty ||
                      phoneController.text.isEmpty) {
                  } else {
                    _addSedekah();
                    Navigator.of(context).push(konfirmasi());
                  }
                });
              },
              style: TextButton.styleFrom(
                backgroundColor: c2,
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
