
import 'package:flutter/material.dart';
import '../jadwal_store.dart';

const Color burgundy = Color(0xFF701A32);
const Color blush = Color(0xFFEBC5CF);
const Color softBackground = Color(0xFFFFF7F8);
const Color mutedText = Color(0xFF94747D);

class JadwalPage extends StatefulWidget {
  const JadwalPage({super.key});

  @override
  State<JadwalPage> createState() => _JadwalPageState();
}

class _JadwalPageState extends State<JadwalPage> {
  final List<String> hariList = [
    'Senin', 'Selasa', 'Rabu', 'Kamis', 'Jumat', 'Sabtu',
  ];

  final List<String> kelasList = [
    'Kelas 10A', 'Kelas 10B', 'Kelas 11A',
    'Kelas 11B', 'Kelas 12A', 'Kelas 12B',
  ];

  final Map<String, String> guruMapel = {
    'Matematika': 'Ahmad Fauzan',
    'Bahasa Indonesia': 'Siti Nurhaliza',
    'Bahasa Inggris': 'Rizky Pratama',
    'Pendidikan Agama': 'Nur Aisyah',
    'Informatika': 'Dimas Saputra',
    'Sejarah': 'Budi Santoso',
    'Fisika': 'Andi Firmansyah',
    'Kimia': 'Dewi Lestari',
    'Biologi': 'Fitri Handayani',
    'PJOK': 'Agus Setiawan',
    'Ekonomi': 'Rina Marlina',
    'Geografi': 'Fajar Ramadhan',
    'Sosiologi': 'Maya Puspita',
    'PPKn': 'Hendra Wijaya',
    'Seni Budaya': 'Indah Permata',
  };

  List<JadwalPelajaran> daftarJadwal = [];
  List<DataGuru> daftarGuru = [];

  String filterHari = 'Semua';
  String filterKelas = 'Semua';
  bool memuat = true;

  List<String> get mapelList => guruMapel.keys.toList();

  @override
  void initState() {
    super.initState();
    muatJadwal();
  }

  Future<void> muatJadwal() async {
    await JadwalStore.buatContohJikaKosong();

    final jadwal = await JadwalStore.ambilSemua();
    final guru = await GuruStore.ambilSemua();

    jadwal.sort((a, b) {
      final h = hariList.indexOf(a.hari)
          .compareTo(hariList.indexOf(b.hari));
      if (h != 0) return h;

      final k = kelasList.indexOf(a.kelas)
          .compareTo(kelasList.indexOf(b.kelas));
      if (k != 0) return k;

      return a.jamKe.compareTo(b.jamKe);
    });

    if (!mounted) return;

    setState(() {
      daftarJadwal = jadwal;
      daftarGuru = guru;
      memuat = false;
    });
  }

  List<JadwalPelajaran> get jadwalTerfilter {
    return daftarJadwal.where((j) {
      final cocokHari = filterHari == 'Semua' || j.hari == filterHari;
      final cocokKelas = filterKelas == 'Semua' || j.kelas == filterKelas;
      return cocokHari && cocokKelas;
    }).toList();
  }

  String namaGuruTampil(JadwalPelajaran jadwal) {
    final namaLama = jadwal.namaGuru.trim();

    // Jika jadwal sudah menyimpan nama guru yang terdaftar,
    // tampilkan nama tersebut.
    for (final guru in daftarGuru) {
      if (guru.nama.trim().toLowerCase() == namaLama.toLowerCase() &&
          namaLama.isNotEmpty &&
          !namaLama.startsWith('Guru ')) {
        return guru.nama;
      }
    }

    // Untuk jadwal lama yang menyimpan "Guru Matematika",
    // cari guru berdasarkan mata pelajarannya.
    for (final guru in daftarGuru) {
      if (guru.mapel.trim().toLowerCase() ==
          jadwal.mataPelajaran.trim().toLowerCase()) {
        return guru.nama;
      }
    }

    // Cadangan jika mata pelajaran belum mempunyai data guru.
    if (namaLama.startsWith('Guru ')) {
      return guruMapel[jadwal.mataPelajaran] ?? 'Pilih nama guru';
    }

    return namaLama.isEmpty ? 'Pilih nama guru' : namaLama;
  }

  String formatWaktu(TimeOfDay waktu) {
    return '${waktu.hour.toString().padLeft(2, '0')}:'
        '${waktu.minute.toString().padLeft(2, '0')}';
  }

  TimeOfDay parseWaktu(String waktu) {
    final bagian = waktu.split(':');
    return TimeOfDay(
      hour: int.parse(bagian[0]),
      minute: int.parse(bagian[1]),
    );
  }

  Future<TimeOfDay?> pilihWaktu(
    BuildContext context,
    TimeOfDay awal,
  ) {
    return showTimePicker(
      context: context,
      initialTime: awal,
    );
  }

  Future<void> bukaForm({JadwalPelajaran? jadwal}) async {
    if (daftarGuru.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Tambahkan data guru terlebih dahulu di halaman Data Guru.',
          ),
        ),
      );
      return;
    }

    final formKey = GlobalKey<FormState>();

    String hari = jadwal?.hari ?? 'Senin';
    String kelas = jadwal?.kelas ?? kelasList.first;
    String mapel = jadwal?.mataPelajaran ?? mapelList.first;
    int jamKe = jadwal?.jamKe ?? 1;

    final guruAwal = daftarGuru.where(
      (g) => g.nama == jadwal?.namaGuru,
    ).firstOrNull;

    final guruMapelAwal = daftarGuru.where(
      (g) => g.mapel.trim().toLowerCase() == mapel.toLowerCase(),
    ).firstOrNull;

    String? guruId = guruAwal?.id ??
        guruMapelAwal?.id ??
        daftarGuru.first.id;

    TimeOfDay mulai = parseWaktu(jadwal?.jamMulai ?? '07:00');
    TimeOfDay selesai = parseWaktu(jadwal?.jamSelesai ?? '07:45');

    final hasil = await showDialog<JadwalPelajaran>(
      context: context,
      builder: (dialogContext) {
        return StatefulBuilder(
          builder: (contextDialog, setDialogState) {
            return AlertDialog(
              backgroundColor: softBackground,
              title: Text(
                jadwal == null ? 'Tambah Jadwal' : 'Edit Jadwal',
                style: const TextStyle(
                  color: burgundy,
                  fontWeight: FontWeight.bold,
                ),
              ),
              content: SizedBox(
                width: 440,
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _dropdown<String>(
                          label: 'Hari',
                          value: hari,
                          options: hariList,
                          onChanged: (v) {
                            if (v != null) {
                              setDialogState(() => hari = v);
                            }
                          },
                        ),
                        const SizedBox(height: 12),
                        _dropdown<String>(
                          label: 'Kelas',
                          value: kelas,
                          options: kelasList,
                          onChanged: (v) {
                            if (v != null) {
                              setDialogState(() => kelas = v);
                            }
                          },
                        ),
                        const SizedBox(height: 12),
                        _dropdown<String>(
                          label: 'Mata Pelajaran',
                          value: mapelList.contains(mapel)
                              ? mapel
                              : mapelList.first,
                          options: mapelList,
                          onChanged: (v) {
                            if (v == null) return;

                            setDialogState(() {
                              mapel = v;

                              // Saat mapel berubah, pilih guru yang
                              // mengajar mapel tersebut jika tersedia.
                              final cocok = daftarGuru.where(
                                (g) => g.mapel.trim().toLowerCase() ==
                                    mapel.toLowerCase(),
                              );

                              if (cocok.isNotEmpty) {
                                guruId = cocok.first.id;
                              }
                            });
                          },
                        ),
                        const SizedBox(height: 12),
                        _dropdown<int>(
                          label: 'Jam Pelajaran',
                          value: jamKe.clamp(1, 10),
                          options: List.generate(10, (i) => i + 1),
                          labelBuilder: (v) => 'Jam ke-$v',
                          onChanged: (v) {
                            if (v != null) {
                              setDialogState(() => jamKe = v);
                            }
                          },
                        ),
                        const SizedBox(height: 12),
                        _dropdown<String>(
                          label: 'Nama Guru',
                          value: daftarGuru.any((g) => g.id == guruId)
                              ? guruId!
                              : daftarGuru.first.id,
                          options: daftarGuru.map((g) => g.id).toList(),
                          labelBuilder: (id) => daftarGuru
                              .firstWhere((g) => g.id == id)
                              .nama,
                          onChanged: (v) {
                            if (v != null) {
                              setDialogState(() {
                                guruId = v;
                                final guruDipilih = daftarGuru.firstWhere(
                                  (g) => g.id == v,
                                );

                                if (mapelList.contains(guruDipilih.mapel)) {
                                  mapel = guruDipilih.mapel;
                                }
                              });
                            }
                          },
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: OutlinedButton(
                                onPressed: () async {
                                  final waktu = await pilihWaktu(
                                    contextDialog,
                                    mulai,
                                  );
                                  if (waktu != null) {
                                    setDialogState(() => mulai = waktu);
                                  }
                                },
                                child: Text(
                                  'Mulai\n${formatWaktu(mulai)}',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: OutlinedButton(
                                onPressed: () async {
                                  final waktu = await pilihWaktu(
                                    contextDialog,
                                    selesai,
                                  );
                                  if (waktu != null) {
                                    setDialogState(() => selesai = waktu);
                                  }
                                },
                                child: Text(
                                  'Selesai\n${formatWaktu(selesai)}',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
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
                    backgroundColor: burgundy,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    if (!formKey.currentState!.validate()) return;

                    final menitMulai = mulai.hour * 60 + mulai.minute;
                    final menitSelesai =
                        selesai.hour * 60 + selesai.minute;

                    if (menitSelesai <= menitMulai) {
                      ScaffoldMessenger.of(contextDialog).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Jam selesai harus setelah jam mulai.',
                          ),
                        ),
                      );
                      return;
                    }

                    final guruDipilih = daftarGuru.firstWhere(
                      (g) => g.id == guruId,
                      orElse: () => daftarGuru.first,
                    );

                    Navigator.pop(
                      dialogContext,
                      JadwalPelajaran(
                        id: jadwal?.id ??
                            DateTime.now()
                                .microsecondsSinceEpoch
                                .toString(),
                        hari: hari,
                        kelas: kelas,
                        mataPelajaran: mapel,
                        namaGuru: guruDipilih.nama,
                        jamKe: jamKe,
                        jamMulai: formatWaktu(mulai),
                        jamSelesai: formatWaktu(selesai),
                      ),
                    );
                  },
                  child: const Text('Simpan'),
                ),
              ],
            );
          },
        );
      },
    );

    if (!mounted || hasil == null) return;

    final berhasil = jadwal == null
        ? await JadwalStore.tambah(hasil)
        : await JadwalStore.ubah(hasil);

    if (!mounted) return;

    if (berhasil) {
      await muatJadwal();
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Jadwal berhasil disimpan.')),
      );
    }
  }

  Widget _dropdown<T>({
    required String label,
    required T value,
    required List<T> options,
    required ValueChanged<T?> onChanged,
    String Function(T)? labelBuilder,
  }) {
    return DropdownButtonFormField<T>(
      initialValue: value,
      isExpanded: true,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      items: options.map((item) {
        return DropdownMenuItem<T>(
          value: item,
          child: Text(
            labelBuilder?.call(item) ?? item.toString(),
            overflow: TextOverflow.ellipsis,
          ),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }

  Future<void> hapusJadwal(JadwalPelajaran jadwal) async {
    final yakin = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Hapus Jadwal?'),
        content: Text(
          '${jadwal.mataPelajaran} • ${jadwal.kelas} • ${jadwal.hari}',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Batal'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Hapus'),
          ),
        ],
      ),
    );

    if (!mounted || yakin != true) return;

    final berhasil = await JadwalStore.hapus(jadwal.id);
    if (!mounted) return;

    if (berhasil) await muatJadwal();
  }

  @override
  Widget build(BuildContext context) {
    final data = jadwalTerfilter;

    return Scaffold(
      backgroundColor: softBackground,
      appBar: AppBar(
        backgroundColor: burgundy,
        foregroundColor: Colors.white,
        title: const Text(
          'Jadwal Pelajaran',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: burgundy,
        foregroundColor: Colors.white,
        onPressed: () => bukaForm(),
        icon: const Icon(Icons.add),
        label: const Text('Tambah Jadwal'),
      ),
      body: memuat
          ? const Center(
              child: CircularProgressIndicator(color: burgundy),
            )
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      _dropdown<String>(
                        label: 'Filter Hari',
                        value: filterHari,
                        options: ['Semua', ...hariList],
                        onChanged: (v) {
                          if (v != null) {
                            setState(() => filterHari = v);
                          }
                        },
                      ),
                      const SizedBox(height: 12),
                      _dropdown<String>(
                        label: 'Filter Kelas',
                        value: filterKelas,
                        options: ['Semua', ...kelasList],
                        onChanged: (v) {
                          if (v != null) {
                            setState(() => filterKelas = v);
                          }
                        },
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: data.isEmpty
                      ? const Center(child: Text('Belum ada jadwal.'))
                      : ListView.builder(
                          padding: const EdgeInsets.fromLTRB(
                            16, 0, 16, 100,
                          ),
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            final item = data[index];

                            return Card(
                              color: Colors.white,
                              elevation: 1,
                              margin: const EdgeInsets.only(bottom: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18),
                                side: BorderSide(
                                  color: blush.withValues(alpha: 0.8),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 14,
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 56,
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 10,
                                        horizontal: 3,
                                      ),
                                      decoration: BoxDecoration(
                                        color: blush.withValues(alpha: 0.4),
                                        borderRadius: BorderRadius.circular(14),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const Icon(
                                            Icons.access_time_rounded,
                                            color: burgundy,
                                            size: 22,
                                          ),
                                          const SizedBox(height: 5),
                                          FittedBox(
                                            fit: BoxFit.scaleDown,
                                            child: Text(
                                              'Ke-${item.jamKe}',
                                              style: const TextStyle(
                                                color: burgundy,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 11,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            item.mataPelajaran,
                                            style: const TextStyle(
                                              color: burgundy,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          _info(
                                            Icons.class_outlined,
                                            '${item.kelas} • ${item.hari}',
                                          ),
                                          const SizedBox(height: 5),
                                          _info(
                                            Icons.schedule_rounded,
                                            '${item.jamMulai} – ${item.jamSelesai}',
                                          ),
                                          const SizedBox(height: 5),
                                          _info(
                                            Icons.person_outline_rounded,
                                            namaGuruTampil(item),
                                          ),
                                        ],
                                      ),
                                    ),
                                    PopupMenuButton<String>(
                                      tooltip: 'Pilihan jadwal',
                                      onSelected: (v) {
                                        if (v == 'edit') {
                                          bukaForm(jadwal: item);
                                        } else if (v == 'hapus') {
                                          hapusJadwal(item);
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
                                  ],
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

  Widget _info(IconData icon, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 16, color: mutedText),
        const SizedBox(width: 6),
        Expanded(
          child: Text(
            text,
            softWrap: true,
            style: const TextStyle(
              color: mutedText,
              fontSize: 13,
              height: 1.35,
            ),
          ),
        ),
      ],
    );
  }
}
