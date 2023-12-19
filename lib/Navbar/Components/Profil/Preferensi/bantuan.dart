import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dermain/theme.dart';

class Bantuan extends StatelessWidget {
  const Bantuan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        elevation: 0.5,
        backgroundColor: cWhite,
        iconTheme: IconThemeData(
          color: cBlack,
        ),
        centerTitle: true,
        title: Text(
          'Bantuan',
          style: TextStyle(
            color: cBlack,
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
