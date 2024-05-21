import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../route_animation.dart';
import '../../../../../theme.dart';
import 'berita_items.dart';

class Berita extends StatefulWidget {
  const Berita({super.key});

  @override
  State<Berita> createState() => _BeritaState();
}

class _BeritaState extends State<Berita> {
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
          'Berita',
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
          berita4(),
          berita5(),
          berita6(),
          berita7(),
          berita8(),
          berita9(),
        ],
      ),
    );
  }

  Widget berita1() {
    return TextButton(
      style: const ButtonStyle(
          padding: WidgetStatePropertyAll(EdgeInsets.symmetric(vertical: 8))),
      onPressed: () {
        Navigator.of(context).push(bacaBerita());
      },
      child: SizedBox(
        width: 350,
        height: 100,
        child: BeritaItems(
          imageUrl: 'assets/images/image_berita1.jpg',
          tipeberita: 'Sosial',
          title: 'Lazismu Banguntapan Selatan Bagi-Bagi Takjil Gratis',
          subtitle: 'Lazismu',
          date: DateTime(2023, 4, 1),
        ),
      ),
    );
  }

  Widget berita2() {
    return TextButton(
      style: const ButtonStyle(
          padding: WidgetStatePropertyAll(EdgeInsets.symmetric(vertical: 8))),
      onPressed: () {
        Navigator.of(context).push(bacaBerita());
      },
      child: SizedBox(
        width: 350,
        height: 100,
        child: BeritaItems(
          imageUrl: 'assets/images/image_berita2.jpg',
          tipeberita: 'Sosial',
          title: 'Lazismu Banguntapan Selatan Bagi-Bagi Takjil Gratis',
          subtitle: 'Lazismu',
          date: DateTime(2023, 4, 1),
        ),
      ),
    );
  }

  Widget berita3() {
    return TextButton(
      style: const ButtonStyle(
          padding: WidgetStatePropertyAll(EdgeInsets.symmetric(vertical: 8))),
      onPressed: () {
        Navigator.of(context).push(bacaBerita());
      },
      child: SizedBox(
        width: 350,
        height: 100,
        child: BeritaItems(
          imageUrl: 'assets/images/image_berita3.jpg',
          tipeberita: 'Sosial',
          title: 'Lazismu Banguntapan Selatan Bagi-Bagi Takjil Gratis',
          subtitle: 'Lazismu',
          date: DateTime(2023, 4, 1),
        ),
      ),
    );
  }

  Widget berita4() {
    return TextButton(
      style: const ButtonStyle(
          padding: WidgetStatePropertyAll(EdgeInsets.symmetric(vertical: 8))),
      onPressed: () {
        Navigator.of(context).push(bacaBerita());
      },
      child: SizedBox(
        width: 350,
        height: 100,
        child: BeritaItems(
          imageUrl: 'assets/images/image_berita1.jpg',
          tipeberita: 'Sosial',
          title: 'Lazismu Banguntapan Selatan Bagi-Bagi Takjil Gratis',
          subtitle: 'Lazismu',
          date: DateTime(2023, 4, 1),
        ),
      ),
    );
  }

  Widget berita5() {
    return TextButton(
      style: const ButtonStyle(
          padding: WidgetStatePropertyAll(EdgeInsets.symmetric(vertical: 8))),
      onPressed: () {
        Navigator.of(context).push(bacaBerita());
      },
      child: SizedBox(
        width: 350,
        height: 100,
        child: BeritaItems(
          imageUrl: 'assets/images/image_berita2.jpg',
          tipeberita: 'Sosial',
          title: 'Lazismu Banguntapan Selatan Bagi-Bagi Takjil Gratis',
          subtitle: 'Lazismu',
          date: DateTime(2023, 4, 1),
        ),
      ),
    );
  }

  Widget berita6() {
    return TextButton(
      style: const ButtonStyle(
          padding: WidgetStatePropertyAll(EdgeInsets.symmetric(vertical: 8))),
      onPressed: () {
        Navigator.of(context).push(bacaBerita());
      },
      child: SizedBox(
        width: 350,
        height: 100,
        child: BeritaItems(
          imageUrl: 'assets/images/image_berita3.jpg',
          tipeberita: 'Sosial',
          title: 'Lazismu Banguntapan Selatan Bagi-Bagi Takjil Gratis',
          subtitle: 'Lazismu',
          date: DateTime(2023, 4, 1),
        ),
      ),
    );
  }

  Widget berita7() {
    return TextButton(
      style: const ButtonStyle(
          padding: WidgetStatePropertyAll(EdgeInsets.symmetric(vertical: 8))),
      onPressed: () {
        Navigator.of(context).push(bacaBerita());
      },
      child: SizedBox(
        width: 350,
        height: 100,
        child: BeritaItems(
          imageUrl: 'assets/images/image_berita1.jpg',
          tipeberita: 'Sosial',
          title: 'Lazismu Banguntapan Selatan Bagi-Bagi Takjil Gratis',
          subtitle: 'Lazismu',
          date: DateTime(2023, 4, 1),
        ),
      ),
    );
  }

  Widget berita8() {
    return TextButton(
      style: const ButtonStyle(
          padding: WidgetStatePropertyAll(EdgeInsets.symmetric(vertical: 8))),
      onPressed: () {
        Navigator.of(context).push(bacaBerita());
      },
      child: SizedBox(
        width: 350,
        height: 100,
        child: BeritaItems(
          imageUrl: 'assets/images/image_berita2.jpg',
          tipeberita: 'Sosial',
          title: 'Lazismu Banguntapan Selatan Bagi-Bagi Takjil Gratis',
          subtitle: 'Lazismu',
          date: DateTime(2023, 4, 1),
        ),
      ),
    );
  }

  Widget berita9() {
    return TextButton(
      style: const ButtonStyle(
          padding: WidgetStatePropertyAll(EdgeInsets.symmetric(vertical: 8))),
      onPressed: () {
        Navigator.of(context).push(bacaBerita());
      },
      child: SizedBox(
        width: 350,
        height: 100,
        child: BeritaItems(
          imageUrl: 'assets/images/image_berita3.jpg',
          tipeberita: 'Sosial',
          title: 'Lazismu Banguntapan Selatan Bagi-Bagi Takjil Gratis',
          subtitle: 'Lazismu',
          date: DateTime(2023, 4, 1),
        ),
      ),
    );
  }
}
