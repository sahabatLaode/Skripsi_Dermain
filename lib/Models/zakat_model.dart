class Zakat {
  final String id;
  final String jenis_donasi;
  final int nominal;
  final String nama;
  final String email;
  final String phone;
  late String status;
  final String created_at;

  Zakat({
    required this.id,
    required this.jenis_donasi,
    required this.nominal,
    required this.nama,
    required this.email,
    required this.phone,
    required this.status,
    required this.created_at,
  });
}
