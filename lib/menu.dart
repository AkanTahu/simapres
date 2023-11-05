import 'package:flutter/material.dart';
import 'main.dart';
import 'daftarprestasi.dart';
import 'rangkingSaya.dart';
import './admin/login.dart';
import 'daftarJurusan.dart';
import 'inputSertifikat.dart';
import 'package:pretty_animated_buttons/pretty_animated_buttons.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});
  final Color btnColor = Colors.teal;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Image.asset('assets/logo.png', scale: 0.5),
          PrettyWaveButton(
            child: const Text(
              'Rangking Anda',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BelajarForm()),
                );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: PrettyWaveButton(
              child: const Text(
                'Rangking per Jurusan',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RankingJurusan()),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: PrettyWaveButton(
              child: const Text(
                'Daftar Prestasi',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DaftarPrestasi()),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: PrettyWaveButton(
              child: const Text(
                'Input Sertifikat',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const inputSertifikat()),
                );
              },
            ),
          ),
          PrettySlideIconButton(
            foregroundColor: btnColor,
            icon: Icons.arrow_forward,
            label: 'Masuk Admin',
            slidePosition: SlidePosition.right,
            labelStyle: Theme.of(context).textTheme.bodyLarge!,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginAdmin()),
              );
            },
          ),
        ],
      ),
    );
  }
}
