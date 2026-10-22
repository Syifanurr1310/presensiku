
import 'package:flutter/material.dart';

import 'guru_screen.dart';
import 'kelas_screen.dart';
import 'siswa_screen.dart';
import 'jadwal_screen.dart';
import 'presensi_screen.dart';
import 'riwayat_screen.dart';
import 'rekap_screen.dart';

const Color burgundy = Color(0xFF701A32);
const Color blush = Color(0xFFEBC5CF);
const Color softBackground = Color(0xFFFFF7F8);
const Color mutedText = Color(0xFF94747D);

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
        backgroundColor: burgundy,
        foregroundColor: Colors.white,
        elevation: 0,
        title: const Row(
          children: [
            Icon(Icons.school_rounded, size: 29),
            SizedBox(width: 10),
            Text(
              'PresensiKu',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: [
          IconButton(
            tooltip: 'Keluar',
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/login');
            },
            icon: const Icon(Icons.logout_rounded),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Kartu sambutan
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      burgundy,
                      Color(0xFF963D58),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.waving_hand_rounded,
                      color: Colors.white,
                      size: 32,
                    ),
                    SizedBox(height: 14),
                    Text(
                      'Selamat Datang!',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'PresensiKu',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Kelola guru, siswa, jadwal pelajaran, '
                      'dan presensi dalam satu aplikasi.',
                      style: TextStyle(
                        color: Colors.white,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 26),

              const Text(
                'Menu Utama',
                style: TextStyle(
                  color: burgundy,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 14),

              // Menu utama
              Row(
                children: [
                  Expanded(
                    child: _MenuCard(
                      icon: Icons.person_rounded,
                      title: 'Data Guru',
                      subtitle: 'Kelola data guru',
                      onTap: () => buka(
                        context,
                        const GuruScreen(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _MenuCard(
                      icon: Icons.people_alt_rounded,
                      title: 'Data Siswa',
                      subtitle: 'Kelola siswa',
                      onTap: () => buka(
                        context,
                        const SiswaPage(),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              Row(
                children: [
                  Expanded(
                    child: _MenuCard(
                      icon: Icons.fact_check_rounded,
                      title: 'Presensi',
                      subtitle: 'Catat kehadiran',
                      onTap: () => buka(
                        context,
                        const PresensiPage(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _MenuCard(
                      icon: Icons.class_rounded,
                      title: 'Data Kelas',
                      subtitle: 'Kelola kelas',
                      onTap: () => buka(
                        context,
                        const KelasPage(),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 26),

              const Text(
                'Akses Cepat',
                style: TextStyle(
                  color: burgundy,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 14),

              _QuickMenu(
                icon: Icons.calendar_month_rounded,
                title: 'Jadwal Pelajaran',
                subtitle: 'Atur hari, kelas, guru, dan jam pelajaran',
                onTap: () => buka(
                  context,
                  const JadwalPage(),
                ),
              ),

              _QuickMenu(
                icon: Icons.history_rounded,
                title: 'Riwayat Presensi',
                subtitle: 'Lihat catatan kehadiran siswa',
                onTap: () => buka(
                  context,
                  const RiwayatPage(),
                ),
              ),

              _QuickMenu(
                icon: Icons.bar_chart_rounded,
                title: 'Rekap Presensi',
                subtitle: 'Lihat rangkuman kehadiran',
                onTap: () => buka(
                  context,
                  const RekapPage(),
                ),
              ),

              const SizedBox(height: 18),

              Center(
                child: Text(
                  'PresensiKu • Praktis, rapi, dan terorganisir',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: mutedText,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MenuCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _MenuCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          constraints: const BoxConstraints(minHeight: 145),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: blush.withValues(alpha: 0.7),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                  color: blush.withValues(alpha: 0.35),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(
                  icon,
                  color: burgundy,
                  size: 26,
                ),
              ),
              const SizedBox(height: 14),
              Text(
                title,
                style: const TextStyle(
                  color: burgundy,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                subtitle,
                style: const TextStyle(
                  color: mutedText,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _QuickMenu extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _QuickMenu({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
        side: BorderSide(
          color: blush.withValues(alpha: 0.7),
        ),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        leading: Container(
          width: 46,
          height: 46,
          decoration: BoxDecoration(
            color: blush.withValues(alpha: 0.35),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Icon(icon, color: burgundy),
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: burgundy,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(
            color: mutedText,
            fontSize: 12,
          ),
        ),
        trailing: const Icon(
          Icons.chevron_right_rounded,
          color: burgundy,
        ),
        onTap: onTap,
      ),
    );
  }
}
