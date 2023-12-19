import 'package:dermain/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LayananItems extends StatelessWidget {
  final IconData ikon1;
  final String title;
  final String subtitle;
  final IconData ikon2;
  final VoidCallback diTekan;

  const LayananItems(
      {super.key,
      required this.ikon1,
      required this.title,
      required this.subtitle,
      required this.ikon2,
      required this.diTekan});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        right: 18,
        left: 12,
        top: 12,
        bottom: 12,
      ),
      width: double.infinity,
      height: 74,
      decoration: BoxDecoration(
        color: c6,
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: diTekan,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: c2,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    ikon1,
                    color: cBlack,
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.poppins(
                        color: cBlack,
                        fontSize: 16,
                        fontWeight: semibold,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      subtitle,
                      style: GoogleFonts.poppins(
                        color: cBlack,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Icon(
              ikon2,
              color: cBlack,
            ),
          ],
        ),
      ),
    );
  }
}
