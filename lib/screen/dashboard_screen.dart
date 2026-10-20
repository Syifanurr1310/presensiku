import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PresensiKu'),
        actions: [
          IconButton(
            tooltip: 'Logout',
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Halo, Guru!',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            const Text('Selamat datang di PresensiKu'),
            const SizedBox(height: 24),
            const Text(
              'Ringkasan',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                _statistik('Kelas', '6', Icons.class_outlined),
                _statistik('Siswa', '192', Icons.people_outline),
              ],
            ),
            const SizedBox(height: 24),
            const Text(
              'Menu Utama',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            _menu(context, 'Kelas', Icons.class_outlined),
            _menu(context, 'Siswa', Icons.people_outline),
            _menu(context, 'Presensi', Icons.fact_check_outlined),
            _menu(context, 'Riwayat', Icons.history),
            _menu(context, 'Rekap', Icons.assessment_outlined),
          ],
        ),
      ),
    );
  }

  Widget _statistik(String judul, String angka, IconData ikon) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            children: [
              Icon(ikon, size: 30),
              const SizedBox(height: 8),
              Text(
                angka,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(judul),
            ],
          ),
        ),
      ),
    );
  }

  Widget _menu(BuildContext context, String judul, IconData ikon) {
    return Card(
      child: ListTile(
        leading: Icon(ikon),
        title: Text(judul),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Menu $judul dipilih')),
          );
        },
      ),
    );
  }
}
