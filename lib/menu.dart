import 'package:flutter/material.dart';
import 'main.dart';
import 'daftarprestasi.dart';
import 'package:pretty_animated_buttons/pretty_animated_buttons.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Image.asset('assets/logo.png', scale: 0.5),
              PrettyWaveButton(
                child: const Text(
                  'Rangking Anda',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () {},
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
                      onPressed: () {},
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
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  },
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
