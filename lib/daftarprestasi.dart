import 'package:flutter/material.dart';


const List<String> list = <String>[
  'Tingkat Prestasi Kota',
  'Tingkat Prestasi Provinsi',
  'Tingkat Prestasi Nasional',
  'Tingkat Prestasi Internasional',
  'Terbaru'
];

class DaftarPrestasi extends StatefulWidget {
  _DaftarPrestasiState createState() => _DaftarPrestasiState();
}

class _DaftarPrestasiState extends State<DaftarPrestasi> {

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 232, 240, 237),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 64, 65, 68),
        title: Text('Tugas Pemograman Mobile'),
      ),
      body: Column(
        children: [
          Center(
            child: Text('Tabel Mahasiswa Berprestasi',
                style:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
         DropdownButtonExample(),
          DataTable(
            columns: [
              DataColumn(label: Text('Nama')),
              DataColumn(label: Text('Prestasi')),
              DataColumn(label: Text('Tingkat')),
              DataColumn(label: Text('Waktu')),
            ],
            rows: [
              DataRow(cells: [
                DataCell(Text('Febri putri')),
                DataCell(Text('Juara 1 olimpiade KSN')),
                DataCell(Text('Nasional')),
                DataCell(Text('2022')),
              ]),
              DataRow(cells: [
                DataCell(Text('Shafa Ardhia')),
                DataCell(Text('Juara 3 OSN')),
                DataCell(Text('Internasional')),
                DataCell(Text('2023')),
              ]),
              DataRow(cells: [
                DataCell(Text('Bimo Ardi')),
                DataCell(Text('Juara 3 TOKI')),
                DataCell(Text('Nasional')),
                DataCell(Text('2020')),
              ]),
            ],
          ),
        ],
      ),
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
          child: Text(value,
                    style: TextStyle(fontSize: 20),),
        );
      }).toList(),
    );
  }
}
