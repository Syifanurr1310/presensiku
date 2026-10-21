
import 'package:flutter/material.dart';
import 'kelas_screen.dart';
import 'siswa_screen.dart';
import 'presensi_screen.dart';
import 'riwayat_screen.dart';
import 'rekap_screen.dart';

const burgundy = Color(0xFF701A32);
const blush = Color(0xFFEBC5CF);
const softBackground = Color(0xFFFFF7F8);
const mutedText = Color(0xFF94747D);

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  void buka(BuildContext context, Widget halaman) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => halaman),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: softBackground,
      appBar: AppBar(
        backgroundColor: softBackground,
        foregroundColor: burgundy,
        elevation: 0,
        title: const Row(
          children: [
            CircleAvatar(
              backgroundColor: burgundy,
              child: Icon(Icons.school, color: Colors.white),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('PresensiKu',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    )),
                Text('Sistem Presensi Siswa',
                    style: TextStyle(fontSize: 11, color: mutedText)),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () =>
                Navigator.pushReplacementNamed(context, '/login'),
            icon: const Icon(Icons.notifications_none),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(14, 4, 14, 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: burgundy,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('SELAMAT DATANG 👋',
                        style: TextStyle(
                            color: Colors.white70, fontSize: 10)),
                    const SizedBox(height: 9),
                    const Text('Halo, Guru!',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    const Text(
                      'Pantau kehadiran siswa dengan lebih mudah.',
                      style: TextStyle(color: Colors.white, fontSize: 11),
                    ),
                    const SizedBox(height: 14),
                    Row(
                      children: [
                        Expanded(
                          child: _bannerMenu(
                            Icons.fact_check_outlined,
                            'Presensi Hari Ini',
                            () => buka(context, const PresensiPage()),
                          ),
                        ),
                        const SizedBox(width: 7),
                        Expanded(
                          child: _bannerMenu(
                            Icons.people_outline,
                            'Data Siswa',
                            () => buka(context, const SiswaPage()),
                            pink: true,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(child: _statistik(Icons.apartment, '6', 'Total Kelas')),
                  const SizedBox(width: 8),
                  Expanded(child: _statistik(Icons.people_outline, '192', 'Total Siswa')),
                ],
              ),
              const SizedBox(height: 13),
              const Text('Akses Cepat',
                  style: TextStyle(
                      color: burgundy,
                      fontWeight: FontWeight.bold,
                      fontSize: 14)),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: _akses(Icons.assignment_turned_in_outlined,
                        'Presensi', () => buka(context, const PresensiPage())),
                  ),
                  const SizedBox(width: 7),
                  Expanded(
                    child: _akses(Icons.history, 'Riwayat',
                        () => buka(context, const RiwayatPage())),
                  ),
                  const SizedBox(width: 7),
                  Expanded(
                    child: _akses(Icons.bar_chart, 'Rekap',
                        () => buka(context, const RekapPage())),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: blush),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Ringkasan Kehadiran',
                        style: TextStyle(
                            color: burgundy, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 12),
                    const Row(
                      children: [
                        Icon(Icons.check_circle,
                            color: Color(0xFF39865E)),
                        SizedBox(width: 8),
                        Expanded(child: Text('Hadir')),
                        Text('85%',
                            style: TextStyle(
                                color: Color(0xFF39865E),
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                    const SizedBox(height: 8),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: const LinearProgressIndicator(
                        value: 0.85,
                        minHeight: 6,
                        backgroundColor: Color(0xFFE8E3E4),
                        color: Color(0xFF39865E),
                      ),
                    ),
                    const SizedBox(height: 7),
                    const Text(
                      'Ilustrasi desain — data kehadiran belum terhubung.',
                      style: TextStyle(fontSize: 10, color: mutedText),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: burgundy,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _nav(Icons.home_outlined, 'Beranda'),
                    _nav(Icons.apartment, 'Kelas',
                        () => buka(context, const KelasPage())),
                    _nav(Icons.fact_check_outlined, 'Presensi',
                        () => buka(context, const PresensiPage())),
                    _nav(Icons.bar_chart, 'Rekap',
                        () => buka(context, const RekapPage())),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _bannerMenu(IconData icon, String teks, VoidCallback aksi,
      {bool pink = false}) {
    return InkWell(
      onTap: aksi,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: pink ? blush : Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 17, color: burgundy),
            const SizedBox(height: 10),
            Text(teks,
                style: const TextStyle(color: burgundy, fontSize: 11)),
          ],
        ),
      ),
    );
  }

  Widget _statistik(IconData icon, String angka, String judul) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: blush),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: burgundy, size: 20),
          const SizedBox(height: 8),
          Text(angka,
              style: const TextStyle(
                  color: burgundy,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(judul,
              style: const TextStyle(color: mutedText, fontSize: 11)),
        ],
      ),
    );
  }

  Widget _akses(IconData icon, String teks, VoidCallback aksi) {
    return InkWell(
      onTap: aksi,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 3),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Icon(icon, color: burgundy, size: 21),
            const SizedBox(height: 4),
            Text(teks,
                style: const TextStyle(color: burgundy, fontSize: 10)),
          ],
        ),
      ),
    );
  }

  Widget _nav(IconData icon, String teks, [VoidCallback? aksi]) {
    return InkWell(
      onTap: aksi,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white, size: 19),
          const SizedBox(height: 3),
          Text(teks,
              style: const TextStyle(color: Colors.white, fontSize: 9)),
        ],
      ),
    );
  }
}
