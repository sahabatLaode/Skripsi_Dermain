import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dermain/theme.dart';

class SyaratKetentuan extends StatelessWidget {
  const SyaratKetentuan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        elevation: 0.5,
        backgroundColor: cWhite,
        iconTheme: IconThemeData(
          color: c1,
        ),
        centerTitle: true,
        title: Text(
          'Syarat dan Ketentuan',
          style: TextStyle(
            color: c1,
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: cWhite,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      body: const Center(
        child: Text('Hello'),
      ),
    );
  }
}
