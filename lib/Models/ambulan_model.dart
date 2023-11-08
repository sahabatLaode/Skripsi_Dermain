class Ambulan {
  final String id;
  final String nama_pemesan;
  final String nama_pasien;
  final String berat_badan;
  final String level_darurat;
  final String tanggal;
  final String pukul;
  final String titik_jemput;
  final String titik_antar;
  final String created_at;

  Ambulan({
    required this.id,
    required this.nama_pemesan,
    required this.nama_pasien,
    required this.berat_badan,
    required this.level_darurat,
    required this.tanggal,
    required this.pukul,
    required this.titik_jemput,
    required this.titik_antar,
    required this.created_at,
  });
}
