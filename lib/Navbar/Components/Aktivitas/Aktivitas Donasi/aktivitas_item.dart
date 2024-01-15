import 'package:dermain/Models/zakat_model.dart';
import 'package:dermain/Navbar/Components/Aktivitas/Konfirmasi/konfirmasi_donasi.dart';
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
  final Map<String, Color> titleColors = {
    'Zakat': c1,
    'Infaq': c4,
    'Sedekah': c2,
  };

  @override
  Widget build(BuildContext context) {
    if (widget.zakat != null) {}
    return _buildZakatCard();
  }

  Widget _buildZakatCard() {
    final Zakat? zakat = widget.zakat;
    DateTime zakatDate = DateTime.parse(zakat!.created_at);
    String zakatFormattedDate = DateFormat('dd MMMM yyyy').format(zakatDate);
    final formatter =
        NumberFormat.currency(locale: 'id_ID', symbol: 'Rp', decimalDigits: 0);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              // Navigasi ke halaman Detail dan mengirimkan data zakat sebagai argumen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => KonfirmasiDonasi(zakat: zakat),
                ),
              );
            },
            child: Container(
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        zakat.jenis_donasi,
                        style: GoogleFonts.poppins(
                          color: titleColors[zakat.jenis_donasi] ?? cWhite,
                          fontSize: 18,
                          fontWeight: bold,
                        ),
                      ),
                      Text(
                        formatter.format(zakat.nominal),
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
          ),
        ],
      ),
    );
  }
}
