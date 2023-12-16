import 'package:flutter/material.dart';
import 'detail_page.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simapres/backup/tesbackend.dart';
import 'main.dart';
import 'package:pretty_animated_buttons/pretty_animated_buttons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dio/dio.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

final dio = Dio();
var datamhs = [];
String url_domain = "http://127.0.0.1:8000/";
String url_showRangkingSaya = url_domain + "api/RangkingSaya";

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
      home: DetailPage(),
    );
  }
}

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> with WidgetsBindingObserver {
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
    showdata();
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
            for (var datas in datamhs)
            Column(
              children: [ 
                Text(
                datas['nama'],
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w700, fontSize: 20),
              ),
              Text(
                "Tahun Masuk = " + datas['tahunMasuk'].toString(),
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500, fontSize: 10),
              ),
              Text(
                "Jurusan = " + datas['jurusan'],
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500, fontSize: 10),
              ),
              Text(
                "Progam Studi = " + datas['prodi'],
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500, fontSize: 10),
              ),
              Text(
                "IPK = " + datas['ipkORI'],
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500, fontSize: 10),
              ),
              Text(
                "Alpha = " + datas['alphaORI'].toString() + ' hari',
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500, fontSize: 10),
              ),
              Text(
                "RANGKING SE-POLINEMA",
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w700, fontSize: 20),
              ),
              Text(
                "#" + datas['id_peringkat'].toString(),
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w700, fontSize: 40),
              ),
              Text(
                "SERTIFIKAT",
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500, fontSize: 10),
              ),
              Text(
                "Nama Kejuaraan = " + datas['namaSertif'],
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500, fontSize: 10),
              ),
              Text(
                "Tingkat dan Juara = " + datas['tingkatSertif'] + " " + datas['juaraSertif'],
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500, fontSize: 10),
              ),
            ]),
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
          ],
        ),
      ),
    );
  }
}

void showdata() async {
  Response response;
  response = await dio.post(
    url_showRangkingSaya,
  );
  datamhs = response.data;
}
