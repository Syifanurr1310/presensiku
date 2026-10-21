
class PresensiRecord {
  final String mapel;
  final String kelas;
  final DateTime tanggal;
  final Map<String, String> statusSiswa;

  PresensiRecord({
    required this.mapel,
    required this.kelas,
    required this.tanggal,
    required Map<String, String> statusSiswa,
  }) : statusSiswa = Map<String, String>.from(statusSiswa);

  int jumlah(String status) =>
      statusSiswa.values.where((s) => s == status).length;

  int get hadir => jumlah('Hadir');
  int get izin => jumlah('Izin');
  int get sakit => jumlah('Sakit');
  int get alpa => jumlah('Alpa');
}

class AttendanceStore {
  AttendanceStore._();

  static final List<PresensiRecord> records = [];

  static void simpan(PresensiRecord record) {
    records.insert(0, record);
  }
}
