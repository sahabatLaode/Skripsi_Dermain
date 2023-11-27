import 'package:dermain/separator.dart';
import 'package:dermain/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class Nota extends StatefulWidget {
  const Nota({super.key});

  @override
  State<Nota> createState() => _NotaState();
}

class _NotaState extends State<Nota> {
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
            Navigator.pushNamed(context, '/navbar');
          },
          icon: Icon(
            Icons.close,
            color: c1,
          ),
        ),
        centerTitle: true,
        title: Text(
          'Konfirmasi Zakat',
          style: GoogleFonts.poppins(
            color: c1,
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
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: Column(
          children: [
            transaksi(),
            const SizedBox(height: 16),
            detailTransaksi(),
            const SizedBox(height: 16),
            nomorRekening(),
            const Spacer(),
            tombol(),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget transaksi() {
    return Column(
      children: [
        Text(
          'Rp1.000.000',
          style: GoogleFonts.poppins(
            color: c1,
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
              padding: const EdgeInsets.only(top: 40, left: 12, right: 12),
              margin: const EdgeInsets.only(top: 32),
              height: 170,
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
                    'User Name',
                    style: GoogleFonts.poppins(
                      color: c1,
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
                          color: c3,
                        ),
                      ),
                      Text(
                        'Rp1000.000',
                        style: GoogleFonts.poppins(
                          color: c1,
                          fontWeight: semibold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  MySeparator(color: c3),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Email:',
                        style: GoogleFonts.poppins(
                          color: c3,
                        ),
                      ),
                      Text(
                        'lazismu@gmail.com',
                        style: GoogleFonts.poppins(
                          color: c1,
                          fontWeight: semibold,
                        ),
                      ),
                    ],
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
                  scale: 90,
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
        backgroundColor: c5,
        collapsedBackgroundColor: c5,
        childrenPadding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
        trailing: Icon(
          Iconsax.arrow_down_1,
          color: c1,
        ),
        title: Text(
          'Detail transaksi',
          style: GoogleFonts.poppins(
            color: c1,
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
                      color: c3,
                    ),
                  ),
                  Text(
                    'Rp1.000.000',
                    style: GoogleFonts.poppins(
                      color: c1,
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
                      color: c3,
                    ),
                  ),
                  Text(
                    'User Name',
                    style: GoogleFonts.poppins(
                      color: c1,
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
                      color: c3,
                    ),
                  ),
                  Text(
                    'lazismu@gmail.com',
                    style: GoogleFonts.poppins(
                      color: c1,
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
                      color: c3,
                    ),
                  ),
                  Text(
                    '12212112221',
                    style: GoogleFonts.poppins(
                      color: c1,
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
        color: c5,
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
                  color: c1,
                  fontWeight: bold,
                ),
              ),
              Text(
                'Bank Bantul',
                style: GoogleFonts.poppins(
                  color: c1,
                  fontWeight: bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            'LazisMu Banguntapan Selatan',
            style: GoogleFonts.poppins(
              color: c3,
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
                  color: c3,
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
                    color: c1,
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

  Widget tombol() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // TOMBOL BATALKAN
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(right: 8),
            height: 60,
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                backgroundColor: c2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Text(
                'Saya sudah transfer',
                style: GoogleFonts.poppins(
                  color: c1,
                  fontSize: 16,
                  fontWeight: semibold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
