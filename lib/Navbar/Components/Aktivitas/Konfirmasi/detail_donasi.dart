import 'package:dermain/Models/zakat_model.dart';
import 'package:dermain/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

class DetailDonasi extends StatefulWidget {
  final Zakat? zakat;

  const DetailDonasi({Key? key, required this.zakat}) : super(key: key);

  @override
  State<DetailDonasi> createState() => _DetailDonasiState();
}

class _DetailDonasiState extends State<DetailDonasi> {
  @override
  Widget build(BuildContext context) {
    final Map<String, Color> donationColors = {
      'Zakat': c1,
      'Infaq': c4,
      'Sedekah': c2,
    };

    return TextButton(
      onPressed: () {
        final Zakat? zakat = widget.zakat;
        DateTime zakatDate = DateTime.parse(zakat!.created_at);
        String zakatFormattedDate =
            DateFormat('dd MMMM yyyy').format(zakatDate);

        showModalBottomSheet(
          isScrollControlled: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40.0),
          ),
          context: context,
          builder: (BuildContext bc) {
            return Container(
              height: 500,
              decoration: BoxDecoration(
                color: cWhite,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
              ),
              child: ListView(
                physics: const ClampingScrollPhysics(),
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      'Detail Transaksi',
                      style: GoogleFonts.poppins(
                        color: cBlack,
                        fontSize: 18,
                        fontWeight: semibold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    height: 440,
                    decoration: BoxDecoration(
                      color: donationColors[zakat.jenis_donasi] ?? cWhite,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              zakat.jenis_donasi,
                              style: GoogleFonts.poppins(
                                color: donationColors[zakat.jenis_donasi] ??
                                    cWhite,
                                fontSize: 18,
                                fontWeight: bold,
                              ),
                            ),
                            Text(
                              zakat.nominal,
                              style: GoogleFonts.poppins(
                                color: cBlack,
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
                                color: cBlack,
                              ),
                            ),
                            Text(
                              zakat.email,
                              style: GoogleFonts.poppins(
                                color: cBlack,
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
                                color: cBlack,
                              ),
                            ),
                            Text(
                              zakatFormattedDate,
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
          },
        );
      },
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(c6),
        fixedSize: const MaterialStatePropertyAll(
          Size.fromHeight(50),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Detail transaksi',
            style: GoogleFonts.poppins(
              color: cBlack,
            ),
          ),
          const SizedBox(width: 12),
          Icon(
            Iconsax.arrow_down_1,
            color: cBlack,
          ),
        ],
      ),
    );
  }
}
