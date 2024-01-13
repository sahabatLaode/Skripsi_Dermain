import 'package:dermain/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class NamaForm extends StatefulWidget {
  final String title;
  final String hint;
  final String warning;
  final Color color;
  final TextEditingController controller;

  const NamaForm(
      {super.key,
      required this.title,
      required this.hint,
      required this.warning,
      required this.color,
      required this.controller});

  @override
  State<NamaForm> createState() => _NamaFormState();
}

class _NamaFormState extends State<NamaForm> {
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
          padding: const EdgeInsets.symmetric(horizontal: 16),
          height: 60,
          decoration: BoxDecoration(
            color: c6,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              Icon(
                Iconsax.user,
                color: widget.color,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: TextFormField(
                  controller: widget.controller,
                  decoration: InputDecoration.collapsed(
                    hintText: widget.hint,
                    hintStyle: GoogleFonts.poppins(
                      color: c5,
                      fontSize: 16,
                    ),
                  ),
                  style: GoogleFonts.poppins( ),
                  onChanged: (value) {
                    setState(() {});
                  },
                ),
              ),
            ],
          ),
        ),
        if (widget.controller.text.isEmpty || widget.controller.text == '')
          Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Text(
              widget.warning,
              style: GoogleFonts.poppins(
                color: cRed,
              ),
            ),
          ),
      ],
    );
  }
}
