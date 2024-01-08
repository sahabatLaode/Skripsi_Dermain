import 'package:dermain/Models/zakat_model.dart';
import 'package:dermain/separator.dart';
import 'package:dermain/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class DetailPage extends StatefulWidget {
  final Zakat zakat;

  DetailPage({required this.zakat});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final rekeningNumber = '00011122233344';
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
            detailTransaksi(),
            const SizedBox(height: 16),
            nomorRekening(),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  Widget transaksi() {
    return Column(
      children: [
        Text(
          widget.zakat.nominal,
          style: GoogleFonts.poppins(
            color: cBlack,
            fontSize: 32,
            fontWeight: bold,
          ),
        ),
        Text(
          'Transaksi diperiksa',
          style: GoogleFonts.poppins(
            color: Colors.blue,
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
                        widget.zakat.nominal,
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
                  TextButton(
                    onPressed: () {},
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
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(c6),
                      fixedSize: MaterialStatePropertyAll(
                        Size.fromHeight(50),
                      ),
                    ),
                  ),
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

  Widget detailTransaksi() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: ExpansionTile(
        backgroundColor: c6,
        collapsedBackgroundColor: c6,
        childrenPadding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
        trailing: Icon(
          Iconsax.arrow_down_1,
          color: cBlack,
        ),
        title: Text(
          'Detail transaksi',
          style: GoogleFonts.poppins(
            color: cBlack,
          ),
        ),
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Nominal:',
                    style: GoogleFonts.poppins(
                      color: c5,
                    ),
                  ),
                  Text(
                    'Rp1.000.000',
                    style: GoogleFonts.poppins(
                      color: cBlack,
                      fontWeight: semibold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Nama:',
                    style: GoogleFonts.poppins(
                      color: c5,
                    ),
                  ),
                  Text(
                    'User Name',
                    style: GoogleFonts.poppins(
                      color: cBlack,
                      fontWeight: semibold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
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
                    'lazismu@gmail.com',
                    style: GoogleFonts.poppins(
                      color: cBlack,
                      fontWeight: semibold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Telepon:',
                    style: GoogleFonts.poppins(
                      color: c5,
                    ),
                  ),
                  Text(
                    '12212112221',
                    style: GoogleFonts.poppins(
                      color: cBlack,
                      fontWeight: semibold,
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget nomorRekening() {
    return Container(
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
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '20 Desember 2022',
                style: GoogleFonts.poppins(
                  color: c5,
                  fontSize: 12,
                ),
              ),
              InkWell(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: c2,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Iconsax.copy,
                    color: cBlack,
                  ),
                ),
                onTap: () {
                  Clipboard.setData(
                    ClipboardData(text: rekeningNumber),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
