
import 'package:flutter/material.dart';
import '../attendance_store.dart';

const Color _burgundy = Color(0xFF701A32);
const Color _blush = Color(0xFFF6E3E8);

class RiwayatPage extends StatefulWidget {
  const RiwayatPage({super.key});

  @override
  State<RiwayatPage> createState() => _RiwayatPageState();
}

class _RiwayatPageState extends State<RiwayatPage> {
  String tanggalText(DateTime tanggal) {
    const bulan = [
      'Januari', 'Februari', 'Maret', 'April',
      'Mei', 'Juni', 'Juli', 'Agustus',
      'September', 'Oktober', 'November', 'Desember'
    ];

    return '${tanggal.day} ${bulan[tanggal.month - 1]} ${tanggal.year}';
  }

  @override
  Widget build(BuildContext context) {
    final records = AttendanceStore.records;

    return Scaffold(
      backgroundColor: const Color(0xFFFFF7F8),
      appBar: AppBar(
        title: const Text('Riwayat Presensi'),
        foregroundColor: _burgundy,
        backgroundColor: const Color(0xFFFFF7F8),
      ),
      body: records.isEmpty
          ? const Center(
              child: Padding(
                padding: EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.history, size: 54, color: _burgundy),
                    SizedBox(height: 12),
                    Text(
                      'Belum ada riwayat presensi',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: _burgundy,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      'Isi presensi siswa, lalu tekan Simpan Presensi.',
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
                  child: ExpansionTile(
                    leading: const CircleAvatar(
                      backgroundColor: _blush,
                      child: Icon(Icons.history, color: _burgundy),
                    ),
                    title: Text(
                      record.mapel,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: _burgundy,
                      ),
                    ),
                    subtitle: Text(
                      '${record.kelas} • ${tanggalText(record.tanggal)}\n'
                      'Hadir ${record.hadir} • Izin ${record.izin} • '
                      'Sakit ${record.sakit} • Alpa ${record.alpa}',
                    ),
                    children: [
                      const Divider(height: 1),
                      ...record.statusSiswa.entries.map(
                        (entry) => ListTile(
                          dense: true,
                          title: Text(entry.key),
                          trailing: Text(
                            entry.value,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: entry.value == 'Hadir'
                                  ? Colors.green.shade700
                                  : _burgundy,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
