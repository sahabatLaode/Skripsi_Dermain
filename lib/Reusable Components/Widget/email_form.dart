import 'package:dermain/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class EmailForm extends StatefulWidget {
  final String title;
  final Color warnaIcon;
  final TextEditingController controller;

  const EmailForm({
    super.key,
    required this.title,
    required this.controller,
    required this.warnaIcon,
  });

  @override
  State<EmailForm> createState() => _EmailFormState();
}

class _EmailFormState extends State<EmailForm> {
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
                Iconsax.sms,
                color: widget.warnaIcon,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: TextFormField(
                  controller: widget.controller,
                  keyboardType: TextInputType.streetAddress,
                  decoration: InputDecoration.collapsed(
                    hintText: 'lazismu@gmail.com',
                    hintStyle: GoogleFonts.poppins(
                      color: c5,
                      fontSize: 16,
                    ),
                  ),
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                  ),
                  onChanged: (value) {
                    setState(() {});
                  },
                ),
              ),
            ],
          ),
        ),
        if (widget.controller.text.isEmpty ||
            !widget.controller.text.contains('@') ||
            !widget.controller.text.contains('.com'))
          Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Text(
              'Masukkan email yang valid',
              style: GoogleFonts.poppins(
                color: cRed,
              ),
            ),
          ),
      ],
    );
  }
}
