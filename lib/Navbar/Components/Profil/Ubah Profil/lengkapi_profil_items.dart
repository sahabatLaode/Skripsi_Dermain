import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../theme.dart';

class UbahProfilItems extends StatelessWidget {
  final String title;
  const UbahProfilItems({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: title,
        labelStyle: GoogleFonts.poppins(
          color: c3,
        ),
      ),
    );
  }
}
