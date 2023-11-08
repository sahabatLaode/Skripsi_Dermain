import 'package:dermain/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class KonformasiZakat extends StatefulWidget {
  const KonformasiZakat({super.key});

  @override
  State<KonformasiZakat> createState() => _KonformasiZakatState();
}

class _KonformasiZakatState extends State<KonformasiZakat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: cWhite,
        // leading: IconButton(
        //   onPressed: () {
        //     Navigator.of(context).pop();
        //   },
        //   icon: Icon(
        //     Iconsax.arrow_left,
        //     color: c1,
        //   ),
        // ),
        centerTitle: true,
        title: Text(
          'Konfirmasi Zakat',
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
    );
  }
}
