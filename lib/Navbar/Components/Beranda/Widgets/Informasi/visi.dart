import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../theme.dart';

class Visi extends StatefulWidget {
  const Visi({super.key});

  @override
  State<Visi> createState() => _VisiState();
}

class _VisiState extends State<Visi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cWhite,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
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
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: cWhite,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          bottom: 16,
        ),
        child: ListView(
          children: [
            Center(
              child: Image.asset(
                'assets/images/image_visi.png',
                height: 150,
              ),
            ),
            const SizedBox(height: 32),

            // Paragraf 1
            RichText(
              text: TextSpan(
                style: GoogleFonts.poppins(
                  color: c1,
                ),
                children: [
                  TextSpan(
                    text: 'VISI\n',
                    style: GoogleFonts.poppins(
                      fontWeight: bold,
                      fontSize: 16,
                    ),
                  ),
                  const TextSpan(
                    text: 'Menjadi Lembaga Amil Zakat Terpercaya.',
                  ),
                ],
              ),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 16),

            // Paragraf 2
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'MISI',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: bold,
                  ),
                ),

                // 1
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '1. ',
                      style: GoogleFonts.poppins(),
                    ),
                    const SizedBox(width: 3),
                    Expanded(
                      child: Text(
                        'Meningkatkan kualitas pengelolaan ZIS yang amanah, profesional, dan transparan.',
                        style: GoogleFonts.poppins(),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ],
                ),

                // 2
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '2.',
                      style: GoogleFonts.poppins(),
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        'Meningkatkan kualitas pengelolaan ZIS yang amanah, profesional, dan transparan.',
                        style: GoogleFonts.poppins(),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ],
                ),

                // 3
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '3.',
                      style: GoogleFonts.poppins(),
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        'Meningkatkan kualitas pengelolaan ZIS yang amanah, profesional, dan transparan.',
                        style: GoogleFonts.poppins(),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 16),

            // Paragraf 3
            Text(
              'Latar belakang berdirinya LAZISMU terdiri atas dua faktor. Pertama, fakta Indonesia yang berselimut dengan kemiskinan yang masih meluas, kebodohan dan indeks pembangunan manusia yang sangat rendah. Semuanya berakibat dan sekaligus disebabkan tatanan keadilan sosial yang lemah.',
              style: GoogleFonts.poppins(),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 16),

            // Paragraf 4
            Text(
              'Kedua, zakat diyakini mampu bersumbangsih dalam mendorong keadilan sosial, pembangunan manusia dan mampu mengentaskan kemiskinan. Sebagai negara berpenduduk muslim terbesar di dunia, Indonesia memiliki potensi zakat, infaq dan wakaf yang terbilang cukup tinggi. Namun, potensi yang ada belum dapat dikelola dan didayagunakan secara maksimal sehingga tidak memberi dampak yang signifikan bagi penyelesaian persoalan yang ada.',
              style: GoogleFonts.poppins(),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 16),

            // Paragraf 5
            Text(
              'Berdirinya LAZISMU dimaksudkan sebagai institusi pengelola zakat dengan manajemen modern yang dapat menghantarkan zakat menjadi bagian dari penyelesai masalah (problem solver) sosial masyarakat yang terus berkembang.',
              style: GoogleFonts.poppins(),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 16),

            // Paragraf 6
            Text(
              'Dengan budaya kerja amanah, professional dan transparan, LAZISMU berusaha mengembangkan diri menjadi Lembaga Zakat terpercaya. Dan seiring waktu, kepercayaan publik semakin menguat.',
              style: GoogleFonts.poppins(),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 16),

            // Paragraf 7
            Text(
              'Dengan spirit kreatifitas dan inovasi, LAZISMU senantiasa menproduksi program-program pendayagunaan yang mampu menjawab tantangan perubahan dan problem sosial masyarakat yang berkembang.',
              style: GoogleFonts.poppins(),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 16),

            // Paragraf 8
            Text(
              'Saat ini, LAZISMU telah tersebar hampir di seluruh Indonesia yang menjadikan program-program pendayagunaan mampu menjangkau seluruh wilayah secara cepat, fokus dan tepat sasaran.',
              style: GoogleFonts.poppins(),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 16),

            // Kemiskinan
            RichText(
              text: TextSpan(
                style: GoogleFonts.poppins(
                  color: c1,
                ),
                children: [
                  TextSpan(
                    text: '1. KEMISKINAN\n',
                    style: GoogleFonts.poppins(
                      fontWeight: bold,
                      fontSize: 16,
                    ),
                  ),
                  const TextSpan(
                    text:
                        'Indonesia yang berselimut dengan kemiskinan yang masih meluas, kebodohan dan indeks pembangunan manusia yang sangat rendah.',
                  ),
                ],
              ),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 16),

            // Sumbangsih
            RichText(
              text: TextSpan(
                style: GoogleFonts.poppins(
                  color: c1,
                ),
                children: [
                  TextSpan(
                    text: '2. SUMBANGSIH\n',
                    style: GoogleFonts.poppins(
                      fontWeight: bold,
                      fontSize: 16,
                    ),
                  ),
                  const TextSpan(
                    text:
                        'Zakat diyakini mampu bersumbangsih dalam mendorong keadilan sosial.',
                  ),
                ],
              ),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 16),

            // Problem Solver
            RichText(
              text: TextSpan(
                style: GoogleFonts.poppins(
                  color: c1,
                ),
                children: [
                  TextSpan(
                    text: '3. PROBLEM SOLVER\n',
                    style: GoogleFonts.poppins(
                      fontWeight: bold,
                      fontSize: 16,
                    ),
                  ),
                  const TextSpan(
                    text:
                        'Berdirinya LAZISMU dimaksudkan sebagai institusi pengelola zakat dengan manajemen modern yang dapat menghantarkan zakat menjadi bagian dari penyelesai masalah.',
                  ),
                ],
              ),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
