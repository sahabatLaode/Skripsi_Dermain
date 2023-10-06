import 'package:dermain/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class BeritaBerandaItems extends StatelessWidget {
  final String imageUrl;
  final String tipe;
  final String title;
  final String admin;
  final DateTime date;
  final VoidCallback diTekan;

  const BeritaBerandaItems(
      {super.key,
      required this.imageUrl,
      required this.tipe,
      required this.title,
      required this.admin,
      required this.date,
      required this.diTekan});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        right: 12,
      ),
      width: 215,
      height: 295,
      decoration: BoxDecoration(
        color: c5,
        borderRadius: BorderRadius.circular(14),
      ),
      child: InkWell(
        onTap: diTekan,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 141,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(14),
                  topRight: Radius.circular(14),
                ),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    imageUrl,
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 10,
                bottom: 12,
                left: 10,
              ),
              child: Text(
                tipe,
                style: GoogleFonts.poppins(
                  color: c3,
                  fontSize: 12,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                left: 10,
                right: 10,
                bottom: 14,
              ),
              child: Text(
                title,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.poppins(
                  color: c1,
                  fontSize: 16,
                  fontWeight: semibold,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: Text(
                    admin,
                    style: GoogleFonts.poppins(
                      color: c1,
                      fontSize: 12,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  child: Text(
                    DateFormat('d MMMM y').format(date),
                    style: GoogleFonts.poppins(
                      color: c1,
                      fontSize: 12,
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
