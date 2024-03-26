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
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBar(
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
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
              padding: const EdgeInsets.symmetric(vertical: 3),
              decoration: BoxDecoration(
                color: cB2,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TabBar(
                dividerColor: Colors.transparent,
                splashBorderRadius: BorderRadius.circular(100),
                indicatorPadding: const EdgeInsets.all(6),
                unselectedLabelColor: cBlack,
                unselectedLabelStyle: GoogleFonts.poppins(),
                labelStyle: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: semibold,
                  color: cWhite,
                ),
                indicatorColor: cBlack,
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: c2,
                ),
                // padding: const EdgeInsets.only(left: 20, right: 20, bottom: 14),
                tabs: const [
                  Tab(
                    child: Text('Donasi'),
                  ),
                  Tab(
                    child: Text('Permintaan'),
                  ),
                ],
              ),
            ),
            const Expanded(
              child: TabBarView(
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
          ],
        ),
      ),
    );
  }
}
