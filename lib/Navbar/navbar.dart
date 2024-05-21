import 'package:dermain/Navbar/Components/Layanan/layanan.dart';
import 'package:dermain/Navbar/Components/Profil/profil.dart';
import 'package:flutter/material.dart';
import 'package:dermain/Navbar/Components/Aktivitas/aktivitas.dart';
import 'package:dermain/Navbar/Components/Beranda/beranda.dart';
import 'package:dermain/theme.dart';
import 'package:flutter_svg/svg.dart';
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
    const Profil(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: cBlack,
      body: screens[index],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: c2,
          labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>(
            (states) {
              final isSelected = states.contains(WidgetState.selected);
              return GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: isSelected ? bold : regular,
              );
            },
          ),
        ),
        child: NavigationBar(
          labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
          elevation: 0,
          height: 80,
          backgroundColor: cWhite,
          selectedIndex: index,
          onDestinationSelected: (index) => setState(() => this.index = index),
          animationDuration: const Duration(milliseconds: 1300),
          destinations: [
            NavigationDestination(
              icon: Icon(
                Iconsax.home,
                color: cBlack,
              ),
              selectedIcon: Icon(
                Iconsax.home_15,
                color: c1,
              ),
              label: 'Beranda',
            ),
            NavigationDestination(
              icon: Icon(
                Iconsax.element_4,
                color: cBlack,
              ),
              selectedIcon: Icon(
                Iconsax.element_45,
                color: c1,
              ),
              label: 'Layanan',
            ),
            NavigationDestination(
              icon: Icon(
                Iconsax.task_square,
                color: cBlack,
              ),
              selectedIcon: Icon(
                Iconsax.task_square5,
                color: c1,
              ),
              label: 'Aktivitas',
            ),
            NavigationDestination(
              icon: Icon(
                Iconsax.user,
                color: cBlack,
              ),
              selectedIcon: SvgPicture.asset(
                'assets/icons/profil_bold.svg',
                colorFilter: ColorFilter.mode(
                  c1,
                  BlendMode.srcIn,
                ),
              ),
              label: 'Profil',
            ),
          ],
        ),
      ),
    );
  }
}
