import 'package:flutter/material.dart';

class TombolPrimer extends StatefulWidget {
  final String title;
  // final VoidCallback ditekan;
  const TombolPrimer(
      {super.key,
      required this.title,
      // required this.ditekan,
      required TextButton child});

  @override
  State<TombolPrimer> createState() => _TombolPrimerState();
}

class _TombolPrimerState extends State<TombolPrimer> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 32),
      height: 60,
      width: double.infinity,
    );
  }
}
