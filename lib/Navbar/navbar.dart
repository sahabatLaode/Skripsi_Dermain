import 'package:dermain/Navbar/Components/Profil/lainnya.dart';
import 'package:dermain/Navbar/Components/Layanan/layanan.dart';
import 'package:flutter/material.dart';
import 'package:dermain/Navbar/Components/Aktivitas/aktivitas.dart';
import 'package:dermain/Navbar/Components/Beranda/beranda.dart';
import 'package:dermain/theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int index = 0;
  final screens = [
    const Beranda(),
    const Layanan(),
    const Aktivitas(),
    const Lainnya(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: c1,
      body: screens[index],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: c2,
          labelTextStyle: MaterialStateProperty.resolveWith<TextStyle>(
            (states) {
              final isSelected = states.contains(MaterialState.selected);
              return GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: isSelected ? bold : regular,
              );
            },
          ),
        ),
        child: NavigationBar(
          labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
          elevation: 20.0,
          height: 80,
          backgroundColor: cWhite,
          selectedIndex: index,
          onDestinationSelected: (index) => setState(() => this.index = index),
          animationDuration: const Duration(seconds: 1),
          destinations: [
            NavigationDestination(
              icon: Icon(
                Iconsax.home,
                color: c1,
              ),
              selectedIcon: Icon(
                Iconsax.home_15,
                color: c1,
              ),
              label: 'Beranda',
            ),
            NavigationDestination(
              icon: Icon(
                Iconsax.menu,
                color: c1,
              ),
              selectedIcon: Icon(
                Iconsax.menu5,
                color: c1,
              ),
              label: 'Layanan',
            ),
            NavigationDestination(
              icon: Icon(
                Iconsax.task_square,
                color: c1,
              ),
              selectedIcon: Icon(
                Iconsax.task_square5,
                color: c1,
              ),
              label: 'Aktivitas',
            ),
            NavigationDestination(
              icon: Icon(
                Iconsax.profile_circle,
                color: c1,
              ),
              selectedIcon: Icon(
                Iconsax.profile_circle5,
                color: c1,
              ),
              label: 'Profil',
            ),
          ],
        ),
      ),
    );
  }
}
