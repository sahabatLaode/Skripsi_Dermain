import 'package:dermain/Models/zakat_model.dart';
import 'package:dermain/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class AktivitasItem extends ConsumerStatefulWidget {
  final Zakat? zakat;

  const AktivitasItem({
    super.key,
    required this.zakat,
  });

  @override
  ConsumerState<AktivitasItem> createState() => _AktivitasItemState();
}

class _AktivitasItemState extends ConsumerState<AktivitasItem> {
  @override
  Widget build(BuildContext context) {
    if (widget.zakat != null) {}
    return _buildZakatCard();
  }

  Widget _buildZakatCard() {
    final Zakat? zakat = widget.zakat;
    DateTime zakatDate = DateTime.parse(zakat!.created_at);
    String zakatFormattedDate = DateFormat('dd MMMM yyyy').format(zakatDate);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
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
                      zakat.jenis_donasi,
                      style: GoogleFonts.poppins(
                        color: c1,
                        fontSize: 18,
                        fontWeight: bold,
                      ),
                    ),
                    Text(
                      zakat.nominal,
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
                      zakat.nama,
                      style: GoogleFonts.poppins(
                        color: c1,
                      ),
                    ),
                    Text(
                      zakat.email,
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
                      zakat.phone,
                      style: GoogleFonts.poppins(
                        color: c1,
                      ),
                    ),
                    Text(
                      zakatFormattedDate,
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
      ),
    );
  }

  // Widget _buildInfaqCard() {
  //   final Infaq? infaq = widget.infaq;
  //   DateTime infaqDate = DateTime.parse(infaq!.created_at);
  //   String infaqFormattedDate = DateFormat('dd MMMM yyyy').format(infaqDate);

  //   return Padding(
  //     padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
  //     child: Column(
  //       children: [
  //         Container(
  //           padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
  //           height: 101,
  //           width: double.infinity,
  //           decoration: BoxDecoration(
  //             color: c5,
  //             borderRadius: BorderRadius.circular(16),
  //             boxShadow: const [
  //               BoxShadow(
  //                 color: Colors.black12,
  //                 blurRadius: 1,
  //                 spreadRadius: 2,
  //               ),
  //             ],
  //           ),
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   Text(
  //                     infaq.jenis_donasi,
  //                     style: GoogleFonts.poppins(
  //                       color: c1,
  //                       fontSize: 18,
  //                       fontWeight: bold,
  //                     ),
  //                   ),
  //                   Text(
  //                     infaq.nominal,
  //                     style: GoogleFonts.poppins(
  //                       color: c1,
  //                       fontSize: 18,
  //                       fontWeight: bold,
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //               const SizedBox(height: 4),
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   Text(
  //                     infaq.nama,
  //                     style: GoogleFonts.poppins(
  //                       color: c1,
  //                     ),
  //                   ),
  //                   Text(
  //                     infaq.email,
  //                     style: GoogleFonts.poppins(
  //                       color: c1,
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //               const SizedBox(height: 4),
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   Text(
  //                     infaq.phone,
  //                     style: GoogleFonts.poppins(
  //                       color: c1,
  //                     ),
  //                   ),
  //                   Text(
  //                     infaqFormattedDate,
  //                     style: GoogleFonts.poppins(
  //                       color: c1,
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // Widget _buildSedekahCard() {
  //   final Sedekah? sedekah = widget.sedekah;
  //   DateTime sedekahDate = DateTime.parse(sedekah!.created_at);
  //   String sedekahFormattedDate =
  //       DateFormat('dd MMMM yyyy').format(sedekahDate);

  //   return Padding(
  //     padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
  //     child: Column(
  //       children: [
  //         Container(
  //           padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
  //           height: 101,
  //           width: double.infinity,
  //           decoration: BoxDecoration(
  //             color: c5,
  //             borderRadius: BorderRadius.circular(16),
  //             boxShadow: const [
  //               BoxShadow(
  //                 color: Colors.black12,
  //                 blurRadius: 1,
  //                 spreadRadius: 2,
  //               ),
  //             ],
  //           ),
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   Text(
  //                     sedekah.jenis_donasi,
  //                     style: GoogleFonts.poppins(
  //                       color: c1,
  //                       fontSize: 18,
  //                       fontWeight: bold,
  //                     ),
  //                   ),
  //                   Text(
  //                     sedekah.nominal,
  //                     style: GoogleFonts.poppins(
  //                       color: c1,
  //                       fontSize: 18,
  //                       fontWeight: bold,
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //               const SizedBox(height: 4),
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   Text(
  //                     sedekah.nama,
  //                     style: GoogleFonts.poppins(
  //                       color: c1,
  //                     ),
  //                   ),
  //                   Text(
  //                     sedekah.email,
  //                     style: GoogleFonts.poppins(
  //                       color: c1,
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //               const SizedBox(height: 4),
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   Text(
  //                     sedekah.phone,
  //                     style: GoogleFonts.poppins(
  //                       color: c1,
  //                     ),
  //                   ),
  //                   Text(
  //                     sedekahFormattedDate,
  //                     style: GoogleFonts.poppins(
  //                       color: c1,
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
