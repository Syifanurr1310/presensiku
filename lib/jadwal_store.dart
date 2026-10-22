
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

// ================= DATA GURU =================

class DataGuru {
  final String id;
  final String nama;
  final String nip;
  final String mapel;

  DataGuru({
    required this.id,
    required this.nama,
    required this.nip,
    required this.mapel,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'nama': nama,
        'nip': nip,
        'mapel': mapel,
      };

  factory DataGuru.fromJson(Map<String, dynamic> json) {
    return DataGuru(
      id: json['id'] as String,
      nama: json['nama'] as String,
      nip: (json['nip'] ?? '') as String,
      mapel: (json['mapel'] ?? '') as String,
    );
  }
}

class GuruStore {
  static const String _key = 'presensiku_guru_v1';

  static Future<List<DataGuru>> ambilSemua() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_key);

    if (data == null || data.isEmpty) return [];

    try {
      final decoded = jsonDecode(data) as List<dynamic>;
      return decoded
          .map((item) => DataGuru.fromJson(
                Map<String, dynamic>.from(item as Map),
              ))
          .toList();
    } catch (_) {
      return [];
    }
  }

  static Future<bool> simpanSemua(List<DataGuru> daftar) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString(
      _key,
      jsonEncode(daftar.map((guru) => guru.toJson()).toList()),
    );
  }

  static Future<bool> tambah(DataGuru guru) async {
    final daftar = await ambilSemua();
    daftar.add(guru);
    return simpanSemua(daftar);
  }

  static Future<bool> ubah(DataGuru guru) async {
    final daftar = await ambilSemua();
    final index = daftar.indexWhere((item) => item.id == guru.id);

    if (index == -1) return false;

    daftar[index] = guru;
    return simpanSemua(daftar);
  }

  static Future<bool> hapus(String id) async {
    final daftar = await ambilSemua();
    daftar.removeWhere((guru) => guru.id == id);
    return simpanSemua(daftar);
  }
}

// ================= DATA JADWAL =================

class JadwalPelajaran {
  final String id;
  final String hari;
  final String kelas;
  final String mataPelajaran;
  final String namaGuru;
  final int jamKe;
  final String jamMulai;
  final String jamSelesai;

  JadwalPelajaran({
    required this.id,
    required this.hari,
    required this.kelas,
    required this.mataPelajaran,
    required this.namaGuru,
    required this.jamKe,
    required this.jamMulai,
    required this.jamSelesai,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'hari': hari,
        'kelas': kelas,
        'mataPelajaran': mataPelajaran,
        'namaGuru': namaGuru,
        'jamKe': jamKe,
        'jamMulai': jamMulai,
        'jamSelesai': jamSelesai,
      };

  factory JadwalPelajaran.fromJson(Map<String, dynamic> json) {
    return JadwalPelajaran(
      id: json['id'] as String,
      hari: json['hari'] as String,
      kelas: json['kelas'] as String,
      mataPelajaran: json['mataPelajaran'] as String,
      namaGuru: (json['namaGuru'] ?? 'Belum diisi') as String,
      jamKe: (json['jamKe'] as num).toInt(),
      jamMulai: json['jamMulai'] as String,
      jamSelesai: json['jamSelesai'] as String,
    );
  }
}

class JadwalStore {
  static const String _key = 'presensiku_jadwal_v1';

  static Future<List<JadwalPelajaran>> ambilSemua() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_key);

    if (data == null || data.isEmpty) return [];

    try {
      final decoded = jsonDecode(data) as List<dynamic>;
      return decoded
          .map((item) => JadwalPelajaran.fromJson(
                Map<String, dynamic>.from(item as Map),
              ))
          .toList();
    } catch (_) {
      return [];
    }
  }

  static Future<bool> simpanSemua(
    List<JadwalPelajaran> jadwal,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString(
      _key,
      jsonEncode(jadwal.map((item) => item.toJson()).toList()),
    );
  }

  static Future<void> buatContohJikaKosong() async {
    final prefs = await SharedPreferences.getInstance();
    final dataLama = prefs.getString(_key);

    // Pertahankan jadwal yang sudah tersimpan.
    if (dataLama != null && dataLama.isNotEmpty) return;

    const hariList = [
      'Senin', 'Selasa', 'Rabu', 'Kamis', 'Jumat', 'Sabtu'
    ];
    const kelasList = [
      'Kelas 10A', 'Kelas 10B',
      'Kelas 11A', 'Kelas 11B',
      'Kelas 12A', 'Kelas 12B',
    ];
    const mapel = [
      'Matematika',
      'Bahasa Indonesia',
      'Bahasa Inggris',
      'Pendidikan Agama',
      'Informatika',
      'Sejarah',
      'Fisika',
      'Kimia',
      'Biologi',
      'PJOK',
    ];
    const waktuMulai = [
      '07:00', '07:45', '08:30', '09:30', '10:15',
      '11:00', '12:45', '13:30', '14:15', '15:00',
    ];
    const waktuSelesai = [
      '07:45', '08:30', '09:15', '10:15', '11:00',
      '11:45', '13:30', '14:15', '15:00', '15:45',
    ];

    final daftar = <JadwalPelajaran>[];

    for (final kelas in kelasList) {
      for (var h = 0; h < hariList.length; h++) {
        final jumlahJam = h == 4 ? 6 : 8;

        for (var j = 0; j < jumlahJam; j++) {
          final indexMapel =
              (h * 3 + j + kelasList.indexOf(kelas)) % mapel.length;

          daftar.add(
            JadwalPelajaran(
              id: '${kelas}_${h}_$j',
              hari: hariList[h],
              kelas: kelas,
              mataPelajaran: mapel[indexMapel],
              namaGuru: 'Guru ${mapel[indexMapel]}',
              jamKe: j + 1,
              jamMulai: waktuMulai[j],
              jamSelesai: waktuSelesai[j],
            ),
          );
        }
      }
    }

    await simpanSemua(daftar);
  }

  static Future<bool> tambah(JadwalPelajaran jadwal) async {
    final daftar = await ambilSemua();
    daftar.add(jadwal);
    return simpanSemua(daftar);
  }

  static Future<bool> ubah(JadwalPelajaran jadwal) async {
    final daftar = await ambilSemua();
    final index = daftar.indexWhere((item) => item.id == jadwal.id);

    if (index == -1) return false;

    daftar[index] = jadwal;
    return simpanSemua(daftar);
  }

  static Future<bool> hapus(String id) async {
    final daftar = await ambilSemua();
    daftar.removeWhere((item) => item.id == id);
    return simpanSemua(daftar);
  }
}
