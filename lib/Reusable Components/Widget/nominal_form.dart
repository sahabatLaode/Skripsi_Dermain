import 'package:dermain/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/formatters/currency_input_formatter.dart';
import 'package:google_fonts/google_fonts.dart';

class NominalForm extends StatefulWidget {
  final String judul;
  final Color warnaIcon;
  final TextEditingController controller;

  const NominalForm({
    super.key,
    required this.judul,
    required this.controller,
    required this.warnaIcon,
  });

  @override
  State<NominalForm> createState() => _NominalFormState();
}

class _NominalFormState extends State<NominalForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.judul,
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Rp',
                style: GoogleFonts.poppins(
                  color: widget.warnaIcon,
                  fontSize: 24,
                  fontWeight: bold,
                ),
              ),
              Expanded(
                child: TextFormField(
                  controller: widget.controller,
                  keyboardType: TextInputType.number,
                  autocorrect: false,
                  inputFormatters: [
                    CurrencyInputFormatter(
                      // trailingSymbol: CurrencySymbols.,
                      useSymbolPadding: true,
                      mantissaLength: 3,
                    ),
                  ],
                  decoration: InputDecoration.collapsed(
                    hintText: '0.000',
                    hintStyle: GoogleFonts.poppins(
                      color: c5,
                      fontSize: 24,
                    ),
                  ),
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: bold,
                  ),
                  onChanged: (value) {
                    setState(() {});
                  },
                ),
              ),
            ],
          ),
        ),
        if (widget.controller.text.isEmpty || widget.controller.text == '0.000')
          Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Text(
              'Masukkan nominal',
              style: GoogleFonts.poppins(
                color: cRed,
              ),
            ),
          ),
      ],
    );
  }
}
