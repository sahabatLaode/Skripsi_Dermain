import 'package:dermain/Methods/zakat_method.dart';
import 'package:dermain/Providers/zakat_provider.dart';
import 'package:dermain/Reusable%20Components/Button/pemesanan_button.dart';
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

  bool isShowNominalError = false;
  bool isShowNamaError = false;
  bool isShowEmailError = false;
  bool isShowPhoneError = false;
  bool isLoading = false;
  bool isChecked = false;

  void _addZakat() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();
    bool status = await ZakatMethod.addZakat(
      jenisController.text,
      nominalController.text,
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
          const SnackBar(content: Text('Zakat successfully added')));
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
              warnaIcon: c1,
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
            PemesananButton(
              title: 'Yakin untuk membatalkan?',
              trueButton: () {
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
                    Navigator.of(context).push(konfirmasiDonasi());
                  }
                });
              },
              warnaTrueButton: c1,
              warnaFalseButton: c1,
              warnaAlertTrueButton: c1,
              warnaAlertFalseButton: c1,
            ),
          ],
        ),
      ),
    );
  }
}
