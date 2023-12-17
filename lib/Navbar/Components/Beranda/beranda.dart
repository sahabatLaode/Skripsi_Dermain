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
        toolbarHeight: 64,
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: c2,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Assalamualaikum,',
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

        // actions: [
        //   SizedBox(
        //     width: 40,
        //     child: TextButton(
        //       onPressed: () {
        //         Navigator.of(context).push(notifikasi());
        //       },
        //       style: TextButton.styleFrom(
        //         backgroundColor: c2,
        //         shape: const CircleBorder(),
        //       ),
        //       child: Icon(
        //         Iconsax.notification_bing5,
        //         color: c1,
        //       ),
        //     ),
        //   ),
        //   const SizedBox(
        //     width: 16,
        //   ),
        // ],
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: c2,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      body: Stack(
        children: <Widget>[
          totalDonasi(),
          // const SizedBox(height: 300),
          ListView(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 164),
                decoration: BoxDecoration(
                  color: cWhite,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 12),
                      width: 60,
                      height: 6,
                      decoration: BoxDecoration(
                        color: c4,
                        borderRadius: BorderRadius.circular(99),
                      ),
                    ),
                    // menuCepat(),
                    informasi(),
                    donasi(),
                    // berita(),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget totalDonasi() {
    return Container(
      // padding: const EdgeInsets.all(20),
      width: double.infinity,
      height: 160,
      decoration: BoxDecoration(
        color: c2,
      ),
      child: Column(
        children: [
          Text(
            'Total Donasi Terkumpul',
            style: GoogleFonts.poppins(
              color: c1,
            ),
          ),
          const SizedBox(height: 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Rp',
                style: GoogleFonts.poppins(
                  color: c1,
                  fontSize: 36,
                  fontWeight: semibold,
                ),
              ),
              Text(
                '0.00',
                style: GoogleFonts.poppins(
                  color: c1,
                  fontSize: 36,
                  fontWeight: semibold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 120,
                child: Column(
                  children: [
                    Text(
                      'Program Donasi',
                      style: GoogleFonts.poppins(
                        color: c1,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      '3',
                      style: GoogleFonts.poppins(
                        color: c1,
                        fontSize: 22,
                        fontWeight: semibold,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 2,
                height: 30,
                color: c1,
              ),
              SizedBox(
                width: 120,
                child: Column(
                  children: [
                    Text(
                      'Program Layanan',
                      style: GoogleFonts.poppins(
                        color: c1,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      '2',
                      style: GoogleFonts.poppins(
                        color: c1,
                        fontSize: 22,
                        fontWeight: semibold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget menuCepat() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
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
                  // Navigator.pushNamed(context, '/konfirmasi');
                  Navigator.pushNamed(context, '/donasiInfaq');
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
      ),
    );
  }

  Widget informasi() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
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
      ),
    );
  }

  Widget donasi() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(12),
                      height: 150,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: c2,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'ZAKAT',
                                style: GoogleFonts.poppins(
                                  color: c1,
                                  fontSize: 20,
                                  fontWeight: semibold,
                                ),
                              ),
                              Text(
                                'Donasi Zakat',
                                style: GoogleFonts.poppins(
                                  color: c1,
                                ),
                              ),
                            ],
                          ),
                          Icon(
                            Iconsax.moneys5,
                            size: 48,
                            color: c1,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 16),
                      height: 240,
                      decoration: BoxDecoration(
                        color: c2,
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      height: 240,
                      decoration: BoxDecoration(
                        color: c2,
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 16),
                      height: 150,
                      decoration: BoxDecoration(
                        color: c2,
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 16),
            height: 120,
            // width: 170,
            decoration: BoxDecoration(
              color: c2,
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ],
      ),
    );
  }

  Widget berita() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
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
      ),
    );
  }
}
