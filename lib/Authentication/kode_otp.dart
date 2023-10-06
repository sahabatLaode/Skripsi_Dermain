import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

import '../route_animation.dart';
import '../theme.dart';

class KodeOtp extends StatefulWidget {
  const KodeOtp({super.key});

  @override
  State<KodeOtp> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<KodeOtp> {
  int start = 60;
  bool wait = false;
  String buttonName = 'Kirim ulang';

  void startTimer() {
    const onsec = Duration(seconds: 1);
    // ignore: unused_local_variable
    Timer timer = Timer.periodic(onsec, (timer) {
      if (start == 0) {
        setState(() {
          timer.cancel();
        });
      } else {
        setState(() {
          start--;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cWhite,
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
            color: c1,
          ),
        ),
        title: Text(
          'Kembali',
          style: GoogleFonts.poppins(
            color: c1,
            fontSize: 16,
          ),
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: cWhite,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          judul(),
          keterangan(),
          otpInput(),
          kirimUlang(),
          tombol(),
        ],
      ),
    );
  }

  Widget keterangan() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Kami sudah mengirimkan kode OTP ke email',
          style: GoogleFonts.poppins(
            color: c1,
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'lazism****@mail.com',
              style: GoogleFonts.poppins(
                color: c1,
                fontWeight: semibold,
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            InkWell(
              child: Text(
                'Ganti email?',
                style: GoogleFonts.poppins(
                  color: c1,
                  fontWeight: semibold,
                  decoration: TextDecoration.underline,
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/homeboarding');
              },
            ),
          ],
        ),
        const SizedBox(
          height: 24,
        ),
      ],
    );
  }

  Widget judul() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Kode OTP',
          style: GoogleFonts.poppins(
            color: c1,
            fontSize: 28,
            fontWeight: bold,
          ),
        ),
        const SizedBox(
          height: 12,
        ),
      ],
    );
  }

  Widget otpInput() {
    return Form(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // #1
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: c5,
              borderRadius: BorderRadius.circular(16),
            ),
            child: TextFormField(
              onChanged: (value) {
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus();
                }
              },
              onSaved: (pin1) {},
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: '0',
                hintStyle: GoogleFonts.poppins(
                  color: c3,
                  fontWeight: regular,
                ),
              ),
              style: GoogleFonts.poppins(
                color: c1,
                fontSize: 32,
                fontWeight: semibold,
              ),
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
          ),

          // #2
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: c5,
              borderRadius: BorderRadius.circular(16),
            ),
            child: TextFormField(
              onChanged: (value) {
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus();
                }
              },
              onSaved: (pin2) {},
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: '0',
                hintStyle: GoogleFonts.poppins(
                  color: c3,
                  fontWeight: regular,
                ),
              ),
              style: GoogleFonts.poppins(
                color: c1,
                fontSize: 32,
                fontWeight: semibold,
              ),
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
          ),

          // #3
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: c5,
              borderRadius: BorderRadius.circular(16),
            ),
            child: TextFormField(
              onChanged: (value) {
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus();
                }
              },
              onSaved: (pin3) {},
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: '0',
                hintStyle: GoogleFonts.poppins(
                  color: c3,
                  fontWeight: regular,
                ),
              ),
              style: GoogleFonts.poppins(
                color: c1,
                fontSize: 32,
                fontWeight: semibold,
              ),
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
          ),

          // #4
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: c5,
              borderRadius: BorderRadius.circular(16),
            ),
            child: TextFormField(
              onSaved: (pin4) {},
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: '0',
                hintStyle: GoogleFonts.poppins(
                  color: c3,
                  fontWeight: regular,
                ),
              ),
              style: GoogleFonts.poppins(
                color: c1,
                fontSize: 32,
                fontWeight: semibold,
              ),
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget kirimUlang() {
    return Container(
      margin: const EdgeInsets.only(
        top: 48,
      ),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Kirim ulang dalam ',
              style: GoogleFonts.poppins(
                color: c1,
              ),
            ),
            TextSpan(
              text: '00:$start',
              style: GoogleFonts.poppins(
                color: c1,
                fontSize: 16,
                fontWeight: semibold,
              ),
            ),
            TextSpan(
              text: ' detik',
              style: GoogleFonts.poppins(
                color: c1,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget tombol() {
    return Row(
      children: [
        // KIRIM ULANG
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(
              top: 350,
              right: 8,
            ),
            height: 56,
            child: TextButton(
              onPressed: () {
                // Navigator.pushNamed(
                //   context,
                //   '/reset-password',
                // );
              },
              style: TextButton.styleFrom(
                // backgroundColor: c2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: BorderSide(
                    color: c2,
                  ),
                ),
              ),
              child: Text(
                'Kirim ulang',
                style: GoogleFonts.poppins(
                  color: c1,
                  fontSize: 18,
                  fontWeight: semibold,
                ),
              ),
            ),
          ),
        ),

        // KONFIRMASI
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(
              top: 350,
              left: 8,
            ),
            height: 56,
            child: TextButton(
              onPressed: () {
                Navigator.of(context).push(signIn());
              },
              style: TextButton.styleFrom(
                backgroundColor: c2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    14,
                  ),
                ),
              ),
              child: Text(
                'Konfirmasi',
                style: GoogleFonts.poppins(
                  color: c1,
                  fontSize: 18,
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
