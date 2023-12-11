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

final dio = Dio();
TextEditingController inputtingkat = new TextEditingController();
// String url_domain = "http://192.168.0.105:8080/";
String url_domain = "http://127.0.0.1:8000/";
String url_pilihJus = url_domain + "api/pilihJus";

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
      home: DaftarJurusan(),
    );
  }
}

class DaftarJurusan extends StatefulWidget {
  const DaftarJurusan({Key? key}) : super(key: key);

  @override
  _DaftarJurusanState createState() => _DaftarJurusanState();
}

class _DaftarJurusanState extends State<DaftarJurusan> with WidgetsBindingObserver {
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  String? selectedValue;
  Widget build(BuildContext context) {
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
                'Pilih Jurusan',
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w700, fontSize: 30),
              ),
            ),
          ),
          Container(
              margin: EdgeInsets.only(left: 50, top: 20, right: 50, bottom: 20),
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10)),
              child: DropdownButton<String?>(
                  hint: Text("Pilih Jurusan"),
                  value: selectedValue,
                  onChanged: (value) {
                    inputtingkat.text = value!;
                    setState(() {
                      selectedValue = value;
                    });
                  },
                  underline: SizedBox(),
                  isExpanded: true,
                  items: [
                    "Teknologi Informasi",
                    "Akutansi",
                    "Teknik Mesin",
                    "Teknik Elektro",
                    "Teknik Kimia",
                    "Administrasi Niaga",
                    "Teknik Sipil"
                  ]
                      .map<DropdownMenuItem<String?>>((e) => DropdownMenuItem(
                            child: Text(e.toString()),
                            value: e,
                          ))
                      .toList()),
            ),
            PrettyNeumorphicButton(
                    label: 'Submit',
                    onPressed: () => {
                      pilihJus(inputtingkat.text),
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>  DaftarRanking()),
                      )
                    },
                  ),
        ],
      ),

      // Display the contents from the CSV file
    );
  }
}

void pilihJus(String jurusanmhs) async {
  Response response;
  response = await dio.post(
    url_pilihJus,
    queryParameters: {'jurusanmhs': jurusanmhs},
  );
  inputtingkat.text = "";
}
