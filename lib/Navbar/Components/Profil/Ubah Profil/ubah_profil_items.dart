import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../theme.dart';

class UbahProfilItems extends StatelessWidget {
  final String title;
  const UbahProfilItems({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: double.infinity,
      decoration:
          BoxDecoration(color: c2, borderRadius: BorderRadius.circular(16)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextFormField(
            decoration: InputDecoration(
              filled: true,
              fillColor: c2,
              labelText: title,
              labelStyle: GoogleFonts.poppins(
                color: c3,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
