import 'package:dermain/Navbar/Components/Aktivitas/aktivitas_list.dart';
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
    return Scaffold(
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
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [Center(child: AktivitasList(Center()))],
          ),
        ),
      ),
    );
  }
}
