import 'package:dermain/Models/koinSurga_model.dart';
import 'package:dermain/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class AktivitasItemPermintaan extends ConsumerStatefulWidget {
  final KoinSurga? koinSurga;

  const AktivitasItemPermintaan({
    super.key,
    required this.koinSurga,
  });

  @override
  ConsumerState<AktivitasItemPermintaan> createState() =>
      _AktivitasItemPermintaanState();
}

class _AktivitasItemPermintaanState
    extends ConsumerState<AktivitasItemPermintaan> {
  @override
  Widget build(BuildContext context) {
    if (widget.koinSurga != null) {}
    return _buildKoinSurgaCard();
  }

  Widget _buildKoinSurgaCard() {
    final KoinSurga? koinSurga = widget.koinSurga;
    DateTime koinSurgaDate = DateTime.parse(koinSurga!.created_at);
    String koinSurgaFormattedDate =
        DateFormat('dd MMMM yyyy').format(koinSurgaDate);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            height: 101,
            width: double.infinity,
            decoration: BoxDecoration(
              color: c6,
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
                Text(
                  koinSurga.jenis_permintaan,
                  style: GoogleFonts.poppins(
                    color: cBlack,
                    fontSize: 18,
                    fontWeight: bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  koinSurga.catatan,
                  style: GoogleFonts.poppins(
                    color: cBlack,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // Text(
                    //   koinSurga.phone,
                    //   style: GoogleFonts.poppins(
                    //     color: cBlack,
                    //   ),
                    // ),
                    Text(
                      koinSurgaFormattedDate,
                      style: GoogleFonts.poppins(
                        color: cBlack,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
