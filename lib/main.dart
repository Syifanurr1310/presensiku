import 'package:flutter/material.dart';

void main() {
  runApp(const PresensiKuApp());
}

// ============================================================
// DATA SISWA
// 6 KELAS x 32 SISWA = 192 SISWA
// ============================================================

final Map<String, List<String>> dataSiswa = {
  'Kelas 10A': [
    'Ahmad Fauzan',
    'Aldi Pratama',
    'Andi Saputra',
    'Aulia Rahma',
    'Bagas Ramadhan',
    'Bima Aditya',
    'Citra Lestari',
    'Daffa Maulana',
    'Dewi Anggraini',
    'Fajar Nugraha',
    'Farhan Akbar',
    'Fitri Handayani',
    'Galih Prakoso',
    'Hana Putri',
    'Ilham Maulana',
    'Intan Permata',
    'Jihan Aulia',
    'Kevin Ramadhan',
    'Laila Salsabila',
    'M. Rizky Pratama',
    'Nabila Putri',
    'Nanda Saputra',
    'Naufal Hidayat',
    'Putri Amelia',
    'Rafi Kurniawan',
    'Rania Azzahra',
    'Reza Fahlevi',
    'Salsa Maharani',
    'Satria Wijaya',
    'Tiara Anindita',
    'Vina Oktaviani',
    'Yoga Pratama',
  ],

  'Kelas 10B': [
    'Aditya Firmansyah',
    'Agung Setiawan',
    'Alif Ramadhan',
    'Amelia Putri',
    'Anisa Rahma',
    'Ardiansyah',
    'Bella Safitri',
    'Cahyo Nugroho',
    'Dani Kurniawan',
    'Della Maharani',
    'Dimas Saputra',
    'Eka Pratiwi',
    'Fahmi Akbar',
    'Fani Aulia',
    'Gilang Ramadhan',
    'Hafiz Maulana',
    'Indah Permata',
    'Iqbal Hidayat',
    'Jaka Pratama',
    'Kania Salsabila',
    'Lukman Hakim',
    'Maya Anggraini',
    'Miftahul Rahman',
    'Nadia Putri',
    'Niko Saputra',
    'Olivia Maharani',
    'Raka Aditya',
    'Rani Lestari',
    'Rizal Fahmi',
    'Siti Aisyah',
    'Taufik Hidayat',
    'Wulan Sari',
  ],

  'Kelas 11A': [
    'Abdul Rahman',
    'Adelia Putri',
    'Adit Kurniawan',
    'Aisyah Ramadhani',
    'Akmal Fauzi',
    'Almira Salsabila',
    'Andika Pratama',
    'Annisa Fitri',
    'Arman Saputra',
    'Bayu Setiawan',
    'Cindy Maharani',
    'Dani Firmansyah',
    'Dhea Oktaviani',
    'Dicky Pratama',
    'Elsa Permata',
    'Faisal Hidayat',
    'Fikri Ramadhan',
    'Gita Lestari',
    'Hendra Wijaya',
    'Icha Rahma',
    'Jefri Kurniawan',
    'Kiki Amelia',
    'Larasati Putri',
    'Maya Sari',
    'Naufal Akbar',
    'Nia Ramadhani',
    'Rafi Maulana',
    'Raisa Aulia',
    'Rangga Saputra',
    'Salsa Putri',
    'Teguh Pratama',
    'Zahra Azzahra',
  ],

  'Kelas 11B': [
    'Aang Setiawan',
    'Abid Ramadhan',
    'Adinda Putri',
    'Afif Hidayat',
    'Aldi Kurniawan',
    'Alika Maharani',
    'Andri Saputra',
    'Anjani Lestari',
    'Bagus Pratama',
    'Bintang Ramadhan',
    'Caca Amelia',
    'Daffa Hidayat',
    'Dania Putri',
    'Denny Kurniawan',
    'Dinda Sari',
    'Fadli Akbar',
    'Fania Rahma',
    'Fauzan Maulana',
    'Gerry Saputra',
    'Hana Lestari',
    'Irfan Hidayat',
    'Jasmine Putri',
    'Kevin Saputra',
    'Lina Anggraini',
    'M. Fajar',
    'Nadia Aulia',
    'Niko Ramadhan',
    'Raka Pratama',
    'Rina Maharani',
    'Rizky Hidayat',
    'Sabrina Putri',
    'Yusuf Maulana',
  ],

  'Kelas 12A': [
    'Adnan Fauzi',
    'Alya Ramadhani',
    'Arif Setiawan',
    'Aulia Putri',
    'Bagas Pratama',
    'Berlian Sari',
    'Candra Saputra',
    'Daffa Akbar',
    'Dewi Lestari',
    'Dimas Hidayat',
    'Fahri Maulana',
    'Fani Rahma',
    'Fikri Saputra',
    'Ghani Pratama',
    'Hafiz Ramadhan',
    'Indra Wijaya',
    'Intan Sari',
    'Jihan Permata',
    'Khalid Hidayat',
    'Lia Anggraini',
    'M. Ardiansyah',
    'Nabila Rahma',
    'Nanda Pratama',
    'Naufal Saputra',
    'Putri Maharani',
    'Rafi Hidayat',
    'Rania Putri',
    'Rendy Kurniawan',
    'Salsa Aulia',
    'Satria Ramadhan',
    'Tasya Lestari',
    'Zaki Maulana',
  ],

  'Kelas 12B': [
    'Abdul Aziz',
    'Adelia Rahma',
    'Adit Saputra',
    'Afifah Putri',
    'Agung Pratama',
    'Alvin Hidayat',
    'Amel Salsabila',
    'Andhika Wijaya',
    'Anisa Lestari',
    'Bayu Ramadhan',
    'Bella Aulia',
    'Cahya Putri',
    'Dani Maulana',
    'Della Sari',
    'Dimas Kurniawan',
    'Egi Pratama',
    'Fahmi Saputra',
    'Farah Azzahra',
    'Galang Hidayat',
    'Hana Maharani',
    'Ilham Pratama',
    'Irfan Maulana',
    'Jasmine Lestari',
    'Kania Putri',
    'Lutfi Hidayat',
    'Maya Rahma',
    'Naufal Kurniawan',
    'Nisa Aulia',
    'Raka Wijaya',
    'Rani Permata',
    'Rizky Maulana',
    'Siti Rahma',
  ],
};

// ============================================================
// DATA MATA PELAJARAN
// ============================================================

const List<String> daftarMataPelajaran = [
  'Matematika',
  'Bahasa Indonesia',
  'Bahasa Inggris',
  'Fisika',
  'Kimia',
  'Biologi',
  'Informatika',
  'Sejarah',
  'Ekonomi',
  'Geografi',
  'Sosiologi',
  'PPKn',
  'Pendidikan Agama',
  'PJOK',
  'Seni Budaya',
];

// ============================================================
// APP
// ============================================================

class PresensiKuApp extends StatelessWidget {
  const PresensiKuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PresensiKu',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFFF5F7FA),
      ),
      home: const LoginPage(),
    );
  }
}

// ============================================================
// LOGIN
// ============================================================

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool passwordTampil = false;

  void masuk() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const DashboardPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 400,
            ),
            child: Card(
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(25),
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 36,
                      child: Icon(
                        Icons.how_to_reg,
                        size: 38,
                      ),
                    ),

                    const SizedBox(height: 16),

                    const Text(
                      'PresensiKu',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 5),

                    const Text(
                      'Sistem Presensi Siswa SMA',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),

                    const SizedBox(height: 28),

                    const TextField(
                      decoration: InputDecoration(
                        labelText: 'Username',
                        prefixIcon: Icon(
                          Icons.person_outline,
                        ),
                        border: OutlineInputBorder(),
                      ),
                    ),

                    const SizedBox(height: 14),

                    TextField(
                      obscureText: !passwordTampil,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        prefixIcon: const Icon(
                          Icons.lock_outline,
                        ),
                        border: const OutlineInputBorder(),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              passwordTampil =
                                  !passwordTampil;
                            });
                          },
                          icon: Icon(
                            passwordTampil
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    SizedBox(
                      width: double.infinity,
                      height: 46,
                      child: ElevatedButton(
                        onPressed: masuk,
                        child: const Text(
                          'MASUK',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ============================================================
// DASHBOARD
// ============================================================

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  void buka(
    BuildContext context,
    Widget halaman,
  ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => halaman,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'PresensiKu',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                ),
              );
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            const Text(
              'Halo, Guru!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 4),

            const Text(
              'Selamat datang di PresensiKu',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 20),

            Row(
              children: [
                Expanded(
                  child: _statistik(
                    Icons.class_outlined,
                    'Kelas',
                    '6',
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _statistik(
                    Icons.people_outline,
                    'Siswa',
                    '192',
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _statistik(
                    Icons.fact_check_outlined,
                    'Presensi',
                    '18',
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            const Text(
              'Menu Utama',
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            Row(
              children: [
                Expanded(
                  child: _menu(
                    context,
                    Icons.class_outlined,
                    'Kelas',
                    const KelasPage(),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _menu(
                    context,
                    Icons.people_outline,
                    'Siswa',
                    const SiswaPage(),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            Row(
              children: [
                Expanded(
                  child: _menu(
                    context,
                    Icons.fact_check_outlined,
                    'Presensi',
                    const PresensiPage(),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _menu(
                    context,
                    Icons.history,
                    'Riwayat',
                    const RiwayatPage(),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            Row(
              children: [
                Expanded(
                  child: _menu(
                    context,
                    Icons.assessment_outlined,
                    'Rekap',
                    const RekapPage(),
                  ),
                ),
                const SizedBox(width: 10),
                const Expanded(
                  child: SizedBox(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _statistik(
    IconData icon,
    String judul,
    String angka,
  ) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 5,
        ),
        child: Column(
          children: [
            Icon(icon, size: 25),
            const SizedBox(height: 4),
            Text(
              angka,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              judul,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _menu(
    BuildContext context,
    IconData icon,
    String judul,
    Widget halaman,
  ) {
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          buka(context, halaman);
        },
        child: SizedBox(
          height: 78,
          child: Row(
            mainAxisAlignment:
                MainAxisAlignment.center,
            children: [
              Icon(icon, size: 27),
              const SizedBox(width: 8),
              Text(
                judul,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ============================================================
// KELAS
// ============================================================

class KelasPage extends StatelessWidget {
  const KelasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Kelas'),
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const TextField(
            decoration: InputDecoration(
              hintText: 'Cari kelas...',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(),
            ),
          ),

          const SizedBox(height: 15),

          ...dataSiswa.entries.map(
            (kelas) {
              return Card(
                margin: const EdgeInsets.only(
                  bottom: 10,
                ),
                child: ListTile(
                  leading: const CircleAvatar(
                    child: Icon(Icons.class_),
                  ),
                  title: Text(
                    kelas.key,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    '${kelas.value.length} siswa',
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 17,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SiswaPage(
                          namaKelas: kelas.key,
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

// ============================================================
// SISWA
// ============================================================

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

// ============================================================
// PRESENSI PER MATA PELAJARAN
// ============================================================

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

// ============================================================
// RIWAYAT PRESENSI
// ============================================================

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

// ============================================================
// REKAP PRESENSI
// ============================================================

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