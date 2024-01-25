import 'package:dermain/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomSnackBar extends SnackBar {
  CustomSnackBar({
    super.key,
    required String message,
    required IconData icon,
    required Color background,
  }) : super(
          content: Row(
            children: [
              Icon(
                icon,
                color: cWhite,
              ),
              const SizedBox(width: 6),
              Flexible(
                child: Text(
                  message,
                  style: GoogleFonts.poppins(
                    color: cWhite,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
          shape: const RoundedRectangleBorder(
            side: BorderSide.none,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          backgroundColor: background,
          elevation: 0,
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 10,
          ),
        );
}
