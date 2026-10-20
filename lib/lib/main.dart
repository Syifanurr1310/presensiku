import 'package:flutter/material.dart';
import 'screen/login_screen.dart';
import 'screen/dashboard_screen.dart';

void main() {
  runApp(const PresensiKuApp());
}

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
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginPage(),
        '/dashboard': (context) => const DashboardPage(),
      },
    );
  }
}
