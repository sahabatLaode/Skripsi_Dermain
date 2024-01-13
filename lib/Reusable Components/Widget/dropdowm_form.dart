import 'package:dermain/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class DropdownForm extends StatefulWidget {
  final List<String> list;
  final TextEditingController controller;
  final IconData icon;
  final Color warnaIcon;
  final String title;
  final String warning;

  const DropdownForm({
    Key? key,
    required this.list,
    required this.controller,
    required this.warnaIcon,
    required this.title,
    required this.warning,
    required this.icon,
  }) : super(key: key);

  @override
  _DropdownFormState createState() => _DropdownFormState();
}

class _DropdownFormState extends State<DropdownForm> {
  String dropdownJenis = '';

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
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          height: 60,
          decoration: BoxDecoration(
            color: c6,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              Icon(
                widget.icon,
                color: widget.warnaIcon,
              ),
              const SizedBox(width: 14),
              Expanded(
                child: DropdownButton<String>(
                  dropdownColor: c6,
                  value: dropdownJenis.isEmpty ? null : dropdownJenis,
                  isExpanded: true,
                  isDense: true,
                  icon: Icon(Iconsax.arrow_down_1, color: cBlack),
                  elevation: 16,
                  style: GoogleFonts.poppins(
                    color: cBlack,
                    fontSize: 16,
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      dropdownJenis = value!;
                      widget.controller.text = value;
                    });
                  },
                  items:
                      widget.list.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
        if (dropdownJenis.isEmpty)
          Container(
            margin: const EdgeInsets.only(top: 6),
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
