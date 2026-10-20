import 'package:flutter/material.dart';

class RekapPage extends StatelessWidget {
  const RekapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Rekap Presensi',
        ),
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          RekapItem(
            mapel: 'Matematika',
            kelas: 'Kelas 10A',
            hadir: '29',
            izin: '1',
            sakit: '1',
            alpa: '1',
          ),

          RekapItem(
            mapel: 'Bahasa Indonesia',
            kelas: 'Kelas 10B',
            hadir: '28',
            izin: '2',
            sakit: '1',
            alpa: '1',
          ),

          RekapItem(
            mapel: 'Fisika',
            kelas: 'Kelas 11A',
            hadir: '30',
            izin: '1',
            sakit: '1',
            alpa: '0',
          ),

          RekapItem(
            mapel: 'Biologi',
            kelas: 'Kelas 11B',
            hadir: '27',
            izin: '2',
            sakit: '2',
            alpa: '1',
          ),

          RekapItem(
            mapel: 'Kimia',
            kelas: 'Kelas 12A',
            hadir: '29',
            izin: '1',
            sakit: '1',
            alpa: '1',
          ),

          RekapItem(
            mapel: 'Informatika',
            kelas: 'Kelas 12B',
            hadir: '31',
            izin: '1',
            sakit: '0',
            alpa: '0',
          ),
        ],
      ),
    );
  }
}

class RekapItem extends StatelessWidget {
  final String mapel;
  final String kelas;
  final String hadir;
  final String izin;
  final String sakit;
  final String alpa;

  const RekapItem({
    super.key,
    required this.mapel,
    required this.kelas,
    required this.hadir,
    required this.izin,
    required this.sakit,
    required this.alpa,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(
        bottom: 12,
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            Text(
              mapel,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 4),

            Text(
              kelas,
              style: const TextStyle(
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 14),

            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
              children: [
                _item('Hadir', hadir),
                _item('Izin', izin),
                _item('Sakit', sakit),
                _item('Alpa', alpa),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _item(
    String label,
    String value,
  ) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            fontSize: 11,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}