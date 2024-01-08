import 'package:dermain/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class NamaOtomatisForm extends StatefulWidget {
  final String title;
  final Color warnaIcon;
  final Color warnaCheckBox;
  final TextEditingController namaController;

  const NamaOtomatisForm({
    super.key,
    required this.title,
    required this.namaController,
    required this.warnaIcon,
    required this.warnaCheckBox,
  });

  @override
  State<NamaOtomatisForm> createState() => _NamaOtomatisFormState();
}

class _NamaOtomatisFormState extends State<NamaOtomatisForm> {
  bool isChecked = false;
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
                color: widget.warnaIcon,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: TextFormField(
                  controller: widget.namaController,
                  decoration: InputDecoration.collapsed(
                    hintText: 'Nama Lengkap',
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
        if (widget.namaController.text.isEmpty ||
            widget.namaController.text == '')
          Text(
            'Masukkan nama lengkap',
            style: GoogleFonts.poppins(
              color: cRed,
            ),
          ),
        CheckboxListTile(
          title: Text(
            "Sembunyikan sebagai Hamba Allah",
            style: GoogleFonts.poppins(
              color: cBlack,
              fontSize: 12,
            ),
          ),
          activeColor: widget.warnaCheckBox,
          value: isChecked,
          onChanged: ((value) {
            setState(() {
              isChecked = value!;
              if (isChecked) {
                widget.namaController.text = "Hamba Allah";
              } else {
                widget.namaController.text = "";
              }
            });
          }),
        ),
      ],
    );
  }
}
