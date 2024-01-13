import 'package:dermain/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

class WaktuForm extends StatefulWidget {
  final String title;
  final Color warna;
  final TextEditingController controller;

  const WaktuForm(
      {super.key,
      required this.title,
      required this.warna,
      required this.controller});

  @override
  State<WaktuForm> createState() => _WaktuFormState();
}

class _WaktuFormState extends State<WaktuForm> {
  DateTime selectTime = DateTime.now();

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
                    Iconsax.clock,
                    color: widget.warna,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    // 'Pilih waktu',
                    DateFormat('HH:mm').format(selectTime),
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
                    showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.fromDateTime(
                          selectTime.isBefore(DateTime.now())
                              ? DateTime.now()
                              : selectTime),
                      builder: (BuildContext context, Widget? child) {
                        return MediaQuery(
                          data: MediaQuery.of(context)
                              .copyWith(alwaysUse24HourFormat: true),
                          child: child!,
                        );
                      },
                      // barrierColor: widget.warna,
                      cancelText: 'Batalkan',
                      confirmText: 'Pilih',
                      helpText: 'Pilih waktu',
                    ).then(
                      (value) {
                        if (value != null) {
                          setState(() {
                            selectTime = DateTime(
                                DateTime.now().year,
                                DateTime.now().month,
                                DateTime.now().day,
                                value.hour,
                                value.minute);
                            widget.controller.text =
                                DateFormat('HH:mm').format(selectTime);
                          });
                        }
                      },
                    );
                  },
                  icon: Icon(
                    Iconsax.clock5,
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
              'Pastikan waktu yang dipilih sudah benar',
              style: GoogleFonts.poppins(
                color: cRed,
              ),
            ),
          ),
      ],
    );
  }
}
