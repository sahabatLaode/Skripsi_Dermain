import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../route_animation.dart';
import '../theme.dart';
import 'onboarding_items.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cWhite,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: cWhite,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: cWhite,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: CarouselSlider(
                items: const [
                  OnboardingItems(
                    imageUrl: 'assets/images/image_splash1.png',
                    title: 'Salurkan Zakat, Infaq dan Sedekahmu',
                    subtitle:
                        'Dengan mulai berdonasi, anda telah ikut serta dalam mengentaskan kemiskinan',
                  ),
                  OnboardingItems(
                    imageUrl: 'assets/images/image_splash2.png',
                    title: 'Pesan Ambulan LazisMu Dengan Cepat',
                    subtitle:
                        'Layanan ambulan yang siap melayani masyarakat banguntapan selatan',
                  ),
                  OnboardingItems(
                    imageUrl: 'assets/images/image_splash3.png',
                    title: 'Baca Berita Bisa Langsung Donasi',
                    subtitle:
                        'Donasi bencana, pendidikan dan kegiatan sosial langsung  lewat berita',
                  ),
                ],
                options: CarouselOptions(
                    height: double.infinity,
                    viewportFraction: 1,
                    initialPage: currentIndex,
                    onPageChanged: (index, _) {
                      setState(() {
                        currentIndex = index;
                      });
                    }),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: currentIndex == 0 ? cBlack : c4,
                  ),
                ),
                const SizedBox(width: 16),
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: currentIndex == 1 ? cBlack : c4,
                  ),
                ),
                const SizedBox(width: 16),
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: currentIndex == 2 ? cBlack : c4,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 133),

            // TOMBOL
            Container(
              margin: const EdgeInsets.only(bottom: 12),
              width: double.infinity,
              height: 56,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).push(signIn());
                },
                style: TextButton.styleFrom(
                  backgroundColor: c2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Text(
                  'Mulai Donasi',
                  style: GoogleFonts.poppins(
                    color: cWhite,
                    fontSize: 18,
                    fontWeight: semibold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 42),
          ],
        ),
      ),
    );
  }
}
