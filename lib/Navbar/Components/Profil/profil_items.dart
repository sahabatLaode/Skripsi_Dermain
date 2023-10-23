import 'package:dermain/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilItems extends StatelessWidget {
  final IconData ikon1;
  final String title;
  final IconData ikon2;
  final VoidCallback diTekan;

  const ProfilItems(
      {super.key,
      required this.ikon1,
      required this.title,
      required this.ikon2,
      required this.diTekan});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      padding: const EdgeInsets.only(
        right: 18,
        left: 12,
        top: 12,
        bottom: 12,
      ),
      width: double.infinity,
      height: 74,
      decoration: BoxDecoration(
        color: c5,
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
                    color: c1,
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    color: c1,
                    fontSize: 16,
                    fontWeight: semibold,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
              ],
            ),
            Icon(
              ikon2,
              color: c1,
            ),
          ],
        ),
      ),
    );
  }
}
