import 'package:dermain/Models/koinSurga_model.dart';
import 'package:dermain/separator.dart';
import 'package:dermain/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

class KonfirmasiKoinSurga extends StatefulWidget {
  final KoinSurga? koinSurga;

  const KonfirmasiKoinSurga({
    super.key,
    this.koinSurga,
  });

  @override
  State<KonfirmasiKoinSurga> createState() => _KonfirmasiKoinSurgaState();
}

class _KonfirmasiKoinSurgaState extends State<KonfirmasiKoinSurga> {
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
          'Konfirmasi Koin Surga',
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
            const SizedBox(height: 16),
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
              height: 221,
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
                    widget.koinSurga!.jenis_permintaan,
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
                        'Tanggal:',
                        style: GoogleFonts.poppins(
                          color: c5,
                        ),
                      ),
                      Text(
                        widget.koinSurga!.tanggal,
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
                        'Pukul:',
                        style: GoogleFonts.poppins(
                          color: c5,
                        ),
                      ),
                      Text(
                        widget.koinSurga!.pukul,
                        style: GoogleFonts.poppins(
                          color: cBlack,
                          fontWeight: semibold,
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
                          final koinSurga = widget.koinSurga;
                          DateTime koinSurgaDate =
                              DateTime.parse(koinSurga!.created_at);
                          String koinSurgaFormattedDate =
                              DateFormat('dd MMMM yyyy').format(koinSurgaDate);
                          return Container(
                            height: 300,
                            decoration: BoxDecoration(
                              color: c1,
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
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Jenis:',
                                            style: GoogleFonts.poppins(
                                              color: cBlack,
                                            ),
                                          ),
                                          Text(
                                            koinSurga.jenis_permintaan,
                                            style: GoogleFonts.poppins(
                                              color: cBlack,
                                              fontSize: 16,
                                              fontWeight: bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 4),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Catatan',
                                            style: GoogleFonts.poppins(
                                              color: cBlack,
                                            ),
                                          ),
                                          Text(
                                            koinSurga.catatan,
                                            style: GoogleFonts.poppins(
                                              color: cBlack,
                                              fontSize: 16,
                                              fontWeight: bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 4),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Tanggal:',
                                            style: GoogleFonts.poppins(
                                              color: cBlack,
                                            ),
                                          ),
                                          Text(
                                            koinSurga.tanggal,
                                            style: GoogleFonts.poppins(
                                              color: cBlack,
                                              fontSize: 16,
                                              fontWeight: bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 4),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Pukul:',
                                            style: GoogleFonts.poppins(
                                              color: cBlack,
                                            ),
                                          ),
                                          Text(
                                            koinSurga.pukul,
                                            style: GoogleFonts.poppins(
                                              color: cBlack,
                                              fontSize: 16,
                                              fontWeight: bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 4),
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
                                            koinSurga.id,
                                            style: GoogleFonts.poppins(
                                              color: cBlack,
                                              fontSize: 16,
                                              fontWeight: bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 4),
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
                                            koinSurgaFormattedDate,
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
                      backgroundColor: WidgetStatePropertyAll(c6),
                      fixedSize: const WidgetStatePropertyAll(
                        Size.fromHeight(50),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Detail permintaan',
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
