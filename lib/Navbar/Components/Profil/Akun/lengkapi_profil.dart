import 'package:dermain/Navbar/Components/Profil/Akun/lengkapi_profil_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dermain/theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class LengkapiProfil extends StatelessWidget {
  const LengkapiProfil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cWhite,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: c1,
        ),
        backgroundColor: cWhite,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Iconsax.arrow_left,
            color: c1,
          ),
        ),
        centerTitle: true,
        title: Text(
          'Lengkapi Profil',
          style: GoogleFonts.poppins(
            color: c1,
            fontSize: 18,
            fontWeight: semibold,
          ),
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: cWhite,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          namaProfil(),
          emailProfil(),
          hpProfil(),
          ttl(),
          nik(),
          alamat(),
          golDarah(),
          ranting(),
          tombol(),
        ],
      ),
    );
  }

  Widget namaProfil() {
    return const LengkapiProfilItems(title: 'Nama Lengkap*');
  }

  Widget emailProfil() {
    return const LengkapiProfilItems(title: 'Email*');
  }

  Widget hpProfil() {
    return const LengkapiProfilItems(title: 'Nomor HP*');
  }

  Widget ttl() {
    return const LengkapiProfilItems(title: 'Tanggal Lahir*');
  }

  Widget nik() {
    return const LengkapiProfilItems(title: 'NIK*');
  }

  Widget alamat() {
    return const LengkapiProfilItems(title: 'Alamat*');
  }

  Widget golDarah() {
    return const LengkapiProfilItems(title: 'Golongan Darah*');
  }

  Widget ranting() {
    return const LengkapiProfilItems(title: 'Ranting*');
  }

  Widget tombol() {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 32,
      ),
      width: double.infinity,
      height: 56,
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          backgroundColor: c2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Text(
          'Simpan',
          style: TextStyle(
            color: c1,
            fontSize: 18,
            fontWeight: bold,
          ),
        ),
      ),
    );
  }
}
