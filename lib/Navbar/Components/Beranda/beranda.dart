import 'package:dermain/Methods/auth_method.dart';
import 'package:dermain/Methods/zakat_method.dart';
import 'package:dermain/Navbar/Components/Beranda/Widgets/Informasi/lazismu.dart';
import 'package:dermain/Navbar/Components/Beranda/Widgets/Informasi/visi.dart';
import 'package:dermain/Navbar/Components/Beranda/Widgets/informasi_items.dart';
import 'package:dermain/Navbar/Components/Beranda/beranda_items_1.dart';
import 'package:dermain/Navbar/Components/Beranda/beranda_items_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dermain/route_animation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:dermain/theme.dart';
import 'package:intl/intl.dart';

class Beranda extends StatefulWidget {
  const Beranda({super.key});

  @override
  State<Beranda> createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  String userName = "";
  late Future<int> totalZakat;

  @override
  void initState() {
    super.initState();
    loadUserData();
    totalZakat = ZakatMethod.getTotalZakat();
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
        backgroundColor: cWhite,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/logos/logo_dermain.png',
              height: 20,
            ),
            Text(
              userName,
              style: GoogleFonts.poppins(
                color: cBlack,
                fontSize: 16,
                fontWeight: bold,
              ),
            ),
          ],
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: cWhite,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      body: Stack(
        children: <Widget>[
          // totalDonasi(),
          Column(
            children: [
              Text(
                'Total Donasi Tersalurkan',
                style: GoogleFonts.poppins(
                  color: cBlack,
                ),
              ),
              const SizedBox(height: 2),
              FutureBuilder<int>(
                future: totalZakat,
                builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator(
                      color: c2,
                    );
                  } else {
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      final formatter = NumberFormat.currency(
                          locale: 'id_ID', symbol: 'Rp', decimalDigits: 0);
                      return Text(
                        formatter.format(snapshot.data),
                        style: GoogleFonts.poppins(
                          color: cBlack,
                          fontSize: 24,
                          fontWeight: semibold,
                        ),
                      );
                    }
                  }
                },
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                padding: const EdgeInsets.symmetric(vertical: 8),
                height: 80,
                decoration: BoxDecoration(
                    color: cWhite,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 1,
                        spreadRadius: 2,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Iconsax.gift5,
                            color: c1,
                            size: 36,
                          ),
                          const SizedBox(width: 8),
                          Column(
                            children: [
                              Text(
                                'Donasi',
                                style: GoogleFonts.poppins(
                                  color: c5,
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                '3',
                                style: GoogleFonts.poppins(
                                  color: cBlack,
                                  fontSize: 22,
                                  fontWeight: semibold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 2,
                      height: 30,
                      color: c5,
                    ),
                    SizedBox(
                      width: 120,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Iconsax.map_15,
                            color: c2,
                            size: 36,
                          ),
                          const SizedBox(width: 8),
                          Column(
                            children: [
                              Text(
                                'Layanan',
                                style: GoogleFonts.poppins(
                                  color: c5,
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                '2',
                                style: GoogleFonts.poppins(
                                  color: cBlack,
                                  fontSize: 22,
                                  fontWeight: semibold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 2,
                      height: 30,
                      color: c5,
                    ),
                    SizedBox(
                      width: 120,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Iconsax.information5,
                            color: c3,
                            size: 36,
                          ),
                          const SizedBox(width: 8),
                          Column(
                            children: [
                              Text(
                                'Informasi',
                                style: GoogleFonts.poppins(
                                  color: c5,
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                '2',
                                style: GoogleFonts.poppins(
                                  color: cBlack,
                                  fontSize: 22,
                                  fontWeight: semibold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          // const SizedBox(height: 300),
          ListView(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 190),
                decoration: BoxDecoration(
                  color: cWhite,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 12),
                      width: 60,
                      height: 6,
                      decoration: BoxDecoration(
                        color: Colors.black26,
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
    return Column(
      children: [
        Text(
          'Total Donasi Tersalurkan',
          style: GoogleFonts.poppins(
            color: cBlack,
          ),
        ),
        const SizedBox(height: 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Rp',
              style: GoogleFonts.poppins(
                color: cBlack,
                fontSize: 20,
                fontWeight: semibold,
              ),
            ),
            Text(
              'getFormattedTotalZakat()',
              style: GoogleFonts.poppins(
                color: cBlack,
                fontSize: 20,
                fontWeight: semibold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          padding: const EdgeInsets.symmetric(vertical: 8),
          height: 80,
          decoration: BoxDecoration(
              color: cWhite,
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 1,
                  spreadRadius: 2,
                ),
              ],
              borderRadius: BorderRadius.circular(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Iconsax.gift5,
                      color: c1,
                      size: 36,
                    ),
                    const SizedBox(width: 8),
                    Column(
                      children: [
                        Text(
                          'Donasi',
                          style: GoogleFonts.poppins(
                            color: c5,
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          '3',
                          style: GoogleFonts.poppins(
                            color: cBlack,
                            fontSize: 22,
                            fontWeight: semibold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: 2,
                height: 30,
                color: c5,
              ),
              SizedBox(
                width: 120,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Iconsax.map_15,
                      color: c2,
                      size: 36,
                    ),
                    const SizedBox(width: 8),
                    Column(
                      children: [
                        Text(
                          'Layanan',
                          style: GoogleFonts.poppins(
                            color: c5,
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          '2',
                          style: GoogleFonts.poppins(
                            color: cBlack,
                            fontSize: 22,
                            fontWeight: semibold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: 2,
                height: 30,
                color: c5,
              ),
              SizedBox(
                width: 120,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Iconsax.information5,
                      color: c3,
                      size: 36,
                    ),
                    const SizedBox(width: 8),
                    Column(
                      children: [
                        Text(
                          'Informasi',
                          style: GoogleFonts.poppins(
                            color: c5,
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          '2',
                          style: GoogleFonts.poppins(
                            color: cBlack,
                            fontSize: 22,
                            fontWeight: semibold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
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
                  warna: c2,
                  title: 'Apa itu\nLAZISMU?',
                  diTekan: () {
                    showModalBottomSheet(
                      context: context,
                      backgroundColor: Colors.transparent,
                      isScrollControlled: true,
                      builder: (context) {
                        return DraggableScrollableSheet(
                          initialChildSize: 0.5, // setengah dari layar
                          maxChildSize: 1, // memenuhi layar
                          builder: (BuildContext context,
                              ScrollController scrollController) {
                            return Container(
                              margin: const EdgeInsets.only(top: 20),
                              padding: const EdgeInsets.all(16),
                              height: MediaQuery.of(context).size.height / 2,
                              decoration: BoxDecoration(
                                color: cWhite,
                                borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  topLeft: Radius.circular(20),
                                ),
                              ),
                              child: ListView.builder(
                                controller: scrollController,
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  return Column(
                                    children: [
                                      Container(
                                        margin:
                                            const EdgeInsets.only(bottom: 12),
                                        width: 60,
                                        height: 6,
                                        decoration: BoxDecoration(
                                          color: Colors.black26,
                                          borderRadius:
                                              BorderRadius.circular(99),
                                        ),
                                      ),
                                      const Lazismu(),
                                    ],
                                  );
                                },
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                ),

                // Visi dan Misi
                InformasiItems(
                  imageurl: 'assets/images/image_visi.png',
                  warna: c4,
                  title: 'Visi\ndan Misi',
                  diTekan: () {
                    showModalBottomSheet(
                      context: context,
                      backgroundColor: Colors.transparent,
                      isScrollControlled: true,
                      builder: (context) {
                        return DraggableScrollableSheet(
                          initialChildSize: 0.5, // setengah dari layar
                          maxChildSize: 1, // memenuhi layar
                          builder: (BuildContext context,
                              ScrollController scrollController) {
                            return Container(
                              margin: const EdgeInsets.only(top: 20),
                              padding: const EdgeInsets.all(16),
                              height: MediaQuery.of(context).size.height / 2,
                              decoration: BoxDecoration(
                                color: cWhite,
                                borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  topLeft: Radius.circular(20),
                                ),
                              ),
                              child: ListView.builder(
                                controller: scrollController,
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  return Column(
                                    children: [
                                      Container(
                                        margin:
                                            const EdgeInsets.only(bottom: 12),
                                        width: 60,
                                        height: 6,
                                        decoration: BoxDecoration(
                                          color: Colors.black26,
                                          borderRadius:
                                              BorderRadius.circular(99),
                                        ),
                                      ),
                                      const Visi(),
                                    ],
                                  );
                                },
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
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
                    BerandaItems1(
                      ikon: Iconsax.moneys,
                      title: 'Zakat',
                      subTitle: 'Donasi Zakat',
                      warna: c1,
                      diTekan: () {
                        Navigator.of(context).push(donasiZakat());
                      },
                    ),
                    BerandaItems2(
                      ikon: Iconsax.gift,
                      title: 'Sedekah',
                      subTitle: 'Donasi Sedekah',
                      warna: c2,
                      diTekan: () {
                        Navigator.of(context).push(donasiSedekah());
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  children: [
                    BerandaItems2(
                      ikon: Iconsax.truck,
                      title: 'Ambulans',
                      subTitle: 'Permintaan Ambulans',
                      warna: c3,
                      diTekan: () {
                        Navigator.of(context).push(permintaanAmbulan());
                      },
                    ),
                    BerandaItems1(
                      ikon: Iconsax.coin,
                      title: 'Infaq',
                      subTitle: 'Donasi Infaq',
                      warna: c4,
                      diTekan: () {
                        Navigator.of(context).push(donasiInfaq());
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).push(permintaanKoin());
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.all(12),
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                color: c1,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Iconsax.coin,
                    size: 48,
                    color: cWhite,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Koin Surga',
                        style: GoogleFonts.poppins(
                          color: cWhite,
                          fontSize: 18,
                          fontWeight: semibold,
                        ),
                      ),
                      Text(
                        'Permintaan Koin Surga',
                        style: GoogleFonts.poppins(
                          color: cWhite,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 1,
                    height: double.infinity,
                    color: cWhite,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Lanjutkan',
                        style: GoogleFonts.poppins(color: cWhite),
                      ),
                      Container(
                        width: 68,
                        height: 38,
                        decoration: BoxDecoration(
                          color: cWhite,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(
                          Iconsax.arrow_right_1,
                          color: c1,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
