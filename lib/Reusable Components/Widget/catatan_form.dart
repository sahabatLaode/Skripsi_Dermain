import 'package:dermain/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CatatanForm extends StatefulWidget {
  final String title;
  final String subtitle;
  final TextEditingController controller;

  const CatatanForm(
      {super.key,
      required this.controller,
      required this.title,
      required this.subtitle});

  @override
  State<CatatanForm> createState() => _CatatanFormState();
}

class _CatatanFormState extends State<CatatanForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: GoogleFonts.poppins(
            color: cBlack,
            fontSize: 12,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 6),
          padding: const EdgeInsets.all(16),
          height: 180,
          decoration: BoxDecoration(
            color: c6,
            borderRadius: BorderRadius.circular(16),
          ),
          child: TextField(
            controller: widget.controller,
            maxLines: null,
            style: GoogleFonts.poppins(
              color: cBlack,
              fontSize: 16,
            ),
            decoration: InputDecoration.collapsed(
              hintText: widget.subtitle,
              hintStyle: GoogleFonts.poppins(
                color: c5,
                fontSize: 16,
              ),
            ),
            onChanged: (value) {
              setState(() {});
            },
          ),
        ),
      ],
    );
  }
}
