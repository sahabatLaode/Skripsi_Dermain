import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../theme.dart';

class Lazismu extends StatelessWidget {
  const Lazismu({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Image.asset(
            'assets/logos/logo_lazismu_bunga.png',
            height: 100,
          ),
        ),
        const SizedBox(height: 32),

        // Paragraf 1
        RichText(
          text: TextSpan(
            style: GoogleFonts.poppins(
              color: cBlack,
            ),
            children: [
              TextSpan(
                text: 'LAZISMU ',
                style: GoogleFonts.poppins(
                  fontWeight: bold,
                ),
              ),
              const TextSpan(
                text:
                    'adalah lembaga zakat tingkat nasional yang berkhidmat dalam pemberdayaan masyarakat melalui pendayagunaan secara produktif dana zakat, infaq, wakaf dan dana kedermawanan lainnya baik dari perseorangan, lembaga, perusahaan dan instansi lainnya.',
              ),
            ],
          ),
          textAlign: TextAlign.justify,
        ),
        const SizedBox(height: 16),

        // Paragraf 2
        Text(
          'Didirikan oleh PP. Muhammadiyah pada tahun 2002, selanjutnya dikukuhkan oleh Menteri Agama Republik Indonesia sebagai Lembaga Amil Zakat Nasional melalui SK No. 457/21 November 2002. Dengan telah berlakunya Undang-undang Zakat nomor 23 tahun 2011, Peraturan Pemerintah nomor 14 tahun 2014, dan Keputusan Mentri Agama Republik Indonesia nomor 333 tahun 2015. LAZISMU sebagai lembaga amil zakat nasional telah dikukuhkan kembali melalui SK Mentri Agama Republik Indonesia nomor 730 tahun 2016.',
          style: GoogleFonts.poppins(),
          textAlign: TextAlign.justify,
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
              color: cBlack,
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
              color: cBlack,
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
              color: cBlack,
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
    );
  }
}
