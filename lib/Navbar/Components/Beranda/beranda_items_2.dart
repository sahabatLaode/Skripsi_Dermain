import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import '../../../theme.dart';

class BerandaItems2 extends StatelessWidget {
  final IconData ikon;
  final String title;
  final String subTitle;
  final Color warna;
  final VoidCallback diTekan;

  const BerandaItems2({
    super.key,
    required this.ikon,
    required this.title,
    required this.subTitle,
    required this.warna,
    required this.diTekan,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: diTekan,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(12),
        height: 240,
        width: double.infinity,
        decoration: BoxDecoration(
          color: warna,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              ikon,
              size: 48,
              color: cWhite,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    color: cWhite,
                    fontSize: 18,
                    fontWeight: semibold,
                  ),
                ),
                Text(
                  subTitle,
                  style: GoogleFonts.poppins(
                    color: cWhite,
                  ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              height: 1,
              color: cWhite,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Lanjutkan',
                  style: GoogleFonts.poppins(color: cWhite),
                ),
                Container(
                  width: 38,
                  height: 38,
                  decoration: BoxDecoration(
                    color: cWhite,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    Iconsax.arrow_right_1,
                    color: warna,
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
