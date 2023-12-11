import 'package:simapres/daftarJurusan.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simapres/backup/tesbackend.dart';
import 'package:simapres/rangkingPerJurusan.dart';
import 'main.dart';
import 'package:pretty_animated_buttons/pretty_animated_buttons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dio/dio.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:collection/collection.dart';

final dio = Dio();
var data = [];
// String url_domain = "http://192.168.0.105:8080/";
String url_domain = "http://127.0.0.1:8000/";
String url_show = url_domain + "api/showrankJus";

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
      home: DaftarRanking(),
    );
  }
}

class DaftarRanking extends StatefulWidget {
  const DaftarRanking({Key? key}) : super(key: key);

  @override
  _DaftarRankingState createState() => _DaftarRankingState();
}

class _DaftarRankingState extends State<DaftarRanking>
    with WidgetsBindingObserver {
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

  Widget build(BuildContext context) {
    showdataJus();
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              height: 180.0,
              // width: 300.0,
              color: Colors.transparent,
              child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 1, 159, 151),
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(50),
                    ),
                  ),
                  child: new Center(
                      child: Image(
                          image: AssetImage('assets/SIMAPRESputih.png')))),
            ),
            Text(
              'RANK JURUSAN',
              style:
                  GoogleFonts.inter(fontWeight: FontWeight.w700, fontSize: 20),
            ),
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
            DataTable(
              columns: [
                DataColumn(label: Text('Ranking')),
                DataColumn(label: Text('Nama')),
                DataColumn(label: Text('Prodi')),
                // DataColumn(label: Text('Waktu')),
              ],
              rows: [
                for (var datas in data)
                  DataRow(cells: [
                    DataCell(Text(datas['peringkat'].toString())),
                    DataCell(Text(datas['namamhs'])),
                    DataCell(Text(datas['prodimhs'])),
                  ]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void showdataJus() async {
  Response response;
  response = await dio.post(
    url_show,
  );
  data = response.data;
}
