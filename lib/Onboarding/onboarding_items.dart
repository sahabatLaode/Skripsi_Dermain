import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme.dart';

class OnboardingItems extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;

  const OnboardingItems(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // const SizedBox(height: 44),
        Image.asset(
          imageUrl,
          height: 268,
        ),
        const SizedBox(
          height: 44,
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            color: cBlack,
            fontSize: 28,
            fontWeight: bold,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            color: cBlack,
          ),
        ),
      ],
    );
  }
}
