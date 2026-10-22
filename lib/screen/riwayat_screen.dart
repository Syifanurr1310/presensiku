
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
  DateTime? tanggalFilter;
  String kelasFilter = 'Semua Kelas';

  String tanggalText(DateTime tanggal) {
    const bulan = [
      'Januari', 'Februari', 'Maret', 'April',
      'Mei', 'Juni', 'Juli', 'Agustus',
      'September', 'Oktober', 'November', 'Desember',
    ];

    return '${tanggal.day} ${bulan[tanggal.month - 1]} ${tanggal.year}';
  }

  Future<void> pilihTanggal() async {
    final hasil = await showDatePicker(
      context: context,
      initialDate: tanggalFilter ?? DateTime.now(),
      firstDate: DateTime(2025),
      lastDate: DateTime(2035),
    );

    if (hasil != null && mounted) {
      setState(() {
        tanggalFilter = DateTime(hasil.year, hasil.month, hasil.day);
      });
    }
  }

  bool tanggalSama(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;

  @override
  Widget build(BuildContext context) {
    final semuaRecords = [...AttendanceStore.records]
      ..sort((a, b) => b.tanggal.compareTo(a.tanggal));

    final kelasList = semuaRecords.map((r) => r.kelas).toSet().toList()
      ..sort();

    final records = semuaRecords.where((record) {
      final cocokKelas =
          kelasFilter == 'Semua Kelas' || record.kelas == kelasFilter;

      final cocokTanggal = tanggalFilter == null ||
          tanggalSama(record.tanggal, tanggalFilter!);

      return cocokKelas && cocokTanggal;
    }).toList();

    final tanggalUnik = records
        .map((r) => DateTime(
              r.tanggal.year,
              r.tanggal.month,
              r.tanggal.day,
            ))
        .toSet()
        .toList()
      ..sort((a, b) => b.compareTo(a));

    final totalHadir = records.fold<int>(0, (sum, r) => sum + r.hadir);
    final totalTidakHadir =
        records.fold<int>(0, (sum, r) => sum + r.izin + r.sakit + r.alpa);

    return Scaffold(
      backgroundColor: const Color(0xFFFFF7F8),
      appBar: AppBar(
        title: const Text('Riwayat Presensi'),
        foregroundColor: _burgundy,
        backgroundColor: const Color(0xFFFFF7F8),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: pilihTanggal,
                        icon: const Icon(Icons.calendar_month),
                        label: Text(
                          tanggalFilter == null
                              ? 'Semua Tanggal'
                              : tanggalText(tanggalFilter!),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    if (tanggalFilter != null)
                      IconButton(
                        tooltip: 'Hapus filter tanggal',
                        onPressed: () =>
                            setState(() => tanggalFilter = null),
                        icon: const Icon(Icons.close),
                      ),
                  ],
                ),
                const SizedBox(height: 8),
                DropdownButtonFormField<String>(
                  initialValue: kelasFilter,
                  decoration: const InputDecoration(
                    labelText: 'Filter Kelas',
                    border: OutlineInputBorder(),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  ),
                  items: [
                    const DropdownMenuItem(
                      value: 'Semua Kelas',
                      child: Text('Semua Kelas'),
                    ),
                    ...kelasList.map(
                      (kelas) => DropdownMenuItem(
                        value: kelas,
                        child: Text(kelas),
                      ),
                    ),
                  ],
                  onChanged: (value) {
                    if (value != null) {
                      setState(() => kelasFilter = value);
                    }
                  },
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: _Ringkasan(
                        judul: 'Sesi',
                        jumlah: '${records.length}',
                        ikon: Icons.menu_book,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: _Ringkasan(
                        judul: 'Hadir',
                        jumlah: '$totalHadir',
                        ikon: Icons.check_circle_outline,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: _Ringkasan(
                        judul: 'Tidak hadir',
                        jumlah: '$totalTidakHadir',
                        ikon: Icons.person_off_outlined,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: records.isEmpty
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
                            'Pilih filter lain atau simpan presensi terlebih dahulu.',
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  )
                : ListView(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                    children: [
                      for (final hari in tanggalUnik) ...[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(4, 12, 4, 8),
                          child: Text(
                            tanggalText(hari),
                            style: const TextStyle(
                              color: _burgundy,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        ...records
                            .where((r) => tanggalSama(r.tanggal, hari))
                            .map(
                              (record) => Card(
                                color: Colors.white,
                                margin: const EdgeInsets.only(bottom: 12),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14),
                                  side: const BorderSide(color: _blush),
                                ),
                                child: ExpansionTile(
                                  leading: const CircleAvatar(
                                    backgroundColor: _blush,
                                    child: Icon(
                                      Icons.history,
                                      color: _burgundy,
                                    ),
                                  ),
                                  title: Text(
                                    record.mapel,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: _burgundy,
                                    ),
                                  ),
                                  subtitle: Text(
                                    '${record.kelas}\n'
                                    'Guru: ${record.namaGuru.isEmpty ? "Belum dicatat" : record.namaGuru}\n'
                                    'Hadir ${record.hadir} • '
                                    'Izin ${record.izin} • '
                                    'Sakit ${record.sakit} • '
                                    'Alpa ${record.alpa}',
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
                              ),
                            ),
                      ],
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}

class _Ringkasan extends StatelessWidget {
  final String judul;
  final String jumlah;
  final IconData ikon;

  const _Ringkasan({
    required this.judul,
    required this.jumlah,
    required this.ikon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: _blush,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Icon(ikon, color: _burgundy),
          const SizedBox(height: 4),
          Text(
            jumlah,
            style: const TextStyle(
              color: _burgundy,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            judul,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 11),
          ),
        ],
      ),
    );
  }
}
