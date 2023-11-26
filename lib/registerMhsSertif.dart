import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simapres/tesbackend.dart';
import 'main.dart';
import 'package:pretty_animated_buttons/pretty_animated_buttons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dio/dio.dart';

TextEditingController inputUser = new TextEditingController();
TextEditingController inputNIMmhs = new TextEditingController();
TextEditingController inputPass = new TextEditingController();

final dio = Dio();
// String url_domain = "http://192.168.0.105:8080/";
String url_domain = "http://127.0.0.1:8000/";
String url_create_data = url_domain + "api/create_data";
String url_updateAkun = url_domain + "api/updateAkun";

class RegisterAkunMhs extends StatefulWidget {
  const RegisterAkunMhs({Key? key}) : super(key: key);

  @override
  _RegisterAkunMhsState createState() => _RegisterAkunMhsState();
}

class _RegisterAkunMhsState extends State<RegisterAkunMhs> {
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
                  ),),
                child: new Center(
                  child: Image(image: AssetImage('assets/SIMAPRESputih.png'))
                )),
          ),
          Center(
            child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Text(
                      'REGISTRASI',
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w700, fontSize: 30),
                    ),
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(13),
            child: TextField(
              controller: inputUser,
              decoration: InputDecoration(
                labelText: "Masukkan Username Mahasiswa",
                prefixIcon: Icon(Icons.people),
                border: myinputborder(),
                enabledBorder: myinputborder(),
                focusedBorder: myfocusborder(),
              ), // Only numbers can be entered
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(13),
            child: TextField(
              controller: inputNIMmhs,
              decoration: InputDecoration(
                labelText: "Masukkan NIM Mahasiswa",
                prefixIcon: Icon(Icons.people),
                border: myinputborder(),
                enabledBorder: myinputborder(),
                focusedBorder: myfocusborder(),
              ), // Only numbers can be entered
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(13),
            child: TextField(
              controller: inputPass,
              decoration: InputDecoration(
                labelText: "Masukkan Password",
                prefixIcon: Icon(Icons.people),
                border: myinputborder(),
                enabledBorder: myinputborder(),
                focusedBorder: myfocusborder(),
              ), // Only numbers can be entered
            ),
          ),
          PrettyNeumorphicButton(
            label: 'Submit',
            onPressed: () {
              updateAkun(inputUser.text, inputNIMmhs.text, inputPass.text);
            },
          ),
        ],
      ),

      // Display the contents from the CSV file
    );
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

void updateAkun(String username, String nim, String password) async {
  Response response;
  response = await dio.post(
    url_updateAkun,
    queryParameters: {'username': username, 'nim': nim, 'password': password},
  );
  inputUser.text = "";
  inputNIMmhs.text = "";
  inputPass.text = "";
}
