import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pretty_animated_buttons/pretty_animated_buttons.dart';

TextEditingController namaMhs = new TextEditingController();
TextEditingController umurMhs = new TextEditingController();
TextEditingController ttlMhs = new TextEditingController();
TextEditingController notelpMhs = new TextEditingController();
TextEditingController jenisklmMhs = new TextEditingController();
TextEditingController nimMhs = new TextEditingController();
TextEditingController nilaiIPMhs = new TextEditingController();
TextEditingController kehadiranMhs = new TextEditingController();

class EditDataMhs extends StatefulWidget {
  const EditDataMhs({Key? key}) : super(key: key);

  @override
  _EditDataMhsState createState() => _EditDataMhsState();
}

class _EditDataMhsState extends State<EditDataMhs> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Halaman Admin"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(13),
            child: TextField(
              controller: namaMhs,
              decoration: InputDecoration(
                labelText: "Masukkan nama Mahasiswa",
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
              controller: umurMhs,
              decoration: InputDecoration(
                labelText: "Masukkan umur Mahasiswa",
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
              controller: ttlMhs,
              decoration: InputDecoration(
                labelText: "Masukkan Tempat Tanggal Lahir Mahasiswa",
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
              controller: notelpMhs,
              decoration: InputDecoration(
                labelText: "Masukkan Nomor Telepon Mahasiswa",
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
              controller: jenisklmMhs,
              decoration: InputDecoration(
                labelText: "Masukkan Jenis Kelamin",
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
              controller: nimMhs,
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
              controller: nilaiIPMhs,
              decoration: InputDecoration(
                labelText: "Masukkan Nilai IP Mahasiswa",
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
              controller: kehadiranMhs,
              decoration: InputDecoration(
                labelText: "Masukkan Kehadiran ALPA",
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