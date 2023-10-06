import 'package:flutter/material.dart';
import 'package:dermain/theme.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:image_picker/image_picker.dart';

class KonfirmasiDonasi extends StatefulWidget {
  const KonfirmasiDonasi({super.key});

  @override
  State<KonfirmasiDonasi> createState() => _KonfirmasiDonasiState();
}

class _KonfirmasiDonasiState extends State<KonfirmasiDonasi> {
  final rekeningNumber = '00011122233344';
  final nominalTransfer = '500000';

  // late File _image;

  // Future<void> _uploadImage() async {
  //   final imagePicker = ImagePicker();
  //   final pickedImage = await imagePicker.getImage(source: ImageSource.gallery);

  //   if (pickedImage != null) {
  //     setState(() {
  //       _image = File(pickedImage.path);
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cWhite,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: cWhite,
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
          'Konfirmasi',
          style: GoogleFonts.poppins(
            color: c1,
            fontSize: 18,
            fontWeight: semibold,
          ),
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: cWhite,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          data(),
          const SizedBox(height: 32),
          nomorRekening(),
        ],
      ),
    );
  }

  Widget data() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 8),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          width: double.infinity,
          height: 313,
          decoration: BoxDecoration(
            color: c5,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              // Nama Lengkap
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Nama Lengkap:',
                    style: GoogleFonts.poppins(
                      color: c1,
                    ),
                  ),
                  Text(
                    'Hamba Allah',
                    style: GoogleFonts.poppins(
                      color: c1,
                      fontWeight: semibold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // Email
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Email:',
                    style: GoogleFonts.poppins(
                      color: c1,
                    ),
                  ),
                  Text(
                    'lazismu@gmail.com',
                    style: GoogleFonts.poppins(
                      color: c1,
                      fontWeight: semibold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // Nomor Telepon
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Nomor Telepon:',
                    style: GoogleFonts.poppins(
                      color: c1,
                    ),
                  ),
                  Text(
                    '081234567890',
                    style: GoogleFonts.poppins(
                      color: c1,
                      fontWeight: semibold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // Metode Pembayaran
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Metode Pembayaran:',
                    style: GoogleFonts.poppins(
                      color: c1,
                    ),
                  ),
                  Image.asset(
                    'assets/logos/logo_bsi.png',
                    width: 24,
                  ),
                ],
              ),

              // Garis
              Container(
                margin: const EdgeInsets.symmetric(vertical: 16),
                width: double.infinity,
                height: 2,
                decoration: BoxDecoration(
                  color: c1,
                  borderRadius: BorderRadius.circular(99),
                ),
              ),

              // Nominal
              Text(
                'Nominal yang harus ditransferkan:',
                style: GoogleFonts.poppins(
                  color: c1,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Rp',
                    style: GoogleFonts.poppins(
                      color: c1,
                      fontSize: 20,
                      fontWeight: bold,
                    ),
                  ),
                  Text(
                    '5.000.000',
                    style: GoogleFonts.poppins(
                      color: c1,
                      fontSize: 20,
                      fontWeight: bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              TextButton(
                style: const ButtonStyle(padding: null),
                onPressed: () {
                  Clipboard.setData(
                    ClipboardData(text: nominalTransfer),
                  );
                },
                child: Text(
                  'Salin nominal transfer',
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
        Text(
          'Pastikan nominal yang ditransfer sama dengan nominal yang dimasukkan!',
          style: GoogleFonts.poppins(
            color: kRedColor,
            fontSize: 12,
          ),
        ),
      ],
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
}
