import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../theme.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(
      const Duration(seconds: 3),
      () {
        Navigator.pushNamedAndRemoveUntil(
            context, '/onboarding', (route) => false);
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: cBlack,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: cBlack,
          statusBarIconBrightness: Brightness.light,
        ),
        toolbarHeight: 0,
      ),
      backgroundColor: cBlack,
      body: Center(
        child: Image.asset(
          'assets/logos/logo_dermain3.png',
          height: 100,
        ),
      ),
    );
  }
}
