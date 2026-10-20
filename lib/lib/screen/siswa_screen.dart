import 'package:flutter/material.dart';
import '../app_data.dart';

class SiswaPage extends StatefulWidget {
  final String namaKelas;

  const SiswaPage({
    super.key,
    this.namaKelas = 'Kelas 10A',
  });

  @override
  State<SiswaPage> createState() =>
      _SiswaPageState();
}

class _SiswaPageState extends State<SiswaPage> {
  late String kelasTerpilih;
  String pencarian = '';

  @override
  void initState() {
    super.initState();
    kelasTerpilih = widget.namaKelas;
  }

  @override
  Widget build(BuildContext context) {
    final semuaSiswa =
        dataSiswa[kelasTerpilih] ?? [];

    final daftarSiswa = semuaSiswa.where(
      (nama) {
        return nama
            .toLowerCase()
            .contains(
              pencarian.toLowerCase(),
            );
      },
    ).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Siswa'),
      ),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                DropdownButtonFormField<String>(
                  value: kelasTerpilih,
                  decoration: const InputDecoration(
                    labelText: 'Pilih Kelas',
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
                      pencarian = '';
                    });
                  },
                ),

                const SizedBox(height: 12),

                TextField(
                  onChanged: (value) {
                    setState(() {
                      pencarian = value;
                    });
                  },
                  decoration: const InputDecoration(
                    hintText: 'Cari nama siswa...',
                    prefixIcon:
                        Icon(Icons.search),
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Row(
              children: [
                Text(
                  kelasTerpilih,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Text(
                  '${daftarSiswa.length} siswa',
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 8),

          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              itemCount: daftarSiswa.length,
              itemBuilder: (context, index) {
                final nama =
                    daftarSiswa[index];

                return Card(
                  margin: const EdgeInsets.only(
                    bottom: 8,
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
                      kelasTerpilih,
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

