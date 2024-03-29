import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../theme.dart';

class PemesananButton extends StatefulWidget {
  final String titleAlert;
  final VoidCallback trueButton;
  final Color warnaButton;

  const PemesananButton({
    super.key,
    required this.titleAlert,
    required this.trueButton,
    required this.warnaButton,
  });

  @override
  State<PemesananButton> createState() => _PemesananButtonState();
}

class _PemesananButtonState extends State<PemesananButton> {
  bool isLoading = false;

  void buttonAlert() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          title: Text(
            widget.titleAlert,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 18,
            ),
          ),
          actionsAlignment: MainAxisAlignment.spaceBetween,
          actions: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 48,
                  width: 120,
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: widget.warnaButton,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      'Tidak',
                      style: GoogleFonts.poppins(
                        color: cWhite,
                        fontSize: 16,
                        fontWeight: semibold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                SizedBox(
                  height: 48,
                  width: 120,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/navbar');
                    },
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          style: BorderStyle.solid,
                          color: widget.warnaButton,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      'Ya',
                      style: GoogleFonts.poppins(
                        color: widget.warnaButton,
                        fontSize: 16,
                        fontWeight: semibold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // TOMBOL BATALKAN
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(right: 8),
            height: 60,
            child: TextButton(
              onPressed: () {
                buttonAlert();
              },
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    style: BorderStyle.solid,
                    color: widget.warnaButton,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Text(
                'Batalkan',
                style: GoogleFonts.poppins(
                  color: widget.warnaButton,
                  fontSize: 16,
                  fontWeight: semibold,
                ),
              ),
            ),
          ),
        ),

        // TOMBOL PESAN
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(left: 8),
            height: 56,
            child: TextButton(
              onPressed: widget.trueButton,
              style: TextButton.styleFrom(
                backgroundColor: widget.warnaButton,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: isLoading
                  ? CircularProgressIndicator(
                      color: cWhite,
                      backgroundColor: c6,
                    )
                  : Text(
                      'Pesan',
                      style: GoogleFonts.poppins(
                        color: cWhite,
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
