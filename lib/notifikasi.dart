import 'package:flutter/material.dart';
import 'main.dart';
import 'package:dio/dio.dart';
import 'package:pretty_animated_buttons/pretty_animated_buttons.dart';
import 'package:button_animations/button_animations.dart';
import 'package:button_animations/constants.dart';
import 'package:google_fonts/google_fonts.dart';

final dio = Dio();
// String url_domain = "http://192.168.0.105:8080/";
String url_domain = "http://127.0.0.1:8000/";
String url_login_mhs = url_domain + "api/loginNotif";

class Notifikasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            new Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 50, 0, 20),
                child: Image(
                  image: AssetImage('assets/SIMAPRESputih.png'),
                  height: 200,
                  width: 200,
                ),
              ),
            ),
            Container(
              width: 320,
              height: 350,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white.withOpacity(0.3),
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'NOTIFIKASI',
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w700, fontSize: 30),
                  ),
                ],
              ),
            ),
          ],
        ) /* add child content here */,
      ),
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

void loginNotif(String username, String password) async {
  Response response;
  response = await dio.post(
    url_login_mhs,
    queryParameters: {'username': username, 'password': password},
  );

  // inputUser.text = "";
  // inputPass.text = "";
}
