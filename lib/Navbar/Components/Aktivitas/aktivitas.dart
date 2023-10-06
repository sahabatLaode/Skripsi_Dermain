import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dermain/theme.dart';
import 'package:google_fonts/google_fonts.dart';

class Aktivitas extends StatelessWidget {
  const Aktivitas({super.key});

  // TabController _controller;
  // int _selectedIndex = 0;

  // @override
  // void initState() {
  //   super.initState();
  // }

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
              color: c1,
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
            overlayColor: const MaterialStatePropertyAll(Colors.transparent),
            unselectedLabelColor: Colors.black38,
            unselectedLabelStyle: GoogleFonts.poppins(),
            labelStyle: TextStyle(
              fontSize: 16,
              fontWeight: bold,
            ),
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: c2,
            ),
            padding: const EdgeInsets.only(left: 14, right: 14, bottom: 14),
            tabs: [
              Tab(
                child: Text(
                  'Dalam Proses',
                  style: GoogleFonts.poppins(
                    color: c1,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'Selesai',
                  style: GoogleFonts.poppins(
                    color: c1,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 220,
                  child: Image.asset(
                    'assets/images/image_aktivitas1.png',
                  ),
                ),
                const SizedBox(
                  height: 48,
                ),
                Text(
                  'Belum ada aktivitas yang dilakukan.',
                  style: GoogleFonts.poppins(
                    color: c1,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/donasi-infaq',
                    );
                  },
                  child: Text(
                    'Mulai dengan Donasi',
                    style: GoogleFonts.poppins(
                        color: c1,
                        fontWeight: semibold,
                        decoration: TextDecoration.underline),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 220,
                  child: Image.asset(
                    'assets/images/image_aktivitas1.png',
                  ),
                ),
                const SizedBox(
                  height: 48,
                ),
                Text(
                  'Belum ada aktivitas yang dilakukan.',
                  style: GoogleFonts.poppins(
                    color: c1,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/donasi-infaq',
                    );
                  },
                  child: Text(
                    'Mulai dengan Donasi',
                    style: GoogleFonts.poppins(
                      color: c1,
                      fontWeight: semibold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
