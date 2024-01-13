class Ambulan {
  final String id;
  final String title;
  final String pemesan;
  final String pasien;
  final String berat;
  final String darurat;
  final String tanggal;
  final String pukul;
  final String lokasiJemput;
  final String lokasiAntar;
  final String created_at;

  Ambulan({
    required this.id,
    required this.title,
    required this.pemesan,
    required this.pasien,
    required this.berat,
    required this.darurat,
    required this.tanggal,
    required this.pukul,
    required this.lokasiJemput,
    required this.lokasiAntar,
    required this.created_at,
  });
}
