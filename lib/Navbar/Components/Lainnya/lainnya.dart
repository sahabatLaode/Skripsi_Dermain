import 'package:dermain/Methods/auth_method.dart';
import 'package:dermain/Navbar/Components/Lainnya/lainnya_items.dart';
import 'package:dermain/Reusable%20Components/tombol_primer.dart';
import 'package:dermain/route_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dermain/theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import '../Layanan/layanan_items.dart';
import 'package:dermain/globals.dart' as globals;

class Lainnya extends StatefulWidget {
  const Lainnya({super.key});

  @override
  State<Lainnya> createState() => _LainnyaState();
}

class _LainnyaState extends State<Lainnya> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cWhite,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        backgroundColor: cWhite,
        title: Text(
          'Lainnya',
          style: GoogleFonts.poppins(
            color: c1,
            fontSize: 28,
            fontWeight: semibold,
          ),
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: cWhite,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          akun(),
          const SizedBox(height: 32),
          preferensi(),
          const SizedBox(height: 32),
          logout(),
        ],
      ),
    );
  }

  Widget akun() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Akun',
          style: GoogleFonts.poppins(
            color: c1,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 12),
        LayananItems(
          ikon1: Iconsax.user_edit,
          title: 'John Doe',
          subtitle: 'lazismu@gmail.com',
          ikon2: Iconsax.arrow_right_3,
          diTekan: () {
            Navigator.of(context).push(lengkapiProfil());
          },
        ),
      ],
    );
  }

  Widget preferensi() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Preferensi',
          style: GoogleFonts.poppins(
            color: c1,
            fontSize: 16,
          ),
        ),

        // SYARAT DAN KETENTUAN
        LainnyaItems(
          ikon1: Iconsax.document_text,
          title: 'Syarat dan Ketentuan',
          ikon2: Iconsax.arrow_right_3,
          diTekan: () {},
        ),

        // BANTUAN
        LainnyaItems(
          ikon1: Iconsax.message_question,
          title: 'Bantuan',
          ikon2: Iconsax.arrow_right_3,
          diTekan: () {},
        ),

        // ULASAN
        LainnyaItems(
          ikon1: Iconsax.ranking_14,
          title: 'Ulasan',
          ikon2: Iconsax.arrow_right_3,
          diTekan: () {},
        ),
      ],
    );
  }

  Widget logout() {
    return TombolPrimer(
        title: 'Keluar',
        ditekan: () async {
          bool status = await AuthMethod.logout();

          if (status) {
            setState(() {
            globals.isLogin = false;
            globals.token = '';
            });
          }

          if (!mounted) return;
          Navigator.of(context).push(signIn());
        });
  }
}
