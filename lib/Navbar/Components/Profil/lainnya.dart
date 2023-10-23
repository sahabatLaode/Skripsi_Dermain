import 'package:dermain/Methods/auth_method.dart';
import 'package:dermain/Navbar/Components/Profil/lainnya_items.dart';
import 'package:dermain/Reusable%20Components/tombol_primer.dart';
import 'package:dermain/route_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dermain/theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
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
        elevation: 0,
        backgroundColor: cWhite,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: cWhite,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            akun(),
            const SizedBox(height: 32),
            preferensi(),
            const Spacer(),
            logout(),
          ],
        ),
      ),
    );
  }

  Widget akun() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'John Doe',
          style: GoogleFonts.poppins(
            color: c1,
            fontSize: 32,
            fontWeight: bold,
          ),
        ),
        Text(
          'lazismu@gmail.com',
          style: GoogleFonts.poppins(
            color: c1,
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 40,
          width: 180,
          child: TextButton(
            onPressed: () {
              Navigator.of(context).push(lengkapiProfil());
            },
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(99),
              ),
              side: BorderSide(
                color: c1,
                width: 2,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Iconsax.edit_25,
                  color: c1,
                  size: 20,
                ),
                Text(
                  'Ubah profil',
                  style: GoogleFonts.poppins(
                    color: c1,
                    fontWeight: bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget preferensi() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Ganti Kata Sandi
        LainnyaItems(
            ikon1: Iconsax.key,
            title: 'Ganti kata sandi',
            ikon2: Iconsax.arrow_right_3,
            diTekan: () {}),

        // // SYARAT DAN KETENTUAN
        // LainnyaItems(
        //   ikon1: Iconsax.document_text,
        //   title: 'Syarat dan Ketentuan',
        //   ikon2: Iconsax.arrow_right_3,
        //   diTekan: () {},
        // ),

        // // BANTUAN
        // LainnyaItems(
        //   ikon1: Iconsax.message_question,
        //   title: 'Bantuan',
        //   ikon2: Iconsax.arrow_right_3,
        //   diTekan: () {},
        // ),

        // // ULASAN
        // LainnyaItems(
        //   ikon1: Iconsax.ranking_14,
        //   title: 'Ulasan',
        //   ikon2: Iconsax.arrow_right_3,
        //   diTekan: () {},
        // ),
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
