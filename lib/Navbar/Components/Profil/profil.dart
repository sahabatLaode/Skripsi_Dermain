import 'package:dermain/Methods/auth_method.dart';
import 'package:dermain/route_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dermain/theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:dermain/globals.dart' as globals;

class Profil extends StatefulWidget {
  const Profil({super.key});

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  String userName = "";
  String emailUser = "";
  bool isLoading = false;

  @override
  void initState() {
    loadUserData(); // Panggil fungsi untuk mengambil data pengguna yang sudah login
    super.initState();
  }

  void loadUserData() async {
    try {
      final user = await AuthMethod.getUserData();
      print('User: $user');
      if (user != null) {
        setState(() {
          userName = user.name;
          emailUser = user.email;
        });
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cWhite,
      appBar: AppBar(
        toolbarHeight: 0,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: c2,
          statusBarIconBrightness: Brightness.light,
        ),
      ),
      body: Column(
        children: [
          akun(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: dataDiri(),
          ),
          const Spacer(),
          logout(),
        ],
      ),
    );
  }

  Widget akun() {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          padding: const EdgeInsets.only(bottom: 40),
          width: double.infinity,
          height: 150,
          color: c2,
          child: Image.asset(
            'assets/logos/logo_dermain2.png',
            scale: 18,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 100),
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: c2,
                borderRadius: BorderRadius.circular(100),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 2,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Icon(
                Iconsax.user4,
                color: cWhite,
                size: 50,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget dataDiri() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // nama
        Text(
          'Nama',
          style: GoogleFonts.poppins(),
        ),
        Container(
          margin: const EdgeInsets.only(top: 6),
          padding: const EdgeInsets.all(16),
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
            color: c6,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            userName,
            style: GoogleFonts.poppins(
              color: cBlack,
              fontSize: 18,
            ),
          ),
        ),

        const SizedBox(height: 20),

        //   email
        Text(
          'Email',
          style: GoogleFonts.poppins(),
        ),
        Container(
          margin: const EdgeInsets.only(top: 6),
          padding: const EdgeInsets.all(16),
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
            color: c6,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            emailUser,
            style: GoogleFonts.poppins(
              color: cBlack,
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }

  Widget logout() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextButton(
        onPressed: () async {
          bool status = await AuthMethod.logout();
          if (status) {
            setState(() {
              globals.isLogin = false;
              globals.token = '';
              isLoading = true;
            });
          }
          Future.delayed(const Duration(seconds: 2), () {
            setState(() {
              isLoading = false;
            });
            if (!mounted) return;
            Navigator.of(context).push(signIn());
          });
        },
        style: TextButton.styleFrom(
          backgroundColor: c2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          fixedSize: const Size(double.maxFinite, 60),
        ),
        child: isLoading
            ? CircularProgressIndicator(
                color: cWhite,
                backgroundColor: c6,
              )
            : Text(
                'Keluar',
                style: GoogleFonts.poppins(
                  color: cWhite,
                  fontSize: 16,
                  fontWeight: semibold,
                ),
              ),
      ),
    );
  }
}
