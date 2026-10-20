import 'package:flutter/material.dart';
import '../app_data.dart';

class PresensiPage extends StatefulWidget {
  const PresensiPage({super.key});

  @override
  State<PresensiPage> createState() =>
      _PresensiPageState();
}

class _PresensiPageState
    extends State<PresensiPage> {
  String mataPelajaran =
      'Matematika';

  String kelasTerpilih =
      'Kelas 10A';

  DateTime tanggal =
      DateTime.now();

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
      lastDate: DateTime(2030),
    );

    if (hasil != null) {
      setState(() {
        tanggal = hasil;
      });
    }
  }

  String tanggalText() {
    return '${tanggal.day} '
        '${namaBulan(tanggal.month)} '
        '${tanggal.year}';
  }

  String namaBulan(int bulan) {
    const bulanNama = [
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

    return bulanNama[bulan - 1];
  }

  void simpanPresensi() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Presensi $mataPelajaran '
          '$kelasTerpilih berhasil disimpan',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final siswa =
        dataSiswa[kelasTerpilih] ?? [];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Presensi Siswa',
        ),
        actions: [
          IconButton(
            onPressed: simpanPresensi,
            icon: const Icon(Icons.save),
            tooltip: 'Simpan Presensi',
          ),
        ],
      ),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(
              16,
              16,
              16,
              8,
            ),
            child: Column(
              children: [
                // MATA PELAJARAN
                DropdownButtonFormField<String>(
                  value: mataPelajaran,
                  decoration: const InputDecoration(
                    labelText: 'Mata Pelajaran',
                    prefixIcon:
                        Icon(Icons.menu_book),
                    border: OutlineInputBorder(),
                  ),
                  items:
                      daftarMataPelajaran.map(
                    (mapel) {
                      return DropdownMenuItem(
                        value: mapel,
                        child: Text(mapel),
                      );
                    },
                  ).toList(),
                  onChanged: (value) {
                    if (value == null) return;

                    setState(() {
                      mataPelajaran = value;
                      statusSiswa.clear();
                    });
                  },
                ),

                const SizedBox(height: 12),

                // KELAS
                DropdownButtonFormField<String>(
                  value: kelasTerpilih,
                  decoration: const InputDecoration(
                    labelText: 'Kelas',
                    prefixIcon:
                        Icon(Icons.class_outlined),
                    border: OutlineInputBorder(),
                  ),
                  items: dataSiswa.keys.map(
                    (kelas) {
                      return DropdownMenuItem(
                        value: kelas,
                        child: Text(kelas),
                      );
                    },
                  ).toList(),
                  onChanged: (value) {
                    if (value == null) return;

                    setState(() {
                      kelasTerpilih = value;
                      statusSiswa.clear();
                    });
                  },
                ),

                const SizedBox(height: 12),

                // TANGGAL
                InkWell(
                  onTap: pilihTanggal,
                  borderRadius:
                      BorderRadius.circular(4),
                  child: InputDecorator(
                    decoration:
                        const InputDecoration(
                      labelText: 'Tanggal',
                      prefixIcon:
                          Icon(Icons.calendar_today),
                      border:
                          OutlineInputBorder(),
                    ),
                    child: Text(
                      tanggalText(),
                    ),
                  ),
                ),
              ],
            ),
          ),

          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(10),
              color: Colors.blue.withOpacity(
                0.08,
              ),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.info_outline,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    '$mataPelajaran • '
                    '$kelasTerpilih • '
                    '${tanggalText()}',
                    style: const TextStyle(
                      fontWeight:
                          FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: siswa.length,
              itemBuilder: (context, index) {
                final nama = siswa[index];

                return Card(
                  margin: const EdgeInsets.only(
                    bottom: 7,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Text(
                        '${index + 1}',
                      ),
                    ),

                    title: Text(
                      nama,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    subtitle: Text(
                      '$kelasTerpilih • '
                      '$mataPelajaran',
                    ),

                    trailing:
                        DropdownButton<String>(
                      value:
                          statusSiswa[nama] ??
                              'Hadir',
                      items:
                          pilihanStatus.map(
                        (status) {
                          return DropdownMenuItem(
                            value: status,
                            child: Text(status),
                          );
                        },
                      ).toList(),
                      onChanged: (value) {
                        if (value == null) {
                          return;
                        }

                        setState(() {
                          statusSiswa[nama] =
                              value;
                        });
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

