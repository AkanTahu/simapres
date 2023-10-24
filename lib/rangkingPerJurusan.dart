import 'package:flutter/material.dart';
import 'package:simapres/daftarJurusan.dart';

void main() {
  runApp(DaftarRanking());
}

class DaftarRanking extends StatefulWidget {
  _DaftarRankingState createState() => _DaftarRankingState();
}

class _DaftarRankingState extends State<DaftarRanking> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        title: Text('Halaman Ranking Perjurusan'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            DataTable(
              columns: [
                DataColumn(label: Text('Ranking')),
                DataColumn(label: Text('NIM')),
                DataColumn(label: Text('Nama')),
                // DataColumn(label: Text('Waktu')),
              ],
              rows: [
                DataRow(cells: [
                  DataCell(Text('01')),
                  DataCell(Text('2141762131')),
                  DataCell(Text('Ninda')),
                  // DataCell(Text('2022')),
                ]),
                DataRow(cells: [
                  DataCell(Text('02')),
                  DataCell(Text('2141762134')),
                  DataCell(Text('Kim Taehyung')),
                  // DataCell(Text('2023')),
                ]),
                DataRow(cells: [
                  DataCell(Text('03')),
                  DataCell(Text('2141762556')),
                  DataCell(Text('Putri Selinda')),
                  // DataCell(Text('2020')),
                ]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
