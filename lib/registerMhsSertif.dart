import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'main.dart';
import 'package:pretty_animated_buttons/pretty_animated_buttons.dart';

TextEditingController inputUser = new TextEditingController();
TextEditingController inputNIMmhs = new TextEditingController();
TextEditingController inputPass = new TextEditingController();

class RegisterAkunMhs extends StatefulWidget {
  const RegisterAkunMhs({Key? key}) : super(key: key);

  @override
  _RegisterAkunMhsState createState() => _RegisterAkunMhsState();
}

class _RegisterAkunMhsState extends State<RegisterAkunMhs> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" Register Mahasiswa"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
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
            onPressed: (){},
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