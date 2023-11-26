import 'package:flutter/material.dart';
import 'package:simapres/admin/inputDataMhs.dart';
import 'package:simapres/main.dart';

class daftarJurusan extends StatefulWidget {
  _daftarJurusanState createState() => _daftarJurusanState();
}

class _daftarJurusanState extends State<daftarJurusan> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Pilih Jurusan'),
        ),
        backgroundColor: Color.fromARGB(198, 64, 181, 174),
        body: Container(
          child: DropdownButton<String?>(
              value: null,
              onChanged: (value) {},
              items: ["JTI", "AK", "Mesin", "Elektro", "Tekkim"]
                  .map<DropdownMenuItem<String?>>((e) => DropdownMenuItem(
                        child: Text(e.toString()),
                        value: e,
                      ))
                  .toList()),
        ),
      ),
    );
  }
}
