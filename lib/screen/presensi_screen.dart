
import 'package:flutter/material.dart';
import '../app_data.dart';
import '../attendance_store.dart';

const Color _burgundy = Color(0xFF701A32);
const Color _blush = Color(0xFFF6E3E8);

class PresensiPage extends StatefulWidget {
  const PresensiPage({super.key});

  @override
  State<PresensiPage> createState() => _PresensiPageState();
}

class _PresensiPageState extends State<PresensiPage> {
  String mataPelajaran = 'Matematika';
  String kelasTerpilih = 'Kelas 10A';
  DateTime tanggal = DateTime.now();
  final Map<String, String> statusSiswa = {};

  final List<String> pilihanStatus = [
    'Hadir',
    'Izin',
    'Sakit',
    'Alpa',
  ];

  Future<void> pilihTanggal() async {
    final hasil = await showDatePicker(
      context: context,
      initialDate: tanggal,
      firstDate: DateTime(2025),
      lastDate: DateTime(2035),
    );

    if (hasil != null && mounted) {
      setState(() => tanggal = hasil);
    }
  }

  String tanggalText() =>
      '${tanggal.day}/${tanggal.month}/${tanggal.year}';

  void simpanPresensi() {
    final siswa = dataSiswa[kelasTerpilih] ?? [];

    final record = PresensiRecord(
      mapel: mataPelajaran,
      kelas: kelasTerpilih,
      tanggal: tanggal,
      statusSiswa: {
        for (final nama in siswa)
          nama: statusSiswa[nama] ?? 'Hadir',
      },
    );

    AttendanceStore.simpan(record);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Presensi berhasil disimpan ke riwayat.'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final siswa = dataSiswa[kelasTerpilih] ?? [];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Presensi Siswa'),
        foregroundColor: _burgundy,
        actions: [
          IconButton(
            onPressed: simpanPresensi,
            tooltip: 'Simpan presensi',
            icon: const Icon(Icons.save_outlined),
          ),
        ],
      ),
      backgroundColor: const Color(0xFFFFF7F8),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                DropdownButtonFormField<String>(
                  initialValue: mataPelajaran,
                  decoration: const InputDecoration(
                    labelText: 'Mata Pelajaran',
                    border: OutlineInputBorder(),
                  ),
                  items: daftarMataPelajaran
                      .map((mapel) => DropdownMenuItem(
                            value: mapel,
                            child: Text(mapel),
                          ))
                      .toList(),
                  onChanged: (value) {
                    if (value != null) {
                      setState(() => mataPelajaran = value);
                    }
                  },
                ),
                const SizedBox(height: 12),
                DropdownButtonFormField<String>(
                  initialValue: kelasTerpilih,
                  decoration: const InputDecoration(
                    labelText: 'Kelas',
                    border: OutlineInputBorder(),
                  ),
                  items: dataSiswa.keys
                      .map((kelas) => DropdownMenuItem(
                            value: kelas,
                            child: Text(kelas),
                          ))
                      .toList(),
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        kelasTerpilih = value;
                        statusSiswa.clear();
                      });
                    }
                  },
                ),
                const SizedBox(height: 12),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(
                    Icons.calendar_month,
                    color: _burgundy,
                  ),
                  title: const Text('Tanggal Presensi'),
                  subtitle: Text(tanggalText()),
                  trailing: const Icon(Icons.edit_calendar),
                  onTap: pilihTanggal,
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: _blush,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    '$mataPelajaran • $kelasTerpilih • ${tanggalText()}',
                    style: const TextStyle(
                      color: _burgundy,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: siswa.length,
              itemBuilder: (context, index) {
                final nama = siswa[index];
                final status = statusSiswa[nama] ?? 'Hadir';

                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: _blush,
                      child: Text(
                        '${index + 1}',
                        style: const TextStyle(color: _burgundy),
                      ),
                    ),
                    title: Text(nama),
                    trailing: DropdownButton<String>(
                      value: status,
                      items: pilihanStatus
                          .map((item) => DropdownMenuItem(
                                value: item,
                                child: Text(item),
                              ))
                          .toList(),
                      onChanged: (value) {
                        if (value != null) {
                          setState(() => statusSiswa[nama] = value);
                        }
                      },
                    ),
                  ),
                );
              },
            ),
          ),
          SafeArea(
            top: false,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: simpanPresensi,
                  icon: const Icon(Icons.save),
                  label: const Text('SIMPAN PRESENSI'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _burgundy,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
