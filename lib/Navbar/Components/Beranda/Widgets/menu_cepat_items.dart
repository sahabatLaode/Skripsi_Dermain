import 'package:dermain/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuCepatItems extends StatelessWidget {
  final IconData ikon;
  final String title;
  const MenuCepatItems({super.key, required this.ikon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            color: c5,
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4,
                spreadRadius: 0,
                offset: Offset(0, 3),
                blurStyle: BlurStyle.solid,
              ),
            ],
          ),
          child: Icon(
            ikon,
            color: c1,
            size: 32,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          title,
          style: GoogleFonts.poppins(
            color: c1,
            fontSize: 12,
          ),
        )
      ],
    );
  }
}
