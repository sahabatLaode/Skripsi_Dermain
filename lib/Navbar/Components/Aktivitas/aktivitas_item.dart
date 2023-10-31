import 'package:dermain/Models/zakat_model.dart';
import 'package:dermain/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class AktivitasItem extends ConsumerStatefulWidget {
  final Zakat zakat;
  const AktivitasItem({super.key, required this.zakat});

  @override
  ConsumerState<AktivitasItem> createState() => _AktivitasItemState();
}

class _AktivitasItemState extends ConsumerState<AktivitasItem> {
  @override
  Widget build(BuildContext context) {
    DateTime createdDate = DateTime.parse(widget.zakat.created_at);
    String formattedDate = DateFormat('dd MMMM yyyy').format(createdDate);

    return Column(
      children: [
        // Donasi Zakat
        Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          margin: const EdgeInsets.only(bottom: 16),
          height: 101,
          width: double.infinity,
          decoration: BoxDecoration(
            color: c5,
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 1,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.zakat.jenis_donasi,
                    style: GoogleFonts.poppins(
                      color: c1,
                      fontSize: 18,
                      fontWeight: bold,
                    ),
                  ),
                  Text(
                    widget.zakat.nominal,
                    style: GoogleFonts.poppins(
                      color: c1,
                      fontSize: 18,
                      fontWeight: bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.zakat.nama,
                    style: GoogleFonts.poppins(
                      color: c1,
                    ),
                  ),
                  Text(
                    widget.zakat.email,
                    style: GoogleFonts.poppins(
                      color: c1,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.zakat.phone,
                    style: GoogleFonts.poppins(
                      color: c1,
                    ),
                  ),
                  Text(
                    formattedDate,
                    style: GoogleFonts.poppins(
                      color: c1,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
