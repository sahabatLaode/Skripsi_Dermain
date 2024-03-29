import 'package:dermain/route_animation.dart';
import 'package:flutter/material.dart';
import 'package:dermain/theme.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class KeteranganDonasi extends StatefulWidget {
  const KeteranganDonasi({super.key});

  @override
  State<KeteranganDonasi> createState() => _KeteranganDonasiState();
}

class _KeteranganDonasiState extends State<KeteranganDonasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cWhite,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: cWhite,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: cWhite,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            data(),
            const Spacer(),
            tombol(),
          ],
        ),
      ),
    );
  }

  Widget data() {
    return Column(
      children: [
        Lottie.asset('assets/lottie/check.json'),
        Text(
          'Donasi ditambahkan!',
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            color: cBlack,
            fontWeight: bold,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 32),
        Text(
          'Donasi sedang di proses, mohon konfirmasi transfer pada halaman aktivitas',
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            color: cBlack,
          ),
        ),
      ],
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
                Navigator.of(context).push(navbar());
              },
              style: TextButton.styleFrom(
                backgroundColor: c2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Text(
                'Beranda',
                style: GoogleFonts.poppins(
                  color: cBlack,
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
