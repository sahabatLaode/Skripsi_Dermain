import 'package:dermain/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class PeringatanForm extends StatefulWidget {
  final String teks1;
  final String teks2;

  const PeringatanForm({super.key, required this.teks1, required this.teks2});

  @override
  State<PeringatanForm> createState() => _PeringatanFormState();
}

class _PeringatanFormState extends State<PeringatanForm> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Iconsax.info_circle5,
            color: cRed,
          ),
          const SizedBox(width: 6),
          Expanded(
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '1.',
                      style: GoogleFonts.poppins(),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        widget.teks1,
                        maxLines: 4,
                        textAlign: TextAlign.justify,
                        overflow: TextOverflow.clip,
                        style: GoogleFonts.poppins(
                          color: cBlack,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '2.',
                      style: GoogleFonts.poppins(),
                    ),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        widget.teks2,
                        maxLines: 5,
                        textAlign: TextAlign.justify,
                        overflow: TextOverflow.clip,
                        style: GoogleFonts.poppins(
                          color: cBlack,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
