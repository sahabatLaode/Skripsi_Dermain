import 'package:dermain/Methods/zakat_method.dart';
import 'package:dermain/Providers/zakat_provider.dart';
// import 'package:dermain/route_animation.dart';
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
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  TextEditingController copyController = TextEditingController();
  final rekeningNumber = '00011122233344';

  bool isShowNamedError = false;
  bool isLoading = false;
  bool isChecked = false;

  String dropdownValue = 'BSI';

  @override
  void dispose() {
    copyController.dispose();
    nameController.dispose();
    super.dispose();
  }

  void _addZakat() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();
    bool status = await ZakatMethod.addZakat(
      nominalController.text,
      nameController.text,
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
          const SnackBar(content: Text('Todo successfully added')));
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
          'Donasi Zakat',
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
            nominal(),
            const SizedBox(height: 12),
            // metode(),
            // const SizedBox(height: 12),
            nama(),
            const SizedBox(height: 12),
            email(),
            const SizedBox(height: 12),
            telepon(),
            const SizedBox(height: 12),
            // peringatan(),
            // const SizedBox(height: 12),
            // nomorRekening(),
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
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget metode() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Metode Pembayaran',
          style: GoogleFonts.poppins(
            color: c1,
            fontSize: 12,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 6),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          height: 60,
          decoration: BoxDecoration(
            color: c5,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              Icon(
                Iconsax.wallet,
                color: c1,
              ),
              const SizedBox(width: 14),
              Expanded(
                child: DropdownButton<String>(
                  dropdownColor: c5,
                  value: dropdownValue,
                  isExpanded: true,
                  isDense: true,
                  icon: Icon(Iconsax.arrow_down_1, color: c1),
                  elevation: 16,
                  style: GoogleFonts.poppins(
                    color: c1,
                    fontSize: 16,
                  ),
                  onChanged: (String? newValue) {
                    // This is called when the user selects an item.
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                  items: <String>['BSI', 'BRI', 'BNI', 'BCA']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/logos/logo_${value.toLowerCase()}.png',
                            width: 24,
                            height: 24,
                          ),
                          const SizedBox(width: 8),
                          Text(value),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
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
                  controller: nameController,
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
                ),
              ),
            ],
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
                nameController.text = "Hamba Allah";
              } else {
                nameController.text = "";
              }
            });
          }),
        ),
        if (isShowNamedError)
          Container(
            margin: const EdgeInsets.only(
              top: 6,
            ),
            child: Text(
              'Nama tidak boleh kosong',
              style: GoogleFonts.poppins(
                color: kRedColor,
                fontSize: 12,
              ),
            ),
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
                    hintText: 'lazismu@mail.com',
                    hintStyle: GoogleFonts.poppins(
                      color: c3,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
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
                      )),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget peringatan() {
    return Container(
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      height: 228,
      decoration: BoxDecoration(
        color: c5,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Iconsax.info_circle5,
            color: c1,
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 12,
              left: 10,
              right: 10,
              bottom: 14,
            ),
            child: Column(
              children: [
                Text(
                  '1. Pastikan data yang anda isi sudah benar. Seperti nominal, nama lengkap, email serta no. handphone. Untuk keperluan konfirmasi donasi.',
                  maxLines: 4,
                  // overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                    color: kRedColor,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  '2. Untuk pembayaran zakat, pastikan bahwa donatur/muzaki telah menghitungnya dengan benar sesuai dengan ketentuan syariah yang berlaku. Jika ragu, silahkan konsultasikan ke nomor layanan muzaki kami.',
                  maxLines: 5,
                  // overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                    color: kRedColor,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget nomorRekening() {
    return Container(
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: c5,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                rekeningNumber,
                style: GoogleFonts.poppins(
                  color: c1,
                  fontWeight: bold,
                ),
              ),
              Text(
                'Bank Bantul',
                style: GoogleFonts.poppins(
                  color: c1,
                  fontWeight: bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            'LazisMu Banguntapan Selatan',
            style: GoogleFonts.poppins(
              color: c3,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '20 Desember 2022',
                style: GoogleFonts.poppins(
                  color: c3,
                  fontSize: 12,
                ),
              ),
              InkWell(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: c2,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Iconsax.copy,
                    color: c1,
                  ),
                ),
                onTap: () {
                  Clipboard.setData(
                    ClipboardData(text: rekeningNumber),
                  );
                },
              ),
            ],
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
            height: 56,
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
            height: 56,
            child: TextButton(
              onPressed: () {
                _addZakat();
                // setState(() {
                //   isLoading = true;
                // });

                // Future.delayed(const Duration(seconds: 2), () {
                //   setState(() {
                //     isLoading = false;
                //   });
                //   if (nameController.text.isEmpty) {
                //     setState(() {
                //       isShowNamedError = true;
                //     });
                //   } else {
                //     Navigator.of(context).push(konfirmasiZakat());
                //   }
                // });
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
