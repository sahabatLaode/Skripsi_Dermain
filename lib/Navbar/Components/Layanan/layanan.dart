import 'package:dermain/Navbar/Components/Layanan/layanan_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dermain/route_animation.dart';
import 'package:dermain/theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class Layanan extends StatefulWidget {
  const Layanan({super.key});

  @override
  State<Layanan> createState() => _LayananState();
}

class _LayananState extends State<Layanan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cWhite,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        backgroundColor: cWhite,
        title: Text(
          'Layanan',
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
        padding: const EdgeInsets.all(20),
        children: [
          gambar(),
          const SizedBox(height: 24),
          ambulan(),
          const SizedBox(height: 12),
          koinSurga(),
          const SizedBox(height: 12),
          // donorDarah(),
          // const SizedBox(height: 12),
          zakat(),
          const SizedBox(height: 12),
          infaq(),
          const SizedBox(height: 12),
          sedekah(),
        ],
      ),
    );
  }

  Widget gambar() {
    return Container(
      height: 200,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/images/image_layanan.png',
          ),
        ),
      ),
    );
  }

  Widget ambulan() {
    return LayananItems(
      ikon1: Iconsax.truck_fast,
      title: 'Ambulans',
      subtitle: 'Permintaan Ambulans',
      ikon2: Iconsax.arrow_right_3,
      diTekan: () {
        Navigator.of(context).push(permintaanAmbulan());
      },
    );
  }

  Widget koinSurga() {
    return LayananItems(
      ikon1: Iconsax.coin,
      title: 'Koin Surga',
      subtitle: 'Permintaan Koin Surga',
      ikon2: Iconsax.arrow_right_3,
      diTekan: () {
        Navigator.of(context).push(permintaanKoin());
      },
    );
  }

  Widget donorDarah() {
    return LayananItems(
      ikon1: Iconsax.hospital,
      title: 'Donor Darah',
      subtitle: 'Permintaan Donor Darah',
      ikon2: Iconsax.arrow_right_3,
      diTekan: () {
        Navigator.of(context).push(permintaanAmbulan());
      },
    );
  }

  Widget zakat() {
    return LayananItems(
      ikon1: Iconsax.moneys,
      title: 'Zakat',
      subtitle: 'Donasi Zakat',
      ikon2: Iconsax.arrow_right_3,
      diTekan: () {
        Navigator.of(context).push(donasiZakat());
      },
    );
  }

  Widget infaq() {
    return LayananItems(
      ikon1: Iconsax.gift,
      title: 'Infaq',
      subtitle: 'Donasi Infaq',
      ikon2: Iconsax.arrow_right_3,
      diTekan: () {
        Navigator.of(context).push(donasiInfaq());
      },
    );
  }

  Widget sedekah() {
    return LayananItems(
      ikon1: Iconsax.gift,
      title: 'Sedekah',
      subtitle: 'Donasi Sedekah',
      ikon2: Iconsax.arrow_right_3,
      diTekan: () {
        Navigator.of(context).push(donasiSedekah());
      },
    );
  }
}
