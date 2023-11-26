import 'package:flutter/material.dart';
import 'main.dart';
import 'package:dio/dio.dart';
import 'rangkingSaya.dart';
import 'daftarJurusan.dart';
import 'login.dart';
import 'registerMhsSertif.dart';
import 'package:pretty_animated_buttons/pretty_animated_buttons.dart';
import 'package:button_animations/button_animations.dart';
import 'package:button_animations/constants.dart';
import 'package:google_fonts/google_fonts.dart';

final dio = Dio();
var all_data = [];
var top5Data = [];
// String url_domain = "http://192.168.0.105:8080/";
String url_domain = "http://127.0.0.1:8000/";
String url_all_data = url_domain + "api/all_data";
String url_top5 = url_domain + "api/top5_data";
String url_create_data = url_domain + "api/create_data";
String url_show_data = url_domain + "api/show_data";
String url_update_data = url_domain + "api/edit_data";
String url_delete_data = url_domain + "api/delete_data";

class MyAppMenu extends StatelessWidget {
  const MyAppMenu({super.key});
// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SIMAPRES',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: data_tes(),
    );
  }
}

class data_tes extends StatefulWidget {
  const data_tes({super.key});
  @override
  State<data_tes> createState() => _data_tesState();
}

class _data_tesState extends State<data_tes> with WidgetsBindingObserver {
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print('MyAppMenu state = $state');
    if (state == AppLifecycleState.inactive) {
// app transitioning to other state.
    } else if (state == AppLifecycleState.paused) {
// app is on the background.
    } else if (state == AppLifecycleState.detached) {
// flutter engine is running but detached from views
    } else if (state == AppLifecycleState.resumed) {
// app is visible and running.
      runApp(MyAppMenu()); // run your App class again
    }
  }

  @override
  Widget build(BuildContext context) {
    showtop5();
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
                  padding: const EdgeInsets.fromLTRB(20, 50, 0, 10),
                  child: Text(
                    'SIMAPRES POLINEMA',
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w700, fontSize: 15),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 40, 20, 0),
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
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: Container(
                width: 320,
                height: 350,
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
                            fontWeight: FontWeight.w700, fontSize: 20),
                      ),
                      DataTable(
                        columns: [
                          DataColumn(label: Text('Peringkat')),
                          DataColumn(label: Text('Nama')),
                          DataColumn(label: Text('Jurusan')),
                          DataColumn(label: Text('Prodi')),
                        ],
                        rows: [
                          for (var data in top5Data)
                            DataRow(cells: [
                              DataCell(Text('1')),
                              DataCell(Text(data['nama'])),
                              DataCell(Text(data['prodi'])),
                              DataCell(Text(data['jurusan'])),
                            ]),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Image.asset('assets/logo.png', scale: 0.5),
            Container(
              child: MaterialButton(
                color: Colors.grey,
                height: 30,
                minWidth: 20,
                onPressed: () {
                  didChangeAppLifecycleState(AppLifecycleState.resumed);
                },
                child: Text("Refresh Data"),
              ),
            ),
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
                        builder: (context) => Login()),
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
                    MaterialPageRoute(
                        builder: (context) => const RegisterAkunMhs()),
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

void show_all_data() async {
  Response response;
  response = await dio.post(
    url_all_data,
  );
  all_data = response.data;
}

void showtop5() async { 
  Response response;
  response = await dio.post(
    url_top5,
  );
  top5Data = response.data;
}
