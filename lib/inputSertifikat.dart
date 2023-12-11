import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:pretty_animated_buttons/pretty_animated_buttons.dart';
import 'package:dio/dio.dart';
import 'menu.dart';
import 'registerMhsSertif.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:file_picker/file_picker.dart';

TextEditingController dateinput = TextEditingController();
TextEditingController inputjuara = new TextEditingController();
TextEditingController inputtingkat = new TextEditingController();
TextEditingController inputnamaSertif = new TextEditingController();

final dio = Dio();
// String url_domain = "http://192.168.0.105:8080/";
String url_domain = "http://127.0.0.1:8000/";
String url_buatSertif = url_domain + "api/buatSertif";


const List<String> list = <String>[
  'Pilih Tingkat',
  'Kota',
  'Provinsi',
  'Nasional',
  'Internasional'
];

const List<String> listJuara = <String>[
  'Pilih Juara',
  '1',
  '2',
  '3'
];

class nextInput extends StatefulWidget {
  const nextInput({Key? key}) : super(key: key);

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
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/bg.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              new Center(
                child: Image(
                  image: AssetImage('assets/SIMAPRESputih.png'),
                  height: 200,
                  width: 200,
                ),
              ),
              Container(
                width: 320,
                height: 820,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white.withOpacity(0.3),
                    width: 2.0,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                    bottomLeft: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 86, 91, 94)!,
                      offset: const Offset(
                        5.0,
                        5.0,
                      ),
                      blurRadius: 10.0,
                      spreadRadius: 2.0,
                    ),
                    //BoxShadow
                    BoxShadow(
                      color: Colors.white,
                      offset: const Offset(0.0, 0.0),
                      blurRadius: 0.0,
                      spreadRadius: 0.0,
                    ), //BoxShadow
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'UPLOAD SERTIFIKAT',
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w700, fontSize: 30),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(13),
                      child: TextField(
                        controller: inputnamaSertif,
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
                                height: 200,
                              ),
                            ),
                          )
                        : Text(
                            "Tidak Ada Gambar",
                            style: TextStyle(fontSize: 20),
                          ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Pilih Tingkat Sertifikat : ',
                          style: TextStyle(fontSize: 20),
                        ),
                        DropdownButtonTingkat(),
                        Text(
                          'Pilih Juara Berapa : ',
                          style: TextStyle(fontSize: 20),
                        ),
                        DropdownButtonJuara(),
                      ],
                    ),
                    Container(
                        height: 80,
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller:
                                dateinput, //editing controller of this TextField
                            decoration: InputDecoration(
                              labelText:
                                  "Pilih Tanggal Event / Kejuaraan / Prestasi",
                              prefixIcon: Icon(Icons.calendar_today),
                              border: myinputborder(),
                              enabledBorder: myinputborder(),
                              focusedBorder:
                                  myfocusborder(), //label text of field
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
                      onPressed: () => sweatAlert(context),
                    ),
                  ],
                ),
              ),
            ],
          ) /* add child content here */,
        ),
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

class DropdownButtonTingkat extends StatefulWidget {
  const DropdownButtonTingkat({super.key});

  @override
  State<DropdownButtonTingkat> createState() => _DropdownButtonTingkatState();
}

class _DropdownButtonTingkatState extends State<DropdownButtonTingkat> {
  String dropdownValue1 = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue1,
      icon: const Icon(Icons.arrow_downward),
      elevation: 20,
      style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
      underline: Container(
        height: 3,
        color: Color.fromARGB(255, 255, 0, 0),
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        inputtingkat.text = value!;
        setState(() {
          dropdownValue1 = value!;
          
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

class DropdownButtonJuara extends StatefulWidget {
  const DropdownButtonJuara({super.key});

  @override
  State<DropdownButtonJuara> createState() => _DropdownButtonJuaraState();
}

class _DropdownButtonJuaraState extends State<DropdownButtonJuara> {
  String dropdownValue2 = listJuara.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue2,
      icon: const Icon(Icons.arrow_downward),
      elevation: 20,
      style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
      underline: Container(
        height: 3,
        color: Color.fromARGB(255, 255, 0, 0),
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        inputjuara.text = value!;
        setState(() {
          dropdownValue2 = value!;
          
        });
      },
      items: listJuara.map<DropdownMenuItem<String>>((String value) {
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

void buatSertif(String namaSertif, String tingkatSertif, String juaraSertif,String tanggalSertif) async {
  Response response;
  response = await dio.post(
    url_buatSertif,
    queryParameters: {'namaSertif': namaSertif, 'tingkatSertif': tingkatSertif, 'juaraSertif': juaraSertif,'tanggalSertif': tanggalSertif},
  );

  inputnamaSertif.text = "";
  inputtingkat.text = "";
  inputjuara.text = "";
  dateinput.text = "";
}

void sweatAlert(BuildContext context) {
  Alert(
    context: context,
    type: AlertType.success,
    title: "Sertifikat Anda Sudah Terupload",
    desc: "Mohon Cek Notifikasi Apabila Admin Sudah Memvalidasi Sertifikat Anda",
    buttons: [
      DialogButton(
        child: Text(
          "Selanjutnya",
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
        onPressed: () {
                        buatSertif( inputnamaSertif.text,inputtingkat.text,inputjuara.text,dateinput.text);
                        Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const  MyAppMenu()),
                      );
                      },
      )
    ],
  ).show();

  return;
}

