import 'dart:io';
import 'dart:async';
import 'package:dermain/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';

class KonfirmasiZakat extends StatefulWidget {
  const KonfirmasiZakat({super.key});

  @override
  State<KonfirmasiZakat> createState() => _KonfirmasiZakatState();
}

class _KonfirmasiZakatState extends State<KonfirmasiZakat> {
  bool isLoading = false;
  XFile? image;
  final ImagePicker picker = ImagePicker();

  Future getImage(ImageSource source) async {
    var img = await picker.pickImage(source: source);

    setState(() {
      image = img;
    });
  }

  void myAlert() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          title: const Text('Silakan pilih media'),
          content: SizedBox(
            height: MediaQuery.of(context).size.height / 6,
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    getImage(ImageSource.gallery);
                  },
                  child: const Row(
                    children: [
                      Icon(Icons.image),
                      Text('Dari Galeri'),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    getImage(ImageSource.camera);
                  },
                  child: const Row(
                    children: [
                      Icon(Icons.camera),
                      Text('Dari Kamera'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: c2,
        centerTitle: true,
        title: Text(
          'Konfirmasi Pembayaran',
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
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          totalPembayaranDonasi(),
          const SizedBox(height: 16),
          keteranganDonasi(),
          const SizedBox(height: 16),

          // Bukti pembayaran
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 40,
                  width: 250,
                  child: TextButton(
                    onPressed: () {
                      myAlert();
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: c2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          Iconsax.document_upload5,
                          color: c1,
                        ),
                        Text(
                          'Unggah bukti pembayaran',
                          style: GoogleFonts.poppins(
                            color: c1,
                            fontWeight: semibold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  alignment: Alignment.center,
                  height: 350,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: cWhite,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 1,
                          spreadRadius: 2,
                        ),
                      ]),
                  child: image != null
                      ? Image.file(
                          File(image!.path),
                          height: MediaQuery.of(context).size.height / 2.5,
                        )
                      : Text(
                          'Tidak ada gambar yang dipilih.',
                          style: GoogleFonts.poppins(color: c1),
                        ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),

          // Tombol
          tombol(),
        ],
      ),
    );
  }
}

Widget totalPembayaranDonasi() {
  return Column(
    children: [
      Text(
        '25.000',
        style: GoogleFonts.poppins(
          fontSize: 48,
          fontWeight: bold,
        ),
      ),
      SizedBox(
        height: 40,
        width: 150,
        child: TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            backgroundColor: c2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(
                Iconsax.copy5,
                color: c1,
                size: 20,
              ),
              Text(
                'Salin nominal',
                style: GoogleFonts.poppins(
                  color: c1,
                  fontWeight: semibold,
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}

Widget keteranganDonasi() {
  return Container(
    padding: const EdgeInsets.all(16),
    height: 152,
    width: double.infinity,
    decoration: BoxDecoration(
      color: cWhite,
      borderRadius: BorderRadius.circular(12),
      boxShadow: const [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 1,
          spreadRadius: 2,
        ),
      ],
    ),
    child: Column(
      children: [
        // Donatur
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Donatur',
              style: GoogleFonts.poppins(
                color: c1,
                fontSize: 10,
              ),
            ),
            Text(
              'Hamba Allah',
              style: GoogleFonts.poppins(
                color: c1,
                fontSize: 12,
                fontWeight: semibold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),

        // Metode pembayaran
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Metode Pembayaran',
              style: GoogleFonts.poppins(
                color: c1,
                fontSize: 10,
              ),
            ),
            Text(
              'BSI',
              style: GoogleFonts.poppins(
                color: c1,
                fontSize: 12,
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
              'Email',
              style: GoogleFonts.poppins(
                color: c1,
                fontSize: 10,
              ),
            ),
            Text(
              'lazismu@gmail.com',
              style: GoogleFonts.poppins(
                color: c1,
                fontSize: 12,
                fontWeight: semibold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),

        // Nomor HP
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Nomor HP',
              style: GoogleFonts.poppins(
                color: c1,
                fontSize: 10,
              ),
            ),
            Text(
              '081234567890',
              style: GoogleFonts.poppins(
                color: c1,
                fontSize: 12,
                fontWeight: semibold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
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
            onPressed: () {},
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
            onPressed: () {},
            style: TextButton.styleFrom(
              backgroundColor: c2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: Text(
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
