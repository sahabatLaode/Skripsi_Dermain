import 'package:dermain/Navbar/Components/Aktivitas/Aktivitas%20Donasi/aktivitas_list.dart';
import 'package:dermain/Navbar/Components/Aktivitas/Aktivitas%20Permintaan/aktivitas_list_permintaan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dermain/theme.dart';
import 'package:google_fonts/google_fonts.dart';

class Aktivitas extends StatelessWidget {
  const Aktivitas({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: cWhite,
        appBar: AppBar(
          toolbarHeight: 80,
          automaticallyImplyLeading: false,
          elevation: 0.0,
          backgroundColor: cWhite,
          title: Text(
            'Aktivitas',
            style: GoogleFonts.poppins(
              color: cBlack,
              fontSize: 28,
              fontWeight: semibold,
            ),
          ),
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: cWhite,
            statusBarIconBrightness: Brightness.dark,
          ),
          bottom: TabBar(
            // isScrollable: true,
            // overlayColor: const MaterialStatePropertyAll(Colors.transparent),
            unselectedLabelColor: cBlack,
            unselectedLabelStyle: GoogleFonts.poppins(),
            labelStyle: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: semibold,
            ),
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: c2,
            ),
            padding: const EdgeInsets.only(left: 14, right: 14, bottom: 14),
            tabs: const [
              Tab(
                child: Text('Aktivitas  Donasi'),
              ),
              Tab(
                child: Text('Permintaan'),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  AktivitasList(
                    Center(),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  AktivitasListPermintaan(
                    Center(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
