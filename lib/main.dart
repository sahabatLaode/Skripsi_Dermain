import 'package:dermain/Navbar/Components/Layanan/Widget/Donasi/konfirmasi_donasi.dart';
import 'package:dermain/Navbar/Components/Layanan/Widget/Donasi/nota.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'Authentication/Sign In/sign_in.dart';
import 'Navbar/Components/Layanan/Widget/Donasi/donasi_infaq.dart';
import 'Navbar/Components/Layanan/Widget/Donasi/donasi_sedekah.dart';
import 'Navbar/Components/Layanan/Widget/Donasi/donasi_zakat.dart';
import 'Navbar/Components/Layanan/Widget/Permintaan Ambulans/permintaan_ambulan.dart';
import 'Navbar/Components/Layanan/Widget/Permintaan Koin/permintaan_koin_surga.dart';
import 'Navbar/Components/Layanan/layanan.dart';
import 'Navbar/navbar.dart';
import 'Onboarding/onboarding.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const SignIn(),
        '/onboarding': (context) => const Onboarding(),
        '/sign-in': (context) => const SignIn(),
        '/navbar': (context) => const Navbar(),
        '/donasiZakat': (context) => const DonasiZakat(),
        '/donasiInfaq': (context) => const DonasiInfaq(),
        '/donasiSedekah': (context) => const DonasiSedekah(),
        '/permintaanAmbulans': (context) => const PermintaanAmbulan(),
        '/permintaanKoin': (context) => const PermintaanKoin(),
        '/layanan': (context) => const Layanan(),
        '/nota': (context) => const Nota(),
        '/konfirmasi': (context) => const KonfirmasiDonasi(),
        // '/lokasi2': (context) => const Maps(),
      },
    );
  }
}
