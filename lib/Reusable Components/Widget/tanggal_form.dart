import 'package:dermain/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

class TanggalForm extends StatefulWidget {
  final String title;
  final Color warna;
  final TextEditingController controller;

  const TanggalForm({
    super.key,
    required this.controller,
    required this.title,
    required this.warna,
  });

  @override
  State<TanggalForm> createState() => _TanggalFormState();
}

class _TanggalFormState extends State<TanggalForm> {
  DateTime selectDate = DateTime.now();

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
          padding: const EdgeInsets.only(
            left: 16,
            right: 4,
          ),
          height: 60,
          decoration: BoxDecoration(
            color: c6,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Iconsax.calendar_1,
                    color: widget.warna,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    // 'Pilih tanggal',
                    DateFormat('dd MMMM yyyy').format(selectDate),
                    style: GoogleFonts.poppins(
                      color: cBlack,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              Container(
                height: 52,
                width: 52,
                decoration: BoxDecoration(
                  color: widget.warna,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: IconButton(
                  onPressed: () {
                    showDatePicker(
                      context: context,
                      initialDate: selectDate.isBefore(DateTime.now())
                          ? DateTime.now()
                          : selectDate,
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2050),
                      // barrierColor: widget.warna,
                      cancelText: 'Batalkan',
                      confirmText: 'Pilih',
                      helpText: 'Pilih tanggal',
                      switchToCalendarEntryModeIcon:
                          const Icon(Iconsax.calendar_1),
                      switchToInputEntryModeIcon: const Icon(Iconsax.edit),
                    ).then(
                      (value) {
                        if (value != null) {
                          setState(() {
                            selectDate = value;
                            widget.controller.text =
                                DateFormat('dd MMMM yyyy').format(selectDate);
                          });
                        }
                      },
                    );
                  },
                  icon: Icon(
                    Iconsax.calendar_add5,
                    color: cWhite,
                  ),
                ),
              ),
            ],
          ),
        ),
        if (widget.controller.text.isEmpty)
          Container(
            margin: const EdgeInsets.only(top: 6),
            child: Text(
              'Pastikan tanggal yang dipilih sudah benar',
              style: GoogleFonts.poppins(
                color: cRed,
              ),
            ),
          ),
      ],
    );
  }
}
