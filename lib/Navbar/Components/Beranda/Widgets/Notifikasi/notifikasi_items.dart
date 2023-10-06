import 'package:dermain/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class NotifikasiItems extends StatelessWidget {
  final IconData ikon;
  final String title;
  final DateTime date;

  const NotifikasiItems({
    super.key,
    required this.ikon,
    required this.title,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: c2,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            ikon,
            color: c1,
            size: 24,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
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
              Text(
                DateFormat('d MMMM y').format(date),
                style: GoogleFonts.poppins(
                  color: c1,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
