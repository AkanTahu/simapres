import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simapres/tesbackend.dart';
import 'main.dart';

import 'package:pretty_animated_buttons/pretty_animated_buttons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dio/dio.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

final dio = Dio();
var data = [];
// String url_domain = "http://192.168.0.105:8080/";
String url_domain = "http://127.0.0.1:8000/";
String url_show = url_domain + "api/showNotif";

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
      home: Notifikasi(),
    );
  }
}

class Notifikasi extends StatefulWidget {
  const Notifikasi({Key? key}) : super(key: key);

  @override
  _NotifikasiState createState() => _NotifikasiState();
}

class _NotifikasiState extends State<Notifikasi> with WidgetsBindingObserver {
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
    showNotif();
    return Scaffold(
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
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
                    child:
                        Image(image: AssetImage('assets/SIMAPRESputih.png')))),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Text(
                'NOTIFIKASI "NAMA"',
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w700, fontSize: 30),
              ),
            ),
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
          for (var dt in data)
            Container(
              width: 400,
              height: 120,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 1, 159, 151),
                  borderRadius: BorderRadius.circular(20),
                ),
              child: Center(
                child: Column(
                  children: [
                    Text(
                      "Nama Kejuaraan : " + dt['namaSertif'],
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        
                      ),
                    ),
                    if (dt['cek'] == 0)
                      Text(
                        "Status : Belum diCek",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      )
                    else if (dt['cek'] == 1)
                      Text(
                        "Status : Valid",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      )
                    else if (dt['cek'] == 2)
                      Text(
                        "Status : Ditolak",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    if (dt['cek'] == 0)
                      Text(
                        "Belum Dicek oleh Admin, Silahkan Menunggu untuk Konfirmasi",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      )
                    else if (dt['cek'] == 1)
                      Text(
                        "Data Valid, Silahkan Melihat Rangking Anda",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      )
                    else if (dt['cek'] == 2)
                      Text(
                        "Data Ditolak, Silahkan Mengisi data Sertifikat dengan Benar",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      )
                  ],
                ),
              ),
            )
        ],
      ),

      // Display the contents from the CSV file
    );
  }
}

void showNotif() async {
  Response response;
  response = await dio.post(
    url_show,
  );
  data = response.data;
}
