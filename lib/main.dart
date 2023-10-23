import 'package:flutter/material.dart';
import 'Authentication/sign_in.dart';
import 'Navbar/Components/Layanan/Widget/Donasi/donasi_infaq.dart';
import 'Navbar/Components/Layanan/Widget/Donasi/donasi_sedekah.dart';
import 'Navbar/Components/Layanan/Widget/Donasi/donasi_zakat.dart';
import 'Navbar/Components/Layanan/Widget/Permintaan Ambulans/permintaan_ambulan.dart';
import 'Navbar/Components/Layanan/Widget/Permintaan Koin/permintaan_koin_surga.dart';
import 'Navbar/Components/Layanan/layanan.dart';
import 'Navbar/navbar.dart';
import 'Onboarding/onboarding.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(const MyApp());
  // await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const Navbar(),
        '/onboarding': (context) => const Onboarding(),
        '/sign-in': (context) => const SignIn(),
        '/navbar': (context) => const Navbar(),
        '/donasiZakat': (context) => const DonasiZakat(),
        '/donasiInfaq': (context) => const DonasiInfaq(),
        '/donasiSedekah': (context) => const DonasiSedekah(),
        '/permintaanAmbulans': (context) => const PermintaanAmbulan(),
        '/permintaanKoin': (context) => const PermintaanKoin(),
        '/layanan': (context) => const Layanan(),
      },
    );
  }
}
