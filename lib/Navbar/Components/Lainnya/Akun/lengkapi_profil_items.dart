import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../theme.dart';

class LengkapiProfilItems extends StatelessWidget {
  final String title;
  const LengkapiProfilItems({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: title,
        labelStyle: GoogleFonts.poppins(
          color: c3,
          fontSize: 16,
        ),
      ),
    );
  }
}
