import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme.dart';

class TombolSekunder extends StatelessWidget {
  final String title;
  final VoidCallback ditekan;
  const TombolSekunder({super.key, required this.title, required this.ditekan});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 32),
      height: 56,
      width: double.infinity,
      child: TextButton(
        onPressed: ditekan,
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              style: BorderStyle.solid,
              color: c2,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Text(
          title,
          style: GoogleFonts.poppins(
            color: cBlack,
            fontSize: 18,
            fontWeight: semibold,
          ),
        ),
      ),
    );
  }
}
