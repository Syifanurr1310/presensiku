
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class PresensiRecord {
  final String mapel;
  final String kelas;
  final DateTime tanggal;
  final String namaGuru;
  final Map<String, String> statusSiswa;

  PresensiRecord({
    required this.mapel,
    required this.kelas,
    required this.tanggal,
    this.namaGuru = '',
    required Map<String, String> statusSiswa,
  }) : statusSiswa = Map<String, String>.from(statusSiswa);

  int jumlah(String status) =>
      statusSiswa.values.where((s) => s == status).length;

  int get hadir => jumlah('Hadir');
  int get izin => jumlah('Izin');
  int get sakit => jumlah('Sakit');
  int get alpa => jumlah('Alpa');

  Map<String, dynamic> toJson() => {
        'mapel': mapel,
        'kelas': kelas,
        'tanggal': tanggal.toIso8601String(),
        'namaGuru': namaGuru,
        'statusSiswa': statusSiswa,
      };

  factory PresensiRecord.fromJson(Map<String, dynamic> json) {
    return PresensiRecord(
      mapel: json['mapel'] as String? ?? '',
      kelas: json['kelas'] as String? ?? '',
      tanggal: DateTime.tryParse(
            json['tanggal'] as String? ?? '',
          ) ??
          DateTime.now(),
      namaGuru: json['namaGuru'] as String? ?? '',
      statusSiswa: Map<String, String>.from(
        (json['statusSiswa'] as Map?)?.map(
              (key, value) => MapEntry(
                key.toString(),
                value.toString(),
              ),
            ) ??
            <String, String>{},
      ),
    );
  }
}

class AttendanceStore {
  AttendanceStore._();

  static const String _storageKey = 'presensiku_attendance_v1';

  static final List<PresensiRecord> records = [];
  static bool _sudahDimuat = false;

  static Future<void> muat() async {
    if (_sudahDimuat) return;

    final prefs = await SharedPreferences.getInstance();
    final isi = prefs.getString(_storageKey);

    if (isi != null) {
      try {
        final decoded = jsonDecode(isi) as List<dynamic>;
        records
          ..clear()
          ..addAll(
            decoded.map(
              (item) => PresensiRecord.fromJson(
                Map<String, dynamic>.from(item as Map),
              ),
            ),
          );
      } catch (_) {
        // Data yang gagal dibaca tidak digunakan.
      }
    }

    _sudahDimuat = true;
  }

  static Future<void> simpan(PresensiRecord record) async {
    await muat();

    final index = records.indexWhere((lama) =>
        lama.mapel == record.mapel &&
        lama.kelas == record.kelas &&
        lama.tanggal.year == record.tanggal.year &&
        lama.tanggal.month == record.tanggal.month &&
        lama.tanggal.day == record.tanggal.day);

    if (index >= 0) {
      records[index] = record;
    } else {
      records.insert(0, record);
    }

    records.sort((a, b) => b.tanggal.compareTo(a.tanggal));

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      _storageKey,
      jsonEncode(records.map((item) => item.toJson()).toList()),
    );
  }
}
