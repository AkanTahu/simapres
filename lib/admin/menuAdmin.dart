import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'inputDataMhs.dart';
import 'findNIMmhs.dart';
import 'package:pretty_animated_buttons/pretty_animated_buttons.dart';

class MenuAdmin extends StatefulWidget {
  const MenuAdmin({Key? key}) : super(key: key);

  @override
  _MenuAdminState createState() => _MenuAdminState();
}

class _MenuAdminState extends State<MenuAdmin> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Halaman Admin"),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: PrettyWaveButton(
                          child: const Text(
                            'Input Data Mahasiswa',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const InputDataMhs()),
                        );
                      },
                        ),
                    ),
              Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: PrettyWaveButton(
                          child: const Text(
                            'Edit Data Mahasiswa',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const FindNIMmhs()),
                        );
                      },
                        ),
                  ),      
            ],
          ),
        ],
      ),

      // Display the contents from the CSV file
    );
  }
}  