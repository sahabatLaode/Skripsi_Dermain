import 'package:dermain/Methods/auth_method.dart';
import 'package:dermain/Navbar/Components/Beranda/Widgets/berita_beranda_items.dart';
import 'package:dermain/Navbar/Components/Beranda/Widgets/informasi_items.dart';
import 'package:dermain/Navbar/Components/Beranda/Widgets/menu_cepat_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dermain/route_animation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:dermain/theme.dart';

class Beranda extends StatefulWidget {
  const Beranda({super.key});

  @override
  State<Beranda> createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  String userName = "";

  @override
  void initState() {
    loadUserData(); // Panggil fungsi untuk mengambil data pengguna yang sudah login
    super.initState();
  }

  void loadUserData() async {
    try {
      final user = await AuthMethod.getUserData();
      print('User: $user');
      if (user != null) {
        setState(() {
          userName = user.name;
        });
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cWhite,
      appBar: AppBar(
        // toolbarHeight: 10,
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: cWhite,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Halo,',
              style: GoogleFonts.poppins(
                color: c1,
                fontSize: 14,
              ),
            ),
            Text(
              userName,
              style: GoogleFonts.poppins(
                color: c1,
                fontSize: 16,
                fontWeight: bold,
              ),
            ),
          ],
        ),

        actions: [
          SizedBox(
            width: 40,
            child: TextButton(
              onPressed: () {
                Navigator.of(context).push(notifikasi());
              },
              style: TextButton.styleFrom(
                backgroundColor: cWhite,
                shape: const CircleBorder(),
              ),
              child: Icon(
                Iconsax.notification_bing5,
                color: c1,
              ),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
        ],
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: cWhite,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          totalDonasi(),
          menuCepat(),
          informasi(),
          berita(),
        ],
      ),
    );
  }

  Widget totalDonasi() {
    return Container(
      width: double.infinity,
      height: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 8),
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                  color: c2,
                  borderRadius: BorderRadius.circular(99),
                ),
                child: Icon(
                  Iconsax.wallet,
                  color: c1,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Rp 25 M',
                    style: GoogleFonts.poppins(
                      color: c1,
                      fontSize: 16,
                      fontWeight: bold,
                    ),
                  ),
                  Text(
                    'Donasi terkumpul',
                    style: GoogleFonts.poppins(
                      color: c3,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(width: 32),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 8),
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                  color: c2,
                  borderRadius: BorderRadius.circular(99),
                ),
                child: Icon(
                  Iconsax.wallet_1,
                  color: c1,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Rp 5 Juta',
                    style: GoogleFonts.poppins(
                      color: c1,
                      fontSize: 16,
                      fontWeight: bold,
                    ),
                  ),
                  Text(
                    'Donasi saya',
                    style: GoogleFonts.poppins(
                      color: c3,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget menuCepat() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // ZAKAT
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/nota');
                // Navigator.pushNamed(context, '/donasiZakat');
              },
              child: const MenuCepatItems(
                ikon: Iconsax.moneys,
                title: 'Zakat',
              ),
            ),

            // INFAQ
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/konfirmasi');
                // Navigator.pushNamed(context, '/donasiInfaq');
              },
              child: const MenuCepatItems(
                ikon: Iconsax.gift,
                title: 'Infaq',
              ),
            ),

            // AMBULAN
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/permintaanAmbulans');
              },
              child: const MenuCepatItems(
                ikon: Iconsax.truck_fast,
                title: 'Ambulans',
              ),
            ),

            // KOIN SURGA
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/permintaanKoin');
              },
              child: const MenuCepatItems(
                ikon: Iconsax.coin,
                title: 'Koin Surga',
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget informasi() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(
            top: 10,
            bottom: 16,
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              // Apa itu LAZISMU
              InformasiItems(
                imageurl: 'assets/logos/logo_lazismu.png',
                title: 'Apa itu\nLAZISMU?',
                diTekan: () {
                  Navigator.of(context).push(lazismu());
                },
              ),

              // Visi dan Misi
              InformasiItems(
                imageurl: 'assets/images/image_visi.png',
                title: 'Visi\ndan Misi',
                diTekan: () {
                  Navigator.of(context).push(visi());
                },
              ),

              // Struktur dan Manajemen
              InformasiItems(
                imageurl: 'assets/images/image_struktur.png',
                title: 'Struktur\ndan Manajemen',
                diTekan: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget berita() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(
            top: 24,
            bottom: 12,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Berita Lazismu',
                style: GoogleFonts.poppins(
                  color: c1,
                  fontSize: 18,
                  fontWeight: semibold,
                ),
              ),
              InkWell(
                child: Container(
                  width: 80,
                  height: 24,
                  decoration: BoxDecoration(
                    color: c2,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Center(
                    child: Text(
                      'Lihat semua',
                      style: GoogleFonts.poppins(
                        color: c1,
                        fontSize: 10,
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.of(context).push(beritaLazismu());
                },
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              // BERITA 1
              BeritaBerandaItems(
                imageUrl: 'assets/images/image_berita1.jpg',
                tipe: 'Sosial',
                title: 'Lazismu Banguntapan Selatan Bagi-Bagi Takjil Gratis',
                admin: 'Lazismu',
                date: DateTime(2023, 4, 1),
                diTekan: () {
                  Navigator.of(context).push(bacaBerita());
                },
              ),

              // BERITA 2
              BeritaBerandaItems(
                imageUrl: 'assets/images/image_berita1.jpg',
                tipe: 'Sosial',
                title: 'Lazismu Banguntapan Selatan Bagi-Bagi Takjil Gratis',
                admin: 'Lazismu',
                date: DateTime(2023, 4, 7),
                diTekan: () {},
              ),

              // BERITA 3
              BeritaBerandaItems(
                imageUrl: 'assets/images/image_berita1.jpg',
                tipe: 'Sosial',
                title: 'Lazismu Banguntapan Selatan Bagi-Bagi Takjil Gratis',
                admin: 'Lazismu',
                date: DateTime(2023, 4, 19),
                diTekan: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
