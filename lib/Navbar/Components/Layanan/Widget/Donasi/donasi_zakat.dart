import 'package:dermain/Methods/zakat_method.dart';
import 'package:dermain/Providers/zakat_provider.dart';
import 'package:dermain/route_animation.dart';
import 'package:flutter/material.dart';
import 'package:dermain/theme.dart';
import 'package:flutter/services.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
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

  void myAlert() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          title: Text(
            'Yakin untuk membatalkan?',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(),
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: <Widget>[
            SizedBox(
              height: 60,
              width: 140,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: TextButton.styleFrom(
                  backgroundColor: c2,
                  shape: RoundedRectangleBorder(
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
            SizedBox(
              height: 60,
              width: 140,
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/navbar');
                },
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 2,
                      style: BorderStyle.solid,
                      color: c2,
                    ),
                    borderRadius: BorderRadius.circular(16),
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
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cWhite,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: c2,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Iconsax.arrow_left,
            color: c1,
          ),
        ),
        centerTitle: true,
        title: Text(
          jenisController.text = 'Zakat',
          style: GoogleFonts.poppins(
            color: c1,
            fontSize: 18,
            fontWeight: semibold,
          ),
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: c2,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const SizedBox(height: 12),
            nominal(),
            const SizedBox(height: 12),
            nama(),
            const SizedBox(height: 12),
            email(),
            const SizedBox(height: 12),
            telepon(),
            const SizedBox(height: 12),
            peringatan(),
            const SizedBox(height: 32),
            tombol(),
          ],
        ),
      ),
    );
  }

  Widget nominal() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Nominal',
          style: GoogleFonts.poppins(
            color: c1,
            fontSize: 12,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 6),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          height: 60,
          decoration: BoxDecoration(
            color: c5,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Rp',
                style: GoogleFonts.poppins(
                  color: c1,
                  fontSize: 24,
                  fontWeight: bold,
                ),
              ),
              Expanded(
                child: TextFormField(
                  controller: nominalController,
                  keyboardType: TextInputType.number,
                  autocorrect: false,
                  inputFormatters: [
                    CurrencyInputFormatter(
                      // trailingSymbol: CurrencySymbols.,
                      useSymbolPadding: true,
                      mantissaLength: 3,
                    ),
                  ],
                  decoration: InputDecoration.collapsed(
                    hintText: '0.000',
                    hintStyle: GoogleFonts.poppins(
                      color: c3,
                      fontSize: 24,
                    ),
                  ),
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: bold,
                  ),
                  onChanged: (value) {
                    setState(() {});
                  },
                ),
              ),
            ],
          ),
        ),
        if (nominalController.text.isEmpty || nominalController.text == '0.000')
          Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Text(
              'Masukkan nominal',
              style: GoogleFonts.poppins(
                color: kRedColor,
              ),
            ),
          ),
      ],
    );
  }

  Widget nama() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Nama Lengkap',
          style: GoogleFonts.poppins(
            color: c1,
            fontSize: 12,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 6),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          height: 60,
          decoration: BoxDecoration(
            color: c5,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              Icon(
                Iconsax.user,
                color: c1,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: TextFormField(
                  controller: namaController,
                  decoration: InputDecoration.collapsed(
                    hintText: 'Nama Lengkap',
                    hintStyle: GoogleFonts.poppins(
                      color: c3,
                      fontSize: 16,
                    ),
                  ),
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                  ),
                  onChanged: (value) {
                    setState(() {});
                  },
                ),
              ),
            ],
          ),
        ),
        if (namaController.text.isEmpty || namaController.text == '')
          Text(
            'Masukkan nama lengkap',
            style: GoogleFonts.poppins(
              color: kRedColor,
            ),
          ),
        CheckboxListTile(
          title: Text(
            "Sembunyikan sebagai Hamba Allah",
            style: GoogleFonts.poppins(
              color: c1,
              fontSize: 12,
            ),
          ),
          value: isChecked,
          onChanged: ((value) {
            setState(() {
              isChecked = value!;
              if (isChecked) {
                namaController.text = "Hamba Allah";
              } else {
                namaController.text = "";
              }
            });
          }),
        ),
      ],
    );
  }

  Widget email() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Email',
          style: GoogleFonts.poppins(
            color: c1,
            fontSize: 12,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 6),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          height: 60,
          decoration: BoxDecoration(
            color: c5,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              Icon(
                Iconsax.sms,
                color: c1,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.streetAddress,
                  decoration: InputDecoration.collapsed(
                    hintText: 'lazismu@gmail.com',
                    hintStyle: GoogleFonts.poppins(
                      color: c3,
                      fontSize: 16,
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {});
                  },
                ),
              ),
            ],
          ),
        ),
        if (emailController.text.isEmpty ||
            !emailController.text.contains('@') ||
            !emailController.text.contains('.com'))
          Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Text(
              'Masukkan email yang valid',
              style: GoogleFonts.poppins(
                color: kRedColor,
              ),
            ),
          ),
      ],
    );
  }

  Widget telepon() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Nomor Telepon Aktif',
          style: GoogleFonts.poppins(
            color: c1,
            fontSize: 12,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 6),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: c5,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              Icon(
                Iconsax.call,
                color: c1,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: TextFormField(
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration.collapsed(
                    hintText: '081234567890',
                    hintStyle: GoogleFonts.poppins(
                      color: c3,
                      fontSize: 16,
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {});
                  },
                ),
              ),
            ],
          ),
        ),
        if (phoneController.text.isEmpty ||
            (!phoneController.text.startsWith('08') &&
                !phoneController.text.startsWith('+628')))
          Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Text(
              'Masukkan nomor telepon yang valid',
              style: GoogleFonts.poppins(
                color: kRedColor,
              ),
            ),
          ),
      ],
    );
  }

  Widget peringatan() {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Iconsax.info_circle5,
            color: kRedColor,
          ),
          const SizedBox(width: 6),
          Expanded(
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '1.',
                      style: GoogleFonts.poppins(),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Pastikan data yang anda isi sudah benar. Seperti nominal, nama lengkap, email serta nomor telepon. Untuk keperluan konfirmasi donasi.',
                        maxLines: 4,
                        textAlign: TextAlign.justify,
                        overflow: TextOverflow.clip,
                        style: GoogleFonts.poppins(
                          color: c1,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '2.',
                      style: GoogleFonts.poppins(),
                    ),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        'Untuk pembayaran zakat, pastikan bahwa donatur/muzaki telah menghitungnya dengan benar sesuai dengan ketentuan syariah yang berlaku. Jika ragu, silahkan konsultasikan ke nomor layanan muzaki kami.',
                        maxLines: 5,
                        textAlign: TextAlign.justify,
                        overflow: TextOverflow.clip,
                        style: GoogleFonts.poppins(
                          color: c1,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
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
                myAlert();
              },
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 2,
                    style: BorderStyle.solid,
                    color: c2,
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

        // TOMBOL KONFIRMASI
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(left: 8),
            height: 60,
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
                    Navigator.of(context).push(konfirmasiDonasi());
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
                      backgroundColor: c5,
                    )
                  : Text(
                      'Konfirmasi',
                      style: GoogleFonts.poppins(
                        color: c1,
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
