import 'package:dermain/Methods/zakat_method.dart';
import 'package:dermain/Providers/zakat_provider.dart';
import 'package:dermain/Reusable%20Components/Widget/custom_snackbar.dart';
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
import 'package:intl/intl.dart';

class DonasiZakat extends ConsumerStatefulWidget {
  const DonasiZakat({super.key});

  @override
  ConsumerState<DonasiZakat> createState() => _DonasiZakatState();
}

class _DonasiZakatState extends ConsumerState<DonasiZakat> {
  final nominalController = TextEditingController();
  final namaController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final jenisController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final formatter = NumberFormat.simpleCurrency(locale: 'id_ID');

  bool isShowNominalError = false;
  bool isShowNamaError = false;
  bool isShowEmailError = false;
  bool isShowPhoneError = false;
  bool isLoading = false;

  void _addZakat() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();

    String nominalText =
        nominalController.text.replaceAll(RegExp(r'[^0-9]'), '');
    int nominalValue = int.parse(nominalText);

    if (nominalValue < 10000) {
      ScaffoldMessenger.of(context).showSnackBar(CustomSnackBar(
          message: 'Nominal tidak boleh kurang dari Rp10.000',
          icon: Iconsax.warning_2,
          background: cRed));
      return;
    }

    bool status = await ZakatMethod.addZakat(
      jenisController.text,
      nominalValue,
      namaController.text,
      emailController.text,
      phoneController.text,
    );

    if (status) {
      _formKey.currentState!.reset();

      ref
          .read(zakatsProvider.notifier)
          .addZakats(await ZakatMethod.loadAllZakat());
      if (!mounted) return;
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        CustomSnackBar(
          message: 'Zakat anda sudah ditambahkan',
          icon: Iconsax.moneys,
          background: c1,
        ),
      );
      Navigator.of(context).push(keteranganDonasi());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: c1,
        centerTitle: true,
        title: Text(
          jenisController.text = 'Zakat',
          style: GoogleFonts.poppins(
            color: cWhite,
            fontSize: 18,
            fontWeight: semibold,
          ),
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
            // nominal
            const SizedBox(height: 12),
            NominalForm(
              judul: 'Nominal',
              warnaIcon: c1,
              controller: nominalController,
            ),

            // nama
            const SizedBox(height: 12),
            NamaOtomatisForm(
              title: 'Nama Lengkap',
              warnaIcon: c1,
              warnaCheckBox: c1,
              namaController: namaController,
            ),

            // email
            const SizedBox(height: 12),
            EmailForm(
              title: 'Email',
              warnaIcon: c1,
              controller: emailController,
            ),

            // hp
            const SizedBox(height: 12),
            HpForm(
              title: 'Nomor Telepon Aktif',
              controller: phoneController,
              warnaIcon: c1,
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
                  if (nominalController.text.isEmpty ||
                      namaController.text.isEmpty ||
                      emailController.text.isEmpty ||
                      phoneController.text.isEmpty) {
                  } else {
                    _addZakat();
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
