import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../../../theme.dart';

class BacaBeritaItems extends StatelessWidget {
  final String logo;
  final String admin;
  final DateTime date;
  final String title;
  final String imageUrl;
  final String sumber;
  final String isi;
  const BacaBeritaItems(
      {super.key,
      required this.logo,
      required this.admin,
      required this.date,
      required this.title,
      required this.imageUrl,
      required this.sumber,
      required this.isi});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  logo,
                  width: 20,
                ),
                const SizedBox(width: 6),
                Text(
                  admin,
                  style: GoogleFonts.poppins(
                    color: c3,
                    fontSize: 12,
                  ),
                )
              ],
            ),
            Text(
              DateFormat('d MMMM y').format(date),
              style: GoogleFonts.poppins(
                color: c3,
                fontSize: 12,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Text(
          title,
          style: GoogleFonts.poppins(
            color: c1,
            fontSize: 20,
            fontWeight: semibold,
          ),
        ),
        const SizedBox(height: 24),
        Container(
          margin: const EdgeInsets.only(bottom: 8),
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                imageUrl,
              ),
            ),
          ),
        ),
        Text(
          sumber,
          style: GoogleFonts.poppins(
            color: c3,
            fontSize: 12,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        Text(
          isi,
          style: GoogleFonts.poppins(
            color: c1,
          ),
        ),
      ],
    );
  }
}
