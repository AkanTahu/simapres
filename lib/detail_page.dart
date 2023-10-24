import 'package:flutter/material.dart';

const List<String> list = <String>[
  'Jurusan',
  'Se-Polinema',
];

class DetailPage extends StatelessWidget {
  //required artinya paramter wajib diisi saat dipanggil di halaman lain
  DetailPage({required this.nim});

  String nim;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data Mahasiswa"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButtonExample(),
          ),
          Image.network('hhttps://cdns.klimg.com/resized/670x/g/e/d/editan_pas_foto_selebriti_bikin_ngakak/p/meme_lucu-20190417-001-rita.jpg'),
          Text('Nama : Bruno Mars'),
          Text('NIM : 2141762078'),
          Text('Jurusan : Teknologi Informasi'),
          Text('Prodi : Sistem Informasi Bisnis'),
        ],
      )),
    );
  }
}

class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({super.key});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 20,
      style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
      underline: Container(
        height: 3,
        color: Color.fromARGB(255, 71, 69, 69),
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: TextStyle(fontSize: 20),
          ),
        );
      }).toList(),
    );
  }
}
