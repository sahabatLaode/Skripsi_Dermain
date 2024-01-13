import 'package:dermain/Models/zakat_model.dart';
import 'package:dermain/theme.dart';
import 'package:flutter/material.dart';

class DetailPermintaan {
  final Zakat? zakat;
  final Map<String, Color> donationColors = {
    'Zakat': c1,
    'Infaq': c4,
    'Sedekah': c2,
  };

  DetailPermintaan(this.zakat);

  void moreModalBottomSheet(context) {
    Size size = MediaQuery.of(context).size;
    showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40.0),
      ),
      context: context,
      builder: (BuildContext bc) {
        return Container(
          height: size.height * 0.5,
          decoration: BoxDecoration(
            color: donationColors[zakat?.jenis_donasi] ?? cWhite,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: ListView(
              physics: const ClampingScrollPhysics(),
              children: const [
                //content of modal bottomsheet
              ],
            ),
          ),
        );
      },
    );
  }
}