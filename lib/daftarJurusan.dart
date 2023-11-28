import 'package:flutter/material.dart';
import 'package:simapres/admin/inputDataMhs.dart';
import 'package:simapres/main.dart';
import 'rangkingPerJurusan.dart';

// import 'RankJurusan.dart';

// void main() {
//   runApp(MaterialApp(
//     home: daftarJurusan(),
//   ));
// }

class daftarJurusan extends StatefulWidget {
  _daftarJurusanState createState() => _daftarJurusanState();
}

class _daftarJurusanState extends State<daftarJurusan> {
  String? selectedValue;
  Widget build(BuildContext context) {
    return Scaffold(
      // home: Scaffold(
      backgroundColor: Color.fromARGB(197, 98, 202, 195),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Yuk, pilih jurusanmu sekarang!!",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal)),
            //Dropdown
            Container(
              margin: EdgeInsets.only(left: 50, top: 50, right: 50, bottom: 50),
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10)),
              child: DropdownButton<String?>(
                  hint: Text("Pilih Jurusan"),
                  value: selectedValue,
                  onChanged: (value) {
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
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shadowColor: Colors.indigo,
                elevation: 10,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DaftarRanking()),
                );
              },
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "SUBMIT",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16.0),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      // ),
    );
  }
}
