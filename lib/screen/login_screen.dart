
import 'package:flutter/material.dart';

const Color burgundy = Color(0xFF701A32);
const Color blush = Color(0xFFF6E3E8);
const Color softBackground = Color(0xFFFFF7F8);

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool passwordTampil = false;

  void masuk() {
    Navigator.pushReplacementNamed(context, '/dashboard');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: softBackground,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400),
            child: Container(
              padding: const EdgeInsets.all(28),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(28),
                border: Border.all(color: blush),
                boxShadow: [
                  BoxShadow(
                    color: burgundy.withValues(alpha: 0.08),
                    blurRadius: 28,
                    offset: const Offset(0, 12),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 76,
                    height: 76,
                    decoration: BoxDecoration(
                      color: blush,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: const Icon(
                      Icons.school_rounded,
                      color: burgundy,
                      size: 42,
                    ),
                  ),
                  const SizedBox(height: 22),
                  const Text(
                    'PresensiKu',
                    style: TextStyle(
                      color: burgundy,
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 7),
                  const Text(
                    'Sistem Presensi Siswa SMA',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF806772),
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(height: 32),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Selamat Datang!',
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF35232A),
                      ),
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Silakan masuk untuk melanjutkan.',
                      style: TextStyle(
                        color: Color(0xFF806772),
                        fontSize: 12,
                      ),
                    ),
                  ),
                  const SizedBox(height: 22),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Username',
                      prefixIcon: const Icon(
                        Icons.person_outline_rounded,
                        color: burgundy,
                      ),
                      filled: true,
                      fillColor: softBackground,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextField(
                    obscureText: !passwordTampil,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon: const Icon(
                        Icons.lock_outline_rounded,
                        color: burgundy,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            passwordTampil = !passwordTampil;
                          });
                        },
                        icon: Icon(
                          passwordTampil
                              ? Icons.visibility_off_rounded
                              : Icons.visibility_rounded,
                          color: burgundy,
                        ),
                      ),
                      filled: true,
                      fillColor: softBackground,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: ElevatedButton(
                      onPressed: masuk,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: burgundy,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: const Text(
                        'MASUK',
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          letterSpacing: 1,
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
    );
  }
}
