import 'package:dermain/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class BeritaItems extends StatelessWidget {
  final String imageUrl;
  final String tipeberita;
  final String title;
  final String subtitle;
  final DateTime date;

  const BeritaItems({
    super.key,
    required this.imageUrl,
    required this.tipeberita,
    required this.title,
    required this.subtitle,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                imageUrl,
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                tipeberita,
                style: GoogleFonts.poppins(
                  color: c3,
                  fontSize: 12,
                  fontWeight: bold,
                ),
              ),
              Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.poppins(
                  color: c1,
                  fontSize: 16,
                  fontWeight: semibold,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    subtitle,
                    style: GoogleFonts.poppins(
                      color: c1,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    DateFormat('d MMMM y').format(date),
                    style: GoogleFonts.poppins(
                      color: c1,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
