import 'package:dermain/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';

class LokasiForm extends StatefulWidget {
  final String title;
  final String hint;
  final Color color;
  final IconData iconData;
  final TextEditingController controller;

  const LokasiForm(
      {super.key,
      required this.title,
      required this.hint,
      required this.color,
      required this.controller,
      required this.iconData});

  @override
  State<LokasiForm> createState() => _LokasiFormState();
}

class _LokasiFormState extends State<LokasiForm> {
  String address = '';
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: GoogleFonts.poppins(
            color: cBlack,
            fontSize: 12,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 6),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          height: 100,
          decoration: BoxDecoration(
            color: c6,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              Icon(
                // Iconsax.map_14,
                widget.iconData,
                color: widget.color,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: TextFormField(
                  enabled: false,
                  controller: widget.controller,
                  maxLines: 3,
                  textAlign: TextAlign.left,
                  style: GoogleFonts.poppins(
                    color: cBlack,
                    fontSize: 16,
                  ),
                  decoration: InputDecoration.collapsed(
                    hintText: widget.hint,
                    hintStyle: GoogleFonts.poppins(
                      color: c5,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        if (widget.controller.text.isEmpty || widget.controller.text == '')
          Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Text(
              'Tentukan lokasi',
              style: GoogleFonts.poppins(
                color: cRed,
              ),
            ),
          ),

        // map
        ClipRRect(
          borderRadius:
              BorderRadius.circular(12), // Atur radius sesuai kebutuhan Anda
          child: ExpansionTile(
            collapsedBackgroundColor: c6,
            title: Text(
              'Buka peta',
              style: GoogleFonts.poppins(
                color: cBlack,
              ),
            ),
            children: [
              SizedBox(
                height: 350,
                child: OpenStreetMapSearchAndPick(
                  buttonColor: widget.color,
                  buttonText: 'Tetapkan lokasi',
                  buttonTextStyle: GoogleFonts.poppins(
                    color: cWhite,
                    fontSize: 16,
                  ),
                  zoomInIcon: Iconsax.search_zoom_in,
                  zoomOutIcon: Iconsax.search_zoom_out_1,
                  currentLocationIcon: Iconsax.gps,
                  locationPinIcon: Iconsax.location5,
                  locationPinIconColor: widget.color,
                  locationPinText: 'Pilih lokasi',
                  locationPinTextStyle: GoogleFonts.poppins(
                    color: widget.color,
                    fontWeight: semibold,
                  ),
                  onPicked: (pickedData) {
                    setState(() {
                      address = pickedData.addressName;
                      widget.controller.text = address;
                    });
                    print(pickedData.latLong.latitude);
                    print(pickedData.latLong.longitude);
                    print(pickedData.address);
                  },
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
