import 'package:dermain/Models/ambulan_model.dart';
import 'package:dermain/separator.dart';
import 'package:dermain/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

class KonfirmasiAmbulan extends StatefulWidget {
  final Ambulan ambulan;

  const KonfirmasiAmbulan({super.key, required this.ambulan});

  @override
  State<KonfirmasiAmbulan> createState() => _KonfirmasiAmbulanState();
}

class _KonfirmasiAmbulanState extends State<KonfirmasiAmbulan> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: cWhite,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Iconsax.arrow_left,
            color: cBlack,
          ),
        ),
        centerTitle: true,
        title: Text(
          'Konfirmasi Ambulans',
          style: GoogleFonts.poppins(
            color: cBlack,
            fontSize: 18,
            fontWeight: semibold,
          ),
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: cWhite,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            transaksi(),
          ],
        ),
      ),
    );
  }

  Widget transaksi() {
    return Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.topCenter,
          fit: StackFit.passthrough,
          children: [
            Container(
              padding: const EdgeInsets.only(
                  top: 40, left: 12, right: 12, bottom: 12),
              margin: const EdgeInsets.only(top: 32),
              height: 568,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: cWhite,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 1,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Text(
                    widget.ambulan.pasien,
                    style: GoogleFonts.poppins(
                      color: cBlack,
                      fontSize: 18,
                      fontWeight: semibold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Nama Pemesan:',
                        style: GoogleFonts.poppins(
                          color: c5,
                        ),
                      ),
                      Text(
                        widget.ambulan.pemesan,
                        style: GoogleFonts.poppins(
                          color: cBlack,
                          fontWeight: semibold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  MySeparator(color: c5),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Pukul Jemput:',
                        style: GoogleFonts.poppins(
                          color: c5,
                        ),
                      ),
                      Text(
                        widget.ambulan.pukul,
                        style: GoogleFonts.poppins(
                          color: cBlack,
                          fontWeight: semibold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Tanggal Jemput:',
                        style: GoogleFonts.poppins(
                          color: c5,
                        ),
                      ),
                      Text(
                        widget.ambulan.tanggal,
                        style: GoogleFonts.poppins(
                          color: cBlack,
                          fontWeight: semibold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),

                  // lokasi jemput
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Lokasi Jemput:',
                        style: GoogleFonts.poppins(
                          color: c5,
                        ),
                      ),
                      Text(
                        widget.ambulan.lokasiJemput,
                        style: GoogleFonts.poppins(
                          color: cBlack,
                          fontSize: 16,
                          fontWeight: bold,
                        ),
                      ),
                      const SizedBox(height: 8),

                      // lokasi antar
                      Text(
                        'Lokasi Antar:',
                        style: GoogleFonts.poppins(
                          color: c5,
                        ),
                      ),
                      Text(
                        widget.ambulan.lokasiAntar,
                        style: GoogleFonts.poppins(
                          color: cBlack,
                          fontSize: 16,
                          fontWeight: bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Modal Bottom Sheet
                  TextButton(
                    onPressed: () {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                        context: context,
                        builder: (BuildContext bc) {
                          final ambulan = widget.ambulan;
                          DateTime ambulanDate =
                              DateTime.parse(ambulan.created_at);
                          String ambulanFormattedDate =
                              DateFormat('dd MMMM yyyy').format(ambulanDate);
                          return Container(
                            height: 300,
                            decoration: BoxDecoration(
                              color: c3,
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(20),
                                topLeft: Radius.circular(20),
                              ),
                            ),
                            child: ListView(
                              physics: const ClampingScrollPhysics(),
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 20),
                                  child: Column(
                                    children: [
                                      Container(
                                        margin:
                                            const EdgeInsets.only(bottom: 12),
                                        width: 60,
                                        height: 6,
                                        decoration: BoxDecoration(
                                          color: Colors.white54,
                                          borderRadius:
                                              BorderRadius.circular(99),
                                        ),
                                      ),
                                      Text(
                                        'Detail Permintaan',
                                        style: GoogleFonts.poppins(
                                          color: cWhite,
                                          fontSize: 18,
                                          fontWeight: semibold,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(20),
                                  height: 300,
                                  decoration: BoxDecoration(
                                    color: cWhite,
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // nama pasien
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Nama Pasien:',
                                            style: GoogleFonts.poppins(
                                              color: cBlack,
                                            ),
                                          ),
                                          Text(
                                            ambulan.pasien,
                                            style: GoogleFonts.poppins(
                                              color: cBlack,
                                              fontSize: 16,
                                              fontWeight: bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 4),

                                      // nama pemesan
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Nama Pemesan:',
                                            style: GoogleFonts.poppins(
                                              color: cBlack,
                                            ),
                                          ),
                                          Text(
                                            ambulan.pemesan,
                                            style: GoogleFonts.poppins(
                                              color: cBlack,
                                              fontSize: 16,
                                              fontWeight: bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 4),

                                      // tanggal jemput
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Tanggal Jemput:',
                                            style: GoogleFonts.poppins(
                                              color: cBlack,
                                            ),
                                          ),
                                          Text(
                                            ambulan.tanggal,
                                            style: GoogleFonts.poppins(
                                              color: cBlack,
                                              fontSize: 16,
                                              fontWeight: bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 4),

                                      // pukul jemput
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Pukul Jemput:',
                                            style: GoogleFonts.poppins(
                                              color: cBlack,
                                            ),
                                          ),
                                          Text(
                                            ambulan.pukul,
                                            style: GoogleFonts.poppins(
                                              color: cBlack,
                                              fontSize: 16,
                                              fontWeight: bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 4),

                                      // berat badan
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Berat Badan:',
                                            style: GoogleFonts.poppins(
                                              color: cBlack,
                                            ),
                                          ),
                                          Text(
                                            ambulan.berat,
                                            style: GoogleFonts.poppins(
                                              color: cBlack,
                                              fontSize: 16,
                                              fontWeight: bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 4),

                                      // level darurat
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Level Darurat:',
                                            style: GoogleFonts.poppins(
                                              color: cBlack,
                                            ),
                                          ),
                                          Text(
                                            ambulan.darurat,
                                            style: GoogleFonts.poppins(
                                              color: cBlack,
                                              fontSize: 16,
                                              fontWeight: bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 4),

                                      // nomor permintaan
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Nomor Permintaan:',
                                            style: GoogleFonts.poppins(
                                              color: cBlack,
                                            ),
                                          ),
                                          Text(
                                            ambulan.id,
                                            style: GoogleFonts.poppins(
                                              color: cBlack,
                                              fontSize: 16,
                                              fontWeight: bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 4),

                                      // tanggal permintaan
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Tanggal Permintaan:',
                                            style: GoogleFonts.poppins(
                                              color: cBlack,
                                            ),
                                          ),
                                          Text(
                                            ambulanFormattedDate,
                                            style: GoogleFonts.poppins(
                                              color: cBlack,
                                              fontSize: 16,
                                              fontWeight: bold,
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
                  )
                ],
              ),
            ),
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                color: c2,
                borderRadius: BorderRadius.circular(999),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 1,
                    spreadRadius: 1,
                  ),
                ],
                image: const DecorationImage(
                  scale: 10,
                  image: AssetImage(
                    'assets/logos/logo_dermain4.png',
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
