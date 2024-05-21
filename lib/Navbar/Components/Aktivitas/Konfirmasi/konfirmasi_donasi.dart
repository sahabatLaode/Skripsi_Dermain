import 'package:dermain/Methods/zakat_method.dart';
import 'package:dermain/Models/zakat_model.dart';
import 'package:dermain/Reusable%20Components/Widget/custom_snackbar.dart';
import 'package:dermain/separator.dart';
import 'package:dermain/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

class KonfirmasiDonasi extends StatefulWidget {
  final Zakat zakat;

  const KonfirmasiDonasi({super.key, required this.zakat});

  @override
  State<KonfirmasiDonasi> createState() => _KonfirmasiDonasiState();
}

class _KonfirmasiDonasiState extends State<KonfirmasiDonasi> {
  bool isLoading = false;
  String peringatanTransfer =
      '*Segera lakukan transfer ke rekening Lazismu Banguntapan Selatan';

  final Map<String, Color> donationColors = {
    'Zakat': c1,
    'Infaq': c4,
    'Sedekah': c2,
  };
  final rekeningNumber = '00011122233344';
  final formatter =
      NumberFormat.currency(locale: 'id_ID', symbol: 'Rp', decimalDigits: 0);

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
          'Konfirmasi ${widget.zakat.jenis_donasi}',
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
            nomorRekening(),
            const Spacer(),
            tombol(),
          ],
        ),
      ),
    );
  }

  Widget transaksi() {
    return Column(
      children: [
        Text(
          formatter.format(widget.zakat.nominal),
          style: GoogleFonts.poppins(
            color: cBlack,
            fontSize: 32,
            fontWeight: bold,
          ),
        ),
        Text(
          widget.zakat.status,
          style: GoogleFonts.poppins(
            color: widget.zakat.status == 'Berhasil'
                ? donationColors[widget.zakat.jenis_donasi] ?? cWhite
                : Colors.red,
            fontSize: 16,
            fontWeight: semibold,
          ),
        ),
        const SizedBox(height: 32),
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
                    widget.zakat.nama,
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
                        'Nominal Transfer:',
                        style: GoogleFonts.poppins(
                          color: c5,
                        ),
                      ),
                      Text(
                        widget.zakat.nominal.toString(),
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
                        'Email:',
                        style: GoogleFonts.poppins(
                          color: c5,
                        ),
                      ),
                      Text(
                        widget.zakat.email,
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
                          final Zakat zakat = widget.zakat;
                          DateTime zakatDate = DateTime.parse(zakat.created_at);
                          String zakatFormattedDate =
                              DateFormat('dd MMMM yyyy').format(zakatDate);
                          return Container(
                            height: 300,
                            decoration: BoxDecoration(
                              color:
                                  donationColors[zakat.jenis_donasi] ?? cWhite,
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
                                        'Detail Transaksi',
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
                                            'Nominal Transfer:',
                                            style: GoogleFonts.poppins(
                                              color: cBlack,
                                            ),
                                          ),
                                          Text(
                                            formatter.format(zakat.nominal),
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
                                            'Jenis Transaksi:',
                                            style: GoogleFonts.poppins(
                                              color: cBlack,
                                            ),
                                          ),
                                          Text(
                                            zakat.jenis_donasi,
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
                                            'Nama:',
                                            style: GoogleFonts.poppins(
                                              color: cBlack,
                                            ),
                                          ),
                                          Text(
                                            zakat.nama,
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
                                            'Email:',
                                            style: GoogleFonts.poppins(
                                              color: cBlack,
                                            ),
                                          ),
                                          Text(
                                            zakat.email,
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
                                            'Telepon:',
                                            style: GoogleFonts.poppins(
                                              color: cBlack,
                                            ),
                                          ),
                                          Text(
                                            zakat.phone,
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
                                            'Nomor Transaksi:',
                                            style: GoogleFonts.poppins(
                                              color: cBlack,
                                            ),
                                          ),
                                          Text(
                                            zakat.id,
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
                                            'Tanggal Transaksi:',
                                            style: GoogleFonts.poppins(
                                              color: cBlack,
                                            ),
                                          ),
                                          Text(
                                            zakatFormattedDate,
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

  Widget nomorRekening() {
    final Zakat zakat = widget.zakat;
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(16),
          width: double.infinity,
          decoration: BoxDecoration(
            color: c6,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    rekeningNumber,
                    style: GoogleFonts.poppins(
                      color: cBlack,
                      fontWeight: bold,
                    ),
                  ),
                  Text(
                    'Bank Bantul',
                    style: GoogleFonts.poppins(
                      color: cBlack,
                      fontWeight: bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                'LazisMu Banguntapan Selatan',
                style: GoogleFonts.poppins(
                  color: c5,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: donationColors[zakat.jenis_donasi] ?? cWhite,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        Iconsax.copy,
                        color: cWhite,
                      ),
                    ),
                    onTap: () {
                      Clipboard.setData(
                        ClipboardData(text: rekeningNumber),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        CustomSnackBar(
                          message: 'Nomor rekening disalin ke clipboard',
                          icon: Iconsax.copy,
                          background:
                              donationColors[zakat.jenis_donasi] ?? cWhite,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
        Text(
          peringatanTransfer,
          style: GoogleFonts.poppins(
            color: widget.zakat.status == 'Berhasil' ? cWhite : Colors.red,
          ),
        ),
      ],
    );
  }

  Widget tombol() {
    final Zakat zakat = widget.zakat;
    return Container(
      margin: const EdgeInsets.only(top: 32),
      height: 60,
      width: double.infinity,
      child: TextButton(
        onPressed: () async {
          setState(() {
            isLoading = true;
          });
          // Panggil metode changeStatus
          bool success = await ZakatMethod.changeStatus(zakat.id, 'Berhasil');
          if (success) {
            setState(() {
              isLoading = false;
              widget.zakat.status = 'Berhasil';
            });
          } else {
            // Tampilkan pesan kesalahan jika permintaan gagal
            print('Failed to change status.');
          }
        },
        style: TextButton.styleFrom(
          backgroundColor: donationColors[zakat.jenis_donasi] ?? cWhite,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: isLoading
            ? CircularProgressIndicator(
                color: cWhite,
                backgroundColor: c6,
              )
            : Text(
                'Saya sudah transfer',
                style: GoogleFonts.poppins(
                  color: cWhite,
                  fontSize: 16,
                  fontWeight: semibold,
                ),
              ),
      ),
    );
  }
}
