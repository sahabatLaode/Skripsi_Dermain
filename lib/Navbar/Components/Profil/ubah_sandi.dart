import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dermain/theme.dart';

class UbahSandi extends StatelessWidget {
  const UbahSandi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cWhite,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: cWhite,
        iconTheme: IconThemeData(
          color: cBlack,
        ),
        // centerTitle: true,
        // title: Text(
        //   'Ubah Kata Sandi',
        //   style: TextStyle(
        //     color: cBlack,
        //     fontSize: 18,
        //     fontWeight: medium,
        //   ),
        // ),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: cWhite,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              'Selamat Datang',
              style: TextStyle(
                fontSize: 28,
                fontWeight: semibold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
