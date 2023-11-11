import 'package:flutter/material.dart';
import 'main.dart';
import 'rangkingSaya.dart';
import './admin/login.dart';
import 'daftarJurusan.dart';
import 'inputSertifikat.dart';
import 'package:pretty_animated_buttons/pretty_animated_buttons.dart';
import 'package:button_animations/button_animations.dart';
import 'package:button_animations/constants.dart';
import 'package:google_fonts/google_fonts.dart';


class Menu extends StatelessWidget {
  const Menu({super.key});
  final Color btnColor = Colors.teal;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 0, 10),
                  child: Text(
                    'SIMAPRES POLINEMA',
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w700, fontSize: 30),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 20, 0),
                  child: Icon(
                    Icons.notifications_none,
                    color: Colors.black,
                    size: 40,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: Container(
                width: 520,
                height: 100,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                    width: 2.0,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                    bottomLeft: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 86, 91, 94)!,
                      offset: const Offset(
                        5.0,
                        5.0,
                      ),
                      blurRadius: 10.0,
                      spreadRadius: 2.0,
                    ),
                    //BoxShadow
                    BoxShadow(
                      color: Colors.white,
                      offset: const Offset(0.0, 0.0),
                      blurRadius: 0.0,
                      spreadRadius: 0.0,
                    ), //BoxShadow
                  ],
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Text(
                      "Selamat Datang di Daftar Ranking Mahasiswa Berprestasi Politeknik Negeri Malang",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                        fontSize: 23,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: Container(
                width: 520,
                height: 250,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                    width: 2.0,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                    bottomLeft: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 86, 91, 94)!,
                      offset: const Offset(
                        5.0,
                        5.0,
                      ),
                      blurRadius: 10.0,
                      spreadRadius: 2.0,
                    ),
                    //BoxShadow
                    BoxShadow(
                      color: Colors.white,
                      offset: const Offset(0.0, 0.0),
                      blurRadius: 0.0,
                      spreadRadius: 0.0,
                    ), //BoxShadow
                  ],
                ),
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        'RANK SEPOLINEMA',
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w700, fontSize: 30),
                      ),
                      DataTable(
                        columns: [
                          DataColumn(label: Text('Peringkat')),
                          DataColumn(label: Text('Nama')),
                          DataColumn(label: Text('Jurusan')),
                          DataColumn(label: Text('Prodi')),
                        ],
                        rows: [
                          DataRow(cells: [
                            DataCell(Text('1')),
                            DataCell(Text('Febri putri')),
                            DataCell(Text('Teknik Elektro')),
                            DataCell(Text('D-IV SKL')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('2')),
                            DataCell(Text('Shafa Ardhia')),
                            DataCell(Text('Teknik Sipil')),
                            DataCell(Text('D-IV MRK')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('3')),
                            DataCell(Text('Bimo Ardi')),
                            DataCell(Text('Teknik Mesin')),
                            DataCell(Text('D-III TM')),
                          ]),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Image.asset('assets/logo.png', scale: 0.5),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: AnimatedButton(
                child: Text(
                  "Rangking Anda",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BelajarForm()),
                  );
                },
                blurRadius: 10,
                isMultiColor: true,
                colors: [
                  Colors.green,
                  Colors.blue,
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: AnimatedButton(
                child: Text(
                  "Rangking Per Jurusan",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RankingJurusan()),
                  );
                },
                blurRadius: 10,
                isMultiColor: true,
                colors: [
                  Colors.green,
                  Colors.blue,
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: AnimatedButton(
                child: Text(
                  "Input Sertifikat",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const inputSertifikat()),
                  );
                },
                blurRadius: 10,
                isMultiColor: true,
                colors: [
                  Colors.green,
                  Colors.blue,
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: AnimatedButton(
                child: Text(
                  "Buat Akun",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginAdmin()),
                  );
                },
                blurRadius: 10,
                isMultiColor: true,
                colors: [Colors.red, Colors.blue],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
