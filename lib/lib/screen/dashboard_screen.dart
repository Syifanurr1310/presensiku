
import 'package:flutter/material.dart';
import '../app_data.dart';
import 'kelas_screen.dart';
import 'siswa_screen.dart';
import 'presensi_screen.dart';
import 'riwayat_screen.dart';
import 'rekap_screen.dart';

const Color burgundy = Color(0xFF701A32);
const Color blush = Color(0xFFF6E3E8);
const Color softBackground = Color(0xFFFFF7F8);
const Color mutedText = Color(0xFF806772);

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
        titleSpacing: 20,
        title: const Row(
          children: [
            Icon(Icons.school_rounded, size: 29),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'PresensiKu',
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -0.5,
                  ),
                ),
                Text(
                  'SISTEM PRESENSI SISWA',
                  style: TextStyle(
                    fontSize: 9,
                    letterSpacing: 1.3,
                    color: mutedText,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            tooltip: 'Keluar',
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/login');
            },
            icon: Container(
              padding: const EdgeInsets.all(9),
              decoration: BoxDecoration(
                color: blush,
                borderRadius: BorderRadius.circular(13),
              ),
              child: const Icon(Icons.logout_rounded, size: 20),
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(18, 12, 18, 28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _banner(),
            const SizedBox(height: 25),

            const Text(
              'Ringkasan Sekolah',
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w800,
                color: Color(0xFF35232A),
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              'Informasi umum PresensiKu',
              style: TextStyle(color: mutedText, fontSize: 13),
            ),
            const SizedBox(height: 14),

            Row(
              children: [
                Expanded(
                  child: _statistik(
                    Icons.meeting_room_rounded,
                    '6',
                    'Total Kelas',
                    const Color(0xFF701A32),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _statistik(
                    Icons.groups_rounded,
                    '192',
                    'Total Siswa',
                    const Color(0xFF9F3450),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            _kartuPresensi(),

            const SizedBox(height: 27),
            const Text(
              'Menu Utama',
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w800,
                color: Color(0xFF35232A),
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              'Pilih layanan yang ingin kamu buka',
              style: TextStyle(color: mutedText, fontSize: 13),
            ),
            const SizedBox(height: 14),

            GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.35,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                _menu(
                  context,
                  Icons.meeting_room_rounded,
                  'Data Kelas',
                  'Kelola kelas siswa',
                  const Color(0xFF701A32),
                  const KelasPage(),
                ),
                _menu(
                  context,
                  Icons.groups_rounded,
                  'Data Siswa',
                  'Daftar siswa',
                  const Color(0xFF9F3450),
                  const SiswaPage(),
                ),
                _menu(
                  context,
                  Icons.fact_check_rounded,
                  'Presensi',
                  'Catat kehadiran',
                  const Color(0xFF52796F),
                  const PresensiPage(),
                ),
                _menu(
                  context,
                  Icons.history_rounded,
                  'Riwayat',
                  'Lihat catatan presensi',
                  const Color(0xFF8267A8),
                  const RiwayatPage(),
                ),
                _menu(
                  context,
                  Icons.bar_chart_rounded,
                  'Rekap Presensi',
                  'Ringkasan kehadiran',
                  const Color(0xFFB77932),
                  const RekapPage(),
                ),
              ],
            ),

            const SizedBox(height: 22),
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: const Color(0xFFEED9DF)),
              ),
              child: const Row(
                children: [
                  Icon(
                    Icons.lightbulb_outline_rounded,
                    color: burgundy,
                    size: 25,
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Pastikan data presensi dicatat dengan teliti agar rekap kehadiran tetap akurat.',
                      style: TextStyle(
                        color: mutedText,
                        fontSize: 12,
                        height: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _banner() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF701A32), Color(0xFF9F3450)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: burgundy.withValues(alpha: 0.20),
            blurRadius: 20,
            offset: const Offset(0, 9),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            right: -12,
            top: -15,
            child: Icon(
              Icons.school_rounded,
              size: 115,
              color: Colors.white.withValues(alpha: 0.09),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 11,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Text(
                  'DASHBOARD GURU',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
              const SizedBox(height: 19),
              const Text(
                'Halo, Guru! 👋',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 27,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -0.6,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Kelola presensi siswa dengan lebih mudah dan teratur.',
                style: TextStyle(
                  color: Color(0xFFF8E8ED),
                  fontSize: 13,
                  height: 1.6,
                ),
              ),
              const SizedBox(height: 18),
              Row(
                children: [
                  const Icon(
                    Icons.verified_user_rounded,
                    color: Color(0xFFF2C8D5),
                    size: 17,
                  ),
                  const SizedBox(width: 7),
                  Text(
                    'PresensiKu • Manajemen Sekolah',
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.9),
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _statistik(
    IconData icon,
    String angka,
    String judul,
    Color warna,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFEED9DF)),
        boxShadow: [
          BoxShadow(
            color: burgundy.withValues(alpha: 0.035),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: blush,
              borderRadius: BorderRadius.circular(13),
            ),
            child: Icon(icon, color: warna, size: 23),
          ),
          const SizedBox(height: 14),
          Text(
            angka,
            style: TextStyle(
              fontSize: 28,
              height: 1,
              fontWeight: FontWeight.w800,
              color: warna,
            ),
          ),
          const SizedBox(height: 7),
          Text(
            judul,
            style: const TextStyle(
              fontSize: 12,
              color: mutedText,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _kartuPresensi() {
    return Container(
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: const Color(0xFFF0E5EA),
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: Colors.white,
            child: Icon(
              Icons.fact_check_rounded,
              color: burgundy,
              size: 25,
            ),
          ),
          SizedBox(width: 13),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Presensi Hari Ini',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    color: burgundy,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Buka menu presensi untuk mencatat kehadiran.',
                  style: TextStyle(
                    fontSize: 11,
                    color: mutedText,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
          Icon(Icons.arrow_forward_ios_rounded, size: 16, color: burgundy),
        ],
      ),
    );
  }

  Widget _menu(
    BuildContext context,
    IconData icon,
    String judul,
    String deskripsi,
    Color warna,
    Widget halaman,
  ) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () => buka(context, halaman),
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: const Color(0xFFEED9DF)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: warna.withValues(alpha: 0.10),
                  borderRadius: BorderRadius.circular(13),
                ),
                child: Icon(icon, color: warna, size: 25),
              ),
              const Spacer(),
              Text(
                judul,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF35232A),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                deskripsi,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 10,
                  color: mutedText,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
