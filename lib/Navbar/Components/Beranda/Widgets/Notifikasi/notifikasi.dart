import 'package:dermain/Navbar/Components/Beranda/Widgets/Notifikasi/notifikasi_items.dart';
import 'package:dermain/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class Notifikasi extends StatefulWidget {
  const Notifikasi({super.key});

  @override
  State<Notifikasi> createState() => _NotifikasiState();
}

class _NotifikasiState extends State<Notifikasi> {
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
            color: cBlack,
          ),
        ),
        centerTitle: true,
        title: Text(
          'Notifikasi',
          style: GoogleFonts.poppins(
            color: cBlack,
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
        padding: const EdgeInsets.symmetric(vertical: 12),
        children: [
          berita1(),
          berita2(),
          berita3(),
        ],
      ),
    );
  }

  Widget berita1() {
    return TextButton(
      style: const ButtonStyle(
          padding: WidgetStatePropertyAll(EdgeInsets.symmetric(vertical: 8))),
      onPressed: () {},
      child: SizedBox(
        width: 350,
        height: 50,
        child: NotifikasiItems(
          ikon: Iconsax.notification_bing5,
          title: 'Notifikasi 1',
          date: DateTime(2023, 4, 1),
        ),
      ),
    );
  }

  Widget berita2() {
    return TextButton(
      style: const ButtonStyle(
          padding: WidgetStatePropertyAll(EdgeInsets.symmetric(vertical: 8))),
      onPressed: () {},
      child: SizedBox(
        width: 350,
        height: 50,
        child: NotifikasiItems(
          ikon: Iconsax.notification_bing5,
          title: 'Notifikasi 2',
          date: DateTime(2023, 4, 1),
        ),
      ),
    );
  }

  Widget berita3() {
    return TextButton(
      style: const ButtonStyle(
          padding: WidgetStatePropertyAll(EdgeInsets.symmetric(vertical: 8))),
      onPressed: () {},
      child: SizedBox(
        width: 350,
        height: 50,
        child: NotifikasiItems(
          ikon: Iconsax.notification_bing5,
          title: 'Notifikasi 3',
          date: DateTime(2023, 4, 1),
        ),
      ),
    );
  }
}
