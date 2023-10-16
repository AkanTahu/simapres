import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:pretty_animated_buttons/pretty_animated_buttons.dart';
import 'menu.dart';
// import 'dart:async' show Future;
// import 'dart:io';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:dio/dio.dart';

// final dio = Dio();
// var all_data = [];
// final TextEditingController namaController = TextEditingController();
// final TextEditingController umurController = TextEditingController();
// final TextEditingController tempatLahirController = TextEditingController();
// final TextEditingController idController_update = TextEditingController();
// final TextEditingController namaController_update = TextEditingController();
// final TextEditingController umurController_update = TextEditingController();
// final TextEditingController tempatLahirController_update =
//     TextEditingController();

// String url_domain = "http://192.168.0.107:8000/";
// String url_all_data = url_domain + "api/all_data";
// String url_create_data = url_domain + "api/create_data";
// String url_show_data = url_domain + "api/show_data";
// String url_update_data = url_domain + "api/edit_data";
// String url_delete_data = url_domain + "api/delete_data";

TextEditingController inputEmail = new TextEditingController();
TextEditingController inputPass = new TextEditingController();
TextEditingController dateinput = TextEditingController();

const List<String> list = <String>[
  'Kota',
  'Provinsi',
  'Nasional',
  'Internasional'
];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var routes = <String, WidgetBuilder>{
      nextInput.routeName: (BuildContext context) => new nextInput(),
    };

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Menu(),
      theme: ThemeData(fontFamily: 'proximanova'),
      routes: routes,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void ButtonNext() {
    Navigator.pushNamed(context, nextInput.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SIMAPRES"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(13),
            child: TextField(
              controller: inputEmail,
              decoration: InputDecoration(
                labelText: "Username",
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
              controller: inputPass,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock),
                labelText: "Password",
                enabledBorder: myinputborder(),
                focusedBorder: myfocusborder(),
              ), // Only numbers can be entered
            ),
          ),
          PrettyNeumorphicButton(
            label: 'Submit',
            onPressed: ButtonNext,
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

class nextInput extends StatefulWidget {
  const nextInput({Key? key}) : super(key: key);

  static const String routeName = "/nextInput";

  @override
  _nextInputState createState() => _nextInputState();
}

class _nextInputState extends State<nextInput> {
  XFile? image;

  final ImagePicker picker = ImagePicker();

  //we can upload image from camera or from gallery based on parameter
  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);

    setState(() {
      image = img;
    });
  }

  void myAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: Text('Please choose media to select'),
            content: Container(
              height: MediaQuery.of(context).size.height / 6,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      //if user click this button, user can upload image from gallery
                      onPressed: () {
                        Navigator.pop(context);
                        getImage(ImageSource.gallery);
                      },
                      child: Row(
                        children: [
                          Icon(Icons.image),
                          Text('From Gallery'),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      //if user click this button. user can upload image from camera
                      onPressed: () {
                        Navigator.pop(context);
                        getImage(ImageSource.camera);
                      },
                      child: Row(
                        children: [
                          Icon(Icons.camera),
                          Text('From Camera'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Input Berkas Sertifikat'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(13),
            child: TextField(
              controller: inputEmail,
              decoration: InputDecoration(
                labelText: "Input Nama Event / Kejuaraan / Prestasi",
                prefixIcon: Icon(Icons.task),
                border: myinputborder(),
                enabledBorder: myinputborder(),
                focusedBorder: myfocusborder(),
              ), // Only numbers can be entered
            ),
          ),
          PrettyWaveButton(
                child: const Text(
                  'Upload Foto Sertifikat',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  myAlert();
                },
              ),
          SizedBox(
            height: 10,
          ),
          //if image not null show the image
          //if image null show text
          image != null
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.file(
                      //to show image, you type like this.
                      File(image!.path),
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width,
                      height: 300,
                    ),
                  ),
                )
              : Text(
                  "Tidak Ada Gambar",
                  style: TextStyle(fontSize: 20),
                ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Pilih Tingkat Sertifikat : ',
                    style: TextStyle(fontSize: 20),),
              DropdownButtonExample(),
            ],
          ),
          Container(
              height: 80,
              child: Center(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: dateinput, //editing controller of this TextField
                  decoration: InputDecoration(
                      labelText: "Pilih Tanggal Event / Kejuaraan / Prestasi",
                      prefixIcon: Icon(Icons.calendar_today),
                      border: myinputborder(),
                      enabledBorder: myinputborder(),
                      focusedBorder: myfocusborder(), //label text of field
                      ),
                  readOnly:
                      true, //set it true, so that user will not able to edit text
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(
                            2000), //DateTime.now() - not to allow to choose before today.
                        lastDate: DateTime(2101));

                    if (pickedDate != null) {
                      print(
                          pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                      String formattedDate =
                          DateFormat('yyyy-MM-dd').format(pickedDate);
                      print(
                          formattedDate); //formatted date output using intl package =>  2021-03-16
                      //you can implement different kind of Date Format here according to your requirement

                      setState(() {
                        dateinput.text =
                            formattedDate; //set output date to TextField value.
                      });
                    } else {
                      print("Date is not selected");
                    }
                  },
                ),
              ))),
          PrettyNeumorphicButton(
            label: 'Submit',
            onPressed: () {},
          ),
        ],
      ),
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
        color: Color.fromARGB(255, 255, 0, 0),
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
