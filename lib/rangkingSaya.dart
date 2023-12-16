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

void main() {
  runApp(MaterialApp(
    title: "Cari Prestasi",
    home: BelajarForm(),
  ));
}
final dio = Dio();
TextEditingController inputnim = new TextEditingController();
// String url_domain = "http://192.168.0.105:8080/";
String url_domain = "http://127.0.0.1:8000/";
String url_inputnim = url_domain + "api/inputnim";

class BelajarForm extends StatefulWidget {
  @override
  _BelajarFormState createState() => _BelajarFormState();
}

class _BelajarFormState extends State<BelajarForm> {
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // untuk membuat form input tambahakan widget form()
        body: Column(
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
                  child: Image(image: AssetImage('assets/SIMAPRESputih.png')))),
        ),
        Form(
          key: _formKey,
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              //agar semua widget diposisi kiri
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //textformfield digunakan untuk membuat widget form
                // TextFormField(
                //   //memberikan identitas untuk setiap form
                //   controller: inputnim,
                //   decoration: InputDecoration(
                //     hintText: "Masukkan NIM Anda",
                //     labelText: "NIM",
                //   ),
                //   //memberikan validasi jika form kosong
                //   validator: (value) {
                //     if (value!.isEmpty) {
                //       return 'NIM tidak boleh kosong';
                //     }
                //     return null;
                //   },
                // ),
                //memberikan jarak
                Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                    child: TextField(
                      controller: inputnim,
                      decoration: InputDecoration(
                        labelText: "Masukkan NIM Kamu",
                        prefixIcon: Icon(Icons.people),
                        border: myinputborder(),
                        enabledBorder: myinputborder(),
                        focusedBorder: myfocusborder(),
                      ), // Only numbers can be entered
                    ),
                  ),
                SizedBox(height: 20),
                //membuat button untuk mengirim dataw
                PrettyNeumorphicButton(
                    label: 'Submit',
                    onPressed: () => sweatAlert(context),
                  )
              ],
            ),
          ),
        ),
      ],
    ));
  }
    OutlineInputBorder myinputborder() {
    //return type is OutlineInputBorder
    return OutlineInputBorder(
        //Outline border type for TextFeild
        borderRadius: BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide(
          color: Colors.redAccent,
          width: 3,
        ));
  }

  OutlineInputBorder myfocusborder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide(
          color: Colors.greenAccent,
          width: 3,
        ));
  }
}

void fieldnim(String nim) async {
  Response response;
  response = await dio.post(
    url_inputnim,
    queryParameters: {'nim': nim},
  );
  inputnim.text = "";
}

void sweatAlert(BuildContext context) {
  Alert(
    context: context,
    type: AlertType.success,
    title: "NIM Ditemukan",
    desc: "Silahkan Melihat Rangking Anda",
    buttons: [
      DialogButton(
        child: Text(
          "Selanjutnya",
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
        onPressed: () {
                      fieldnim(inputnim.text);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailPage()),
                      );
                    },
      )
    ],
  ).show();

  return;
}


