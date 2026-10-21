
import 'package:flutter/material.dart';
import '../attendance_store.dart';

const Color _burgundy = Color(0xFF701A32);
const Color _blush = Color(0xFFF6E3E8);
const Color _background = Color(0xFFFFF7F8);

class RekapPage extends StatelessWidget {
  const RekapPage({super.key});

  String tanggalText(DateTime tanggal) {
    const bulan = [
      'Januari',
      'Februari',
      'Maret',
      'April',
      'Mei',
      'Juni',
      'Juli',
      'Agustus',
      'September',
      'Oktober',
      'November',
      'Desember',
    ];

    return '${tanggal.day} ${bulan[tanggal.month - 1]} ${tanggal.year}';
  }

  @override
  Widget build(BuildContext context) {
    final records = AttendanceStore.records;

    return Scaffold(
      backgroundColor: _background,
      appBar: AppBar(
        title: const Text('Rekap Presensi'),
        foregroundColor: _burgundy,
        backgroundColor: _background,
      ),
      body: records.isEmpty
          ? const Center(
              child: Padding(
                padding: EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.assessment_outlined,
                      size: 56,
                      color: _burgundy,
                    ),
                    SizedBox(height: 12),
                    Text(
                      'Belum ada rekap presensi',
                      style: TextStyle(
                        color: _burgundy,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Silakan isi dan simpan presensi siswa terlebih dahulu.',
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: records.length,
              itemBuilder: (context, index) {
                final record = records[index];

                return Card(
                  color: Colors.white,
                  margin: const EdgeInsets.only(bottom: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                    side: const BorderSide(color: _blush),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          record.mapel,
                          style: const TextStyle(
                            color: _burgundy,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          '${record.kelas} • ${tanggalText(record.tanggal)}',
                          style: const TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(height: 18),
                        Row(
                          children: [
                            _RekapAngka(
                              label: 'Hadir',
                              jumlah: record.hadir,
                              warna: Colors.green.shade700,
                            ),
                            _RekapAngka(
                              label: 'Izin',
                              jumlah: record.izin,
                              warna: Colors.orange.shade800,
                            ),
                            _RekapAngka(
                              label: 'Sakit',
                              jumlah: record.sakit,
                              warna: Colors.blue.shade700,
                            ),
                            _RekapAngka(
                              label: 'Alpa',
                              jumlah: record.alpa,
                              warna: _burgundy,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}

class _RekapAngka extends StatelessWidget {
  final String label;
  final int jumlah;
  final Color warna;

  const _RekapAngka({
    required this.label,
    required this.jumlah,
    required this.warna,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(
            '$jumlah',
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
              color: warna,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
