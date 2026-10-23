# Catatan Penggunaan AI & Transparansi Proyek - PresensiKu

Dokumen ini saya buat untuk menjelaskan bagaimana saya memanfaatkan bantuan teknologi *Artificial Intelligence* (AI) selama proses coding dan pengerjaan aplikasi UTS **PresensiKu**, yaitu aplikasi presensi siswa berbasis Flutter.

## 1. Tool AI yang Saya Pakai

- **ChatGPT:** Saya gunakan sebagai teman diskusi untuk membantu memahami kode Flutter, menyusun dan memperbaiki kode Dart, serta mengembangkan fitur pada aplikasi PresensiKu.
- **Visual Studio Code:** Saya gunakan sebagai editor utama untuk menulis, mengubah, dan mengelola kode program.
- **Flutter Analyze:** Saya gunakan untuk memeriksa masalah yang dapat dideteksi melalui analisis statis kode.

## 2. Bagian Mana yang Dibantu AI vs Dikerjakan Sendiri?

- **Bagian yang Dibantu AI:**
  - Membantu menyusun dan memperbaiki tampilan halaman dashboard, data guru, jadwal pelajaran, presensi siswa, dan riwayat presensi.
  - Membantu menyusun logika pengelolaan data guru dan jadwal pelajaran.
  - Membantu menambahkan nama guru pada catatan presensi.
  - Membantu memperbaiki tampilan riwayat presensi, termasuk filter tanggal dan kelas serta detail kehadiran siswa.
  - Memberikan arahan untuk menyimpan perubahan kode menggunakan Git dan GitHub.

- **Bagian yang Saya Kerjakan dan Sesuaikan Sendiri:**
  - Menerapkan kode yang diberikan AI ke dalam struktur folder proyek PresensiKu.
  - Menyesuaikan kode dengan file dan fungsi yang sudah ada pada proyek.
  - Memeriksa hasil perubahan menggunakan `flutter analyze`.
  - Menyimpan perubahan kode melalui commit dan push ke GitHub.
  - Memeriksa tampilan aplikasi dan menentukan bagian yang masih perlu diperbaiki.

## 3. Contoh Proses Tanya Jawab (Prompting) dan Penyesuaian

Selama proses pengerjaan, saya menggunakan AI untuk membantu menyelesaikan kendala pada beberapa bagian aplikasi. Berikut contoh prompt yang sesuai dengan pekerjaan pengembangan PresensiKu.

- **Kasus 1: Menghubungkan Nama Guru dengan Jadwal Pelajaran**
  - **Pertanyaan ke AI:** *"Bantu perbaiki halaman jadwal pelajaran agar menampilkan nama guru dari data guru yang tersedia, bukan hanya tulisan Guru Matematika atau nama mata pelajaran."*
  - **Bantuan AI:** AI membantu menyusun logika untuk menampilkan nama guru berdasarkan data yang tersedia pada aplikasi.
  - **Penyesuaian Saya:** Saya menerapkan perubahan pada halaman jadwal pelajaran agar nama guru dapat ditampilkan dan dipilih sesuai data guru yang tersedia.

- **Kasus 2: Memperbaiki Riwayat Presensi**
  - **Pertanyaan ke AI:** *"Bantu perbaiki halaman riwayat presensi agar menampilkan nama guru, memiliki filter tanggal dan kelas, serta menampilkan detail status kehadiran setiap siswa."*
  - **Bantuan AI:** AI membantu menyusun tampilan riwayat dengan filter tanggal dan kelas serta detail presensi menggunakan `ExpansionTile`.
  - **Penyesuaian Saya:** Saya menerapkan perubahan pada `riwayat_screen.dart` dan menyesuaikannya dengan struktur data presensi pada proyek.

## 4. Evaluasi Kritis Penggunaan AI

AI membantu mempercepat proses pengembangan, tetapi kode yang diberikan tidak selalu dapat langsung digunakan tanpa penyesuaian. Perubahan pada satu file terkadang memerlukan perubahan pada file lain yang saling berhubungan.

Untuk mengurangi kesalahan, saya memeriksa struktur kode dan menjalankan `flutter analyze`. Pada pemeriksaan terakhir, hasilnya menunjukkan `No issues found!`. Namun, hasil tersebut hanya menunjukkan bahwa tidak ada masalah yang dilaporkan oleh analisis statis. Pengujian langsung tetap diperlukan untuk memastikan fitur aplikasi berjalan sesuai kebutuhan.

## 5. Rencana Pengembangan Menuju Akhir Proyek

Beberapa target pengembangan yang perlu diselesaikan adalah:

1. Memastikan nama guru terhubung dengan jadwal pelajaran dan catatan presensi.
2. Memastikan riwayat presensi terpisah berdasarkan tanggal, kelas, dan mata pelajaran.
3. Menguji apakah data presensi tetap tersimpan setelah aplikasi ditutup dan dibuka kembali.
4. Menguji fitur login, data guru, data siswa, jadwal pelajaran, dan presensi secara langsung.
5. Memperbaiki kendala yang ditemukan selama pengujian sebelum proyek dinyatakan selesai.