
import 'package:flutter/material.dart';
import '../jadwal_store.dart';

const Color _burgundy = Color(0xFF701A32);
const Color _blush = Color(0xFFFFE3E8);

class GuruScreen extends StatefulWidget {
  const GuruScreen({super.key});

  @override
  State<GuruScreen> createState() => _GuruScreenState();
}

class _GuruScreenState extends State<GuruScreen> {
  List<DataGuru> daftarGuru = [];
  bool memuat = true;

  final namaController = TextEditingController();
  final nipController = TextEditingController();
  final mapelController = TextEditingController();

  final List<DataGuru> guruContoh = [
    DataGuru(id: 'G001', nama: 'Ahmad Fauzan', nip: '198501012010011001', mapel: 'Matematika'),
    DataGuru(id: 'G002', nama: 'Siti Nurhaliza', nip: '198702152012022002', mapel: 'Bahasa Indonesia'),
    DataGuru(id: 'G003', nama: 'Rizky Pratama', nip: '198903102015031003', mapel: 'Bahasa Inggris'),
    DataGuru(id: 'G004', nama: 'Nur Aisyah', nip: '199001202016042004', mapel: 'Pendidikan Agama'),
    DataGuru(id: 'G005', nama: 'Dimas Saputra', nip: '198811252014051005', mapel: 'Informatika'),
    DataGuru(id: 'G006', nama: 'Budi Santoso', nip: '198608182011071007', mapel: 'Sejarah'),
    DataGuru(id: 'G007', nama: 'Andi Firmansyah', nip: '198807102013091009', mapel: 'Fisika'),
    DataGuru(id: 'G008', nama: 'Dewi Lestari', nip: '199205122018062006', mapel: 'Kimia'),
    DataGuru(id: 'G009', nama: 'Fitri Handayani', nip: '199103302017082008', mapel: 'Biologi'),
    DataGuru(id: 'G010', nama: 'Agus Setiawan', nip: '198910202015101010', mapel: 'PJOK'),
    DataGuru(id: 'G011', nama: 'Rina Marlina', nip: '199204152018112011', mapel: 'Ekonomi'),
    DataGuru(id: 'G012', nama: 'Hendra Wijaya', nip: '198705252012121012', mapel: 'PPKn'),
  ];

  @override
  void initState() {
    super.initState();
    muatGuru();
  }

  Future<void> muatGuru() async {
    var data = await GuruStore.ambilSemua();

    // Isi data contoh hanya jika penyimpanan guru masih kosong.
    if (data.isEmpty) {
      await GuruStore.simpanSemua(guruContoh);
      data = await GuruStore.ambilSemua();
    }

    if (!mounted) return;
    setState(() {
      daftarGuru = data;
      memuat = false;
    });
  }

  @override
  void dispose() {
    namaController.dispose();
    nipController.dispose();
    mapelController.dispose();
    super.dispose();
  }

  Future<void> bukaForm({DataGuru? guru}) async {
    final edit = guru != null;
    namaController.text = guru?.nama ?? '';
    nipController.text = guru?.nip ?? '';
    mapelController.text = guru?.mapel ?? '';
    final formKey = GlobalKey<FormState>();

    await showDialog<void>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(edit ? 'Edit Data Guru' : 'Tambah Guru'),
        content: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: namaController,
                  decoration: const InputDecoration(
                    labelText: 'Nama Guru',
                    border: OutlineInputBorder(),
                  ),
                  validator: (v) =>
                      v == null || v.trim().isEmpty
                          ? 'Nama guru wajib diisi'
                          : null,
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: nipController,
                  decoration: const InputDecoration(
                    labelText: 'NIP',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: mapelController,
                  decoration: const InputDecoration(
                    labelText: 'Mata Pelajaran',
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Batal'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: _burgundy,
              foregroundColor: Colors.white,
            ),
            onPressed: () async {
              if (!formKey.currentState!.validate()) return;

              final data = DataGuru(
                id: guru?.id ??
                    DateTime.now().microsecondsSinceEpoch.toString(),
                nama: namaController.text.trim(),
                nip: nipController.text.trim(),
                mapel: mapelController.text.trim(),
              );

              final berhasil = edit
                  ? await GuruStore.ubah(data)
                  : await GuruStore.tambah(data);

              if (!dialogContext.mounted) return;

              if (berhasil) {
                Navigator.pop(dialogContext);
                await muatGuru();
              }
            },
            child: const Text('Simpan'),
          ),
        ],
      ),
    );
  }

  Future<void> hapusGuru(DataGuru guru) async {
    final yakin = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Hapus Guru?'),
        content: Text('Hapus data ${guru.nama}?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Batal'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Hapus'),
          ),
        ],
      ),
    );

    if (yakin != true) return;
    await GuruStore.hapus(guru.id);
    await muatGuru();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Guru'),
        backgroundColor: _burgundy,
        foregroundColor: Colors.white,
      ),
      backgroundColor: const Color(0xFFFFF7F8),
      body: memuat
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(16),
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: _blush,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.people, color: _burgundy, size: 36),
                      const SizedBox(width: 12),
                      Text(
                        'Total ${daftarGuru.length} guru terdaftar',
                        style: const TextStyle(
                          color: _burgundy,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 100),
                    itemCount: daftarGuru.length,
                    itemBuilder: (context, index) {
                      final guru = daftarGuru[index];
                      return Card(
                        color: Colors.white,
                        margin: const EdgeInsets.only(bottom: 12),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: _blush,
                            foregroundColor: _burgundy,
                            child: Text(guru.nama[0]),
                          ),
                          title: Text(
                            guru.nama,
                            style: const TextStyle(
                              color: _burgundy,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            'NIP: ${guru.nip.isEmpty ? '-' : guru.nip}\n'
                            'Mapel: ${guru.mapel.isEmpty ? '-' : guru.mapel}',
                          ),
                          isThreeLine: true,
                          trailing: PopupMenuButton<String>(
                            onSelected: (v) {
                              if (v == 'edit') {
                                bukaForm(guru: guru);
                              } else if (v == 'hapus') {
                                hapusGuru(guru);
                              }
                            },
                            itemBuilder: (_) => const [
                              PopupMenuItem(
                                value: 'edit',
                                child: Text('Edit'),
                              ),
                              PopupMenuItem(
                                value: 'hapus',
                                child: Text('Hapus'),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => bukaForm(),
        backgroundColor: _burgundy,
        foregroundColor: Colors.white,
        icon: const Icon(Icons.person_add),
        label: const Text('Tambah Guru'),
      ),
    );
  }
}
