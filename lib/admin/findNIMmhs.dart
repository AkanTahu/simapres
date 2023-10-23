import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'editDataMhs.dart';
import 'package:pretty_animated_buttons/pretty_animated_buttons.dart';

TextEditingController nimMhs = new TextEditingController();

class FindNIMmhs extends StatefulWidget {
  const FindNIMmhs({Key? key}) : super(key: key);

  @override
  _FindNIMmhsState createState() => _FindNIMmhsState();
}

class _FindNIMmhsState extends State<FindNIMmhs> {
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
          PrettyNeumorphicButton(
            label: 'Submit',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const EditDataMhs()),
              );
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