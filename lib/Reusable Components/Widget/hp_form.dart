import 'package:dermain/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class HpForm extends StatefulWidget {
  final String title;
  final Color warnaIcon;
  final TextEditingController controller;

  const HpForm({
    super.key,
    required this.title,
    required this.controller,
    required this.warnaIcon,
  });

  @override
  State<HpForm> createState() => _HpFormState();
}

class _HpFormState extends State<HpForm> {
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
          decoration: BoxDecoration(
            color: c6,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              Icon(
                Iconsax.call,
                color: widget.warnaIcon,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: TextFormField(
                  controller: widget.controller,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration.collapsed(
                    hintText: '081234567890',
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
          ),
        ),
        if (widget.controller.text.isEmpty ||
            (!widget.controller.text.startsWith('08') &&
                !widget.controller.text.startsWith('+628')))
          Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Text(
              'Masukkan nomor telepon yang valid',
              style: GoogleFonts.poppins(
                color: cRed,
              ),
            ),
          ),
      ],
    );
  }
}
