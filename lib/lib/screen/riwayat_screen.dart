import 'package:flutter/material.dart';

class RiwayatPage extends StatelessWidget {
  const RiwayatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Riwayat Presensi',
        ),
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          RiwayatItem(
            mapel: 'Matematika',
            kelas: 'Kelas 10A',
            tanggal: '9 Oktober 2026',
            hadir: '30',
            izin: '1',
            sakit: '1',
            alpa: '0',
          ),

          RiwayatItem(
            mapel: 'Bahasa Indonesia',
            kelas: 'Kelas 10B',
            tanggal: '9 Oktober 2026',
            hadir: '29',
            izin: '1',
            sakit: '1',
            alpa: '1',
          ),

          RiwayatItem(
            mapel: 'Fisika',
            kelas: 'Kelas 11A',
            tanggal: '8 Oktober 2026',
            hadir: '31',
            izin: '1',
            sakit: '0',
            alpa: '0',
          ),

          RiwayatItem(
            mapel: 'Biologi',
            kelas: 'Kelas 11B',
            tanggal: '8 Oktober 2026',
            hadir: '28',
            izin: '2',
            sakit: '1',
            alpa: '1',
          ),

          RiwayatItem(
            mapel: 'Kimia',
            kelas: 'Kelas 12A',
            tanggal: '7 Oktober 2026',
            hadir: '30',
            izin: '1',
            sakit: '1',
            alpa: '0',
          ),

          RiwayatItem(
            mapel: 'Informatika',
            kelas: 'Kelas 12B',
            tanggal: '7 Oktober 2026',
            hadir: '32',
            izin: '0',
            sakit: '0',
            alpa: '0',
          ),
        ],
      ),
    );
  }
}

class RiwayatItem extends StatelessWidget {
  final String mapel;
  final String kelas;
  final String tanggal;
  final String hadir;
  final String izin;
  final String sakit;
  final String alpa;

  const RiwayatItem({
    super.key,
    required this.mapel,
    required this.kelas,
    required this.tanggal,
    required this.hadir,
    required this.izin,
    required this.sakit,
    required this.alpa,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(
        bottom: 10,
      ),
      child: ListTile(
        leading: const CircleAvatar(
          child: Icon(Icons.history),
        ),

        title: Text(
          mapel,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),

        subtitle: Text(
          '$kelas\n'
          '$tanggal\n'
          'Hadir: $hadir • '
          'Izin: $izin • '
          'Sakit: $sakit • '
          'Alpa: $alpa',
        ),

        isThreeLine: true,
      ),
    );
  }
}

