import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Detail Mahasiswa',
        home: Scaffold(
          appBar: AppBar(
            title: Text(
              "Detail Mahasiswa",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSL4YGR1kiNnamKrH9i0mgyuYIlE506iaC-yQ&usqp=CAU'),
                SizedBox(height: 25),
                Text(
                  'Nur Ayu Dewi S',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                //SizedBox NIM
                SizedBox(height: 5),
                Text(
                  '214176131',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                //SizedBox Prodi
                SizedBox(height: 25),
                Text(
                  'Program Studi',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w100,
                    color: Colors.grey,
                  ),
                ),
                //SizedBox Detail Prodi
                SizedBox(height: 5),
                Text(
                  'D-IV Sistem Informasi Bisnis',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                //SizedBox Jurusan
                SizedBox(height: 10),
                Text(
                  'Jurusan',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w100,
                    color: Colors.grey,
                  ),
                ),
                //SizedBox Detail Jurusan
                SizedBox(height: 5),
                Text(
                  'Teknologi Informasi',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                //SizedBox Garis
                SizedBox(height: 100),
                Divider(
                  color: Colors.black,
                  thickness: 1,
                  height: 20,
                ),
                //SizedBox Ranking
                SizedBox(height: 25),
                Text(
                  'RANKING',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 25),
                Text(
                  '#1',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 40),
                Divider(
                  color: Colors.black,
                  thickness: 1,
                  height: 20,
                ),
                Container(
                  width: 800,
                  height: 400.0,
                  margin: EdgeInsets.only(top: 5.0),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Daftar Prestasi',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 8),
                      Expanded(
                        child: ListView(
                          children: [
                            Text(
                              'Prestasi 1',
                              style: TextStyle(
                                fontSize: 32,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              'Prestasi 2',
                              style: TextStyle(
                                fontSize: 32,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              'Prestasi 3',
                              style: TextStyle(
                                fontSize: 32,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
