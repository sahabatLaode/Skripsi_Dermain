import 'package:dermain/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class NominalForm extends StatefulWidget {
  final String judul;
  final Color warnaIcon;
  final TextEditingController controller;

  const NominalForm({
    Key? key,
    required this.judul,
    required this.controller,
    required this.warnaIcon,
  }) : super(key: key);

  @override
  _NominalFormState createState() => _NominalFormState();
}

class _NominalFormState extends State<NominalForm> {
  final FocusNode _focusNode = FocusNode();
  final NumberFormat numberFormat =
      NumberFormat.currency(locale: 'id_ID', symbol: 'Rp', decimalDigits: 0);

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    if (!_focusNode.hasFocus) {
      String newText =
          widget.controller.text.replaceAll(',', '').replaceAll('Rp', '');
      int value = double.parse(newText).toInt();
      widget.controller.text = numberFormat.format(value);
    }
  }

  void _onTextChanged() {
    if (_focusNode.hasFocus) {
      String newText =
          widget.controller.text.replaceAll(',', '').replaceAll('Rp', '');
      int value = double.parse(newText).toInt();
      widget.controller.text = numberFormat.format(value);
    }
  }

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
              Expanded(
                child: TextFormField(
                  controller: widget.controller,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  autocorrect: false,
                  focusNode: _focusNode,
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
              )
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

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    super.dispose();
  }
}
