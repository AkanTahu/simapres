import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

final dio = Dio();
var all_data = [];
final TextEditingController nameController = TextEditingController();
final TextEditingController bankController = TextEditingController();
final TextEditingController alamatController = TextEditingController();
final TextEditingController idController_update = TextEditingController();
final TextEditingController nameController_update = TextEditingController();
final TextEditingController bankController_update = TextEditingController();
final TextEditingController alamatController_update = TextEditingController();
String url_domain = "http://127.0.0.1:8000/";
String url_all_data = url_domain + "api/all_data";
String url_create_data = url_domain + "api/create_data";
String url_show_data = url_domain + "api/show_data";
String url_update_data = url_domain + "api/edit_data";
String url_delete_data = url_domain + "api/delete_data";
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: data_tes(),
    );
  }
}

class data_tes extends StatefulWidget {
  const data_tes({super.key});
  @override
  State<data_tes> createState() => _data_tesState();
}

class _data_tesState extends State<data_tes> with WidgetsBindingObserver {
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print('MyApp state = $state');
    if (state == AppLifecycleState.inactive) {
// app transitioning to other state.
    } else if (state == AppLifecycleState.paused) {
// app is on the background.
    } else if (state == AppLifecycleState.detached) {
// flutter engine is running but detached from views
    } else if (state == AppLifecycleState.resumed) {
// app is visible and running.
      runApp(MyApp()); // run your App class again
    }
  }

  @override
  Widget build(BuildContext context) {
    show_all_data();
    return Scaffold(
      body: Center(
        child: Column(
// crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: 60,
              decoration: BoxDecoration(color: Colors.red),
              alignment: Alignment.center,
              child: Text(
                '~ ~ REST API ~ ~',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
            Container(
              child: MaterialButton(
                color: Colors.greenAccent,
                height: 30,
                minWidth: 20,
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                          _buildPopupDialog(context));
                },
                child: Text("Add Data"),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(left: 10, right: 10),
              child: Table(
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                border: TableBorder.all(),
                columnWidths: {
                  0: FlexColumnWidth(1.5),
                  1: FlexColumnWidth(2),
                  2: FlexColumnWidth(5)
                },
                children: [
                  TableRow(children: [
                    Text(
                      'Nama',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text(
                      'Bank',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text(
                      'Action',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    )
                  ]),
                  for (var data in all_data)
                    TableRow(children: [
                      Text(
                        data['nama']!,
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        data['nim']!,
                        textAlign: TextAlign.center,
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(left: 10, right: 10),
                        child: Table(
                          border: TableBorder(
                              horizontalInside: BorderSide(
                                  width: 0,
                                  color: Colors.blue,
                                  style: BorderStyle.solid)),
                          children: [
                            TableRow(children: [
                              MaterialButton(
                                color: Colors.blue,
                                height: 30,
                                minWidth: 20,
                                onPressed: () {
                                  idController_update.text =
                                      data['id'].toString()!;
                                  nameController_update.text = data['nama']!;
                                  bankController_update.text = data['nim']!;
                                  alamatController_update.text =
                                      data['prodi']!;
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          _buildPopupDialog_update(context));
                                },
                                child: Text("Update"),
                              ),
                              MaterialButton(
                                color: Colors.red,
                                height: 30,
                                minWidth: 20,
                                onPressed: () {
                                  print("delete");
                                  delete_data(data['id']!);
                                  didChangeAppLifecycleState(
                                      AppLifecycleState.resumed);
                                },
                                child: Text("Delete"),
                              ),
                            ])
                          ],
                        ),
                      )
                    ])
                ],
              ),
            ),
            Container(
              child: MaterialButton(
                color: Colors.grey,
                height: 30,
                minWidth: 20,
                onPressed: () {
                  didChangeAppLifecycleState(AppLifecycleState.resumed);
                },
                child: Text("Refresh Data"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildPopupDialog(BuildContext context) {
  return new AlertDialog(
    title: const Text('Form Data'),
    content: SingleChildScrollView(
      child: Column(
        children: [
          TextField(
            style: TextStyle(fontSize: 12),
            controller: nameController,
            textAlign: TextAlign.left,
            decoration: InputDecoration(
              prefixIconConstraints:
                  BoxConstraints(minWidth: 23, maxHeight: 20),
              prefixIcon: Padding(
                padding: const EdgeInsets.only(right: 10, left: 10),
                child: Icon(
                  Icons.email,
                  color: Colors.black12,
                ),
              ),
              filled: true,
              contentPadding: EdgeInsets.symmetric(vertical: 0),
              hintText: 'Nama',
              hintStyle: TextStyle(color: Colors.grey),
            ),
          ),
          TextField(
            style: TextStyle(fontSize: 12),
            controller: bankController,
            textAlign: TextAlign.left,
            decoration: InputDecoration(
              prefixIconConstraints:
                  BoxConstraints(minWidth: 23, maxHeight: 20),
              prefixIcon: Padding(
                padding: const EdgeInsets.only(right: 10, left: 10),
                child: Icon(
                  Icons.money,
                  color: Colors.black12,
                ),
              ),
              filled: true,
              contentPadding: EdgeInsets.symmetric(vertical: 0),
              hintText: 'Bank',
              hintStyle: TextStyle(color: Colors.grey),
            ),
          ),
          TextField(
            style: TextStyle(fontSize: 12),
            controller: alamatController,
            textAlign: TextAlign.left,
            decoration: InputDecoration(
              prefixIconConstraints:
                  BoxConstraints(minWidth: 23, maxHeight: 20),
              prefixIcon: Padding(
                padding: const EdgeInsets.only(right: 10, left: 10),
                child: Icon(
                  Icons.house,
                  color: Colors.black12,
                ),
              ),
              filled: true,
              contentPadding: EdgeInsets.symmetric(vertical: 0),
              hintText: 'Alamat',
              hintStyle: TextStyle(color: Colors.grey),
            ),
          ),
          MaterialButton(
            color: Colors.greenAccent,
            height: 30,
            minWidth: 20,
            onPressed: () {
              print("object");
              if (nameController.text == "" ||
                  bankController.text == "" ||
                  alamatController.text == "") {
                print("zero");
              } else {
                create_data(nameController.text, bankController.text,
                    alamatController.text);
                Navigator.of(context).pop();
              }
            },
            child: Text("Send"),
          ),
        ],
      ),
    ),
    actions: <Widget>[
      new MaterialButton(
        color: Colors.blueGrey,
        height: 30,
        minWidth: 20,
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Text("Close"),
      ),
    ],
  );
}

Widget _buildPopupDialog_update(BuildContext context) {
  return new AlertDialog(
    title: const Text('Update Data'),
    content: SingleChildScrollView(
      child: Column(
        children: [
          TextField(
            enabled: false,
            style: TextStyle(fontSize: 12),
            controller: idController_update,
            textAlign: TextAlign.left,
            decoration: InputDecoration(
              prefixIconConstraints:
                  BoxConstraints(minWidth: 23, maxHeight: 20),
              prefixIcon: Padding(
                padding: const EdgeInsets.only(right: 10, left: 10),
                child: Icon(
                  Icons.key,
                  color: Colors.black12,
                ),
              ),
              filled: true,
              contentPadding: EdgeInsets.symmetric(vertical: 0),
              hintText: 'Id',
              hintStyle: TextStyle(color: Colors.grey),
            ),
          ),
          TextField(
            style: TextStyle(fontSize: 12),
            controller: nameController_update,
            textAlign: TextAlign.left,
            decoration: InputDecoration(
              prefixIconConstraints:
                  BoxConstraints(minWidth: 23, maxHeight: 20),
              prefixIcon: Padding(
                padding: const EdgeInsets.only(right: 10, left: 10),
                child: Icon(
                  Icons.email,
                  color: Colors.black12,
                ),
              ),
              filled: true,
              contentPadding: EdgeInsets.symmetric(vertical: 0),
              hintText: 'Nama',
              hintStyle: TextStyle(color: Colors.grey),
            ),
          ),
          TextField(
            style: TextStyle(fontSize: 12),
            controller: bankController_update,
            textAlign: TextAlign.left,
            decoration: InputDecoration(
              prefixIconConstraints:
                  BoxConstraints(minWidth: 23, maxHeight: 20),
              prefixIcon: Padding(
                padding: const EdgeInsets.only(right: 10, left: 10),
                child: Icon(
                  Icons.money,
                  color: Colors.black12,
                ),
              ),
              filled: true,
              contentPadding: EdgeInsets.symmetric(vertical: 0),
              hintText: 'Bank',
              hintStyle: TextStyle(color: Colors.grey),
            ),
          ),
          TextField(
            style: TextStyle(fontSize: 12),
            controller: alamatController_update,
            textAlign: TextAlign.left,
            decoration: InputDecoration(
              prefixIconConstraints:
                  BoxConstraints(minWidth: 23, maxHeight: 20),
              prefixIcon: Padding(
                padding: const EdgeInsets.only(right: 10, left: 10),
                child: Icon(
                  Icons.house,
                  color: Colors.black12,
                ),
              ),
              filled: true,
              contentPadding: EdgeInsets.symmetric(vertical: 0),
              hintText: 'Alamat',
              hintStyle: TextStyle(color: Colors.grey),
            ),
          ),
          MaterialButton(
            color: Colors.blueAccent,
            height: 30,
            minWidth: 20,
            onPressed: () {
              print("object");
              if (idController_update.text == "" ||
                  nameController_update.text == "" ||
                  bankController_update.text == "" ||
                  alamatController_update.text == "") {
                print("zero");
              } else {
                update_data(
                    idController_update.text,
                    nameController_update.text,
                    bankController_update.text,
                    alamatController_update.text);
                Navigator.of(context).pop();
              }
            },
            child: Text("Update"),
          ),
        ],
      ),
    ),
    actions: <Widget>[
      new MaterialButton(
        color: Colors.blueGrey,
        height: 30,
        minWidth: 20,
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Text("Close"),
      ),
    ],
  );
}

void show_all_data() async {
  Response response;
  response = await dio.post(
    url_all_data,
  );
  all_data = response.data;
}

void create_data(String nama, String nim, String prodi) async {
  Response response;
  response = await dio.post(
    url_create_data,
    queryParameters: {'nama': nama, 'nim': nim, 'prodi': prodi},
  );
  nameController.text = "";
  bankController.text = "";
  alamatController.text = "";
}

void delete_data(int id) async {
  Response response;
  response = await dio.post(
    url_delete_data,
    queryParameters: {'id': id},
  );
}

void update_data(String id, String nama, String nim, String prodi) async {
  Response response;
  response = await dio.post(
    url_update_data,
    queryParameters: {'id': id, 'nama': nama, 'nim': nim, 'prodi': prodi},
  );
  idController_update.text = "";
  nameController_update.text = "";
  bankController_update.text = "";
  alamatController_update.text = "";
}
