import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'menuAdmin.dart';
import 'package:pretty_animated_buttons/pretty_animated_buttons.dart';

TextEditingController inputUserAdmin = new TextEditingController();
TextEditingController inputPassAdmin = new TextEditingController();

class LoginAdmin extends StatefulWidget {
  const LoginAdmin({Key? key}) : super(key: key);

  @override
  _LoginAdminState createState() => _LoginAdminState();
}

class _LoginAdminState extends State<LoginAdmin> {
  @override
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
              controller: inputUserAdmin,
              decoration: InputDecoration(
                labelText: "Masukkan Username Admin",
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
              controller: inputPassAdmin,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock),
                labelText: "Masukkan Password Admin",
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
                MaterialPageRoute(builder: (context) => const MenuAdmin()),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: PrettyNeumorphicButton(
              label: 'Forgot Password',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LupaPass()),
                );
              },
            ),
          )
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

class LupaPass extends StatelessWidget {
  const LupaPass({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}
