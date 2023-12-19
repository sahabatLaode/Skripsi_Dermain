import 'package:dermain/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InformasiItems extends StatelessWidget {
  final String imageurl;
  final String title;
  final VoidCallback diTekan;

  const InformasiItems({
    super.key,
    required this.imageurl,
    required this.title,
    required this.diTekan,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        right: 16,
        bottom: 4,
      ),
      padding: const EdgeInsets.all(6),
      width: 280,
      height: 140,
      decoration: BoxDecoration(
        color: c6,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            spreadRadius: 0,
            offset: Offset(0, 3),
            blurStyle: BlurStyle.solid,
          ),
        ],
      ),
      child: InkWell(
        onTap: diTekan,
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Center(
                  child: SizedBox(
                    width: 120,
                    height: 120,
                    child: Image(
                      image: AssetImage(imageurl),
                      height: 80,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 180,
              width: 180,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: c2,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(14),
                  topRight: Radius.circular(130),
                  bottomLeft: Radius.circular(14),
                ),
              ),
              child: Row(
                children: [
                  Text(
                    title,
                    style: GoogleFonts.poppins(
                      color: cBlack,
                      fontSize: 16,
                      fontWeight: semibold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
