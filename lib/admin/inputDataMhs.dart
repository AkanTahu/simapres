import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pretty_animated_buttons/pretty_animated_buttons.dart';
import 'package:dropdown_button2/dropdown_button2.dart';


TextEditingController namaMhs = new TextEditingController();
TextEditingController umurMhs = new TextEditingController();
TextEditingController ttlMhs = new TextEditingController();
TextEditingController notelpMhs = new TextEditingController();
TextEditingController nimMhs = new TextEditingController();
TextEditingController nilaiIPMhs = new TextEditingController();
TextEditingController kehadiranMhs = new TextEditingController();

final List<String> jurusanitems = [
  'TI','TM','TE','AK','AN','TK','TS',
];

final List<String> jenisklmMhs = [
  'TI','TM','TE','AK','AN','TK','TS',
];

String? selectedValue;

class InputDataMhs extends StatefulWidget {
  const InputDataMhs({Key? key}) : super(key: key);

  @override
  _InputDataMhsState createState() => _InputDataMhsState();
}

class _InputDataMhsState extends State<InputDataMhs> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Halaman Admin"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(13),
            child: TextField(
              controller: namaMhs,
              decoration: InputDecoration(
                labelText: "Masukkan nama Mahasiswa",
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
              controller: umurMhs,
              decoration: InputDecoration(
                labelText: "Masukkan umur Mahasiswa",
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
              controller: ttlMhs,
              decoration: InputDecoration(
                labelText: "Masukkan Tempat Tanggal Lahir Mahasiswa",
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
              controller: notelpMhs,
              decoration: InputDecoration(
                labelText: "Masukkan Nomor Telepon Mahasiswa",
                prefixIcon: Icon(Icons.people),
                border: myinputborder(),
                enabledBorder: myinputborder(),
                focusedBorder: myfocusborder(),
              ), // Only numbers can be entered
            ),
          ),
          const SizedBox(height: 20),
            DropdownButtonFormField2<String>(
              isExpanded: true,
              decoration: InputDecoration(
                // Add Horizontal padding using menuItemStyleData.padding so it matches
                // the menu padding when button's width is not specified.
                contentPadding: const EdgeInsets.symmetric(vertical: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                // Add more decoration..
              ),
              hint: const Text(
                'Pilih Jurusan',
                style: TextStyle(fontSize: 14),
              ),
              items: jenisklmMhs
                  .map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ))
                  .toList(),
              validator: (value) {
                if (value == null) {
                  return 'Please select gender.';
                }
                return null;
              },
              onChanged: (value) {
                //Do something when selected item is changed.
              },
              onSaved: (value) {
                selectedValue = value.toString();
              },
              buttonStyleData: const ButtonStyleData(
                padding: EdgeInsets.only(right: 8),
              ),
              iconStyleData: const IconStyleData(
                icon: Icon(
                  Icons.arrow_drop_down,
                  color: Colors.black45,
                ),
                iconSize: 24,
              ),
              dropdownStyleData: DropdownStyleData(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              menuItemStyleData: const MenuItemStyleData(
                padding: EdgeInsets.symmetric(horizontal: 16),
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(13),
            child: TextField(
              controller: nimMhs,
              decoration: InputDecoration(
                labelText: "Masukkan NIM Mahasiswa",
                prefixIcon: Icon(Icons.people),
                border: myinputborder(),
                enabledBorder: myinputborder(),
                focusedBorder: myfocusborder(),
              ), // Only numbers can be entered
            ),
          ),
          const SizedBox(height: 20),
            DropdownButtonFormField2<String>(
              isExpanded: true,
              decoration: InputDecoration(
                // Add Horizontal padding using menuItemStyleData.padding so it matches
                // the menu padding when button's width is not specified.
                contentPadding: const EdgeInsets.symmetric(vertical: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                // Add more decoration..
              ),
              hint: const Text(
                'Select Your Gender',
                style: TextStyle(fontSize: 14),
              ),
              items: jurusanitems
                  .map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ))
                  .toList(),
              validator: (value) {
                if (value == null) {
                  return 'Please select gender.';
                }
                return null;
              },
              onChanged: (value) {
                //Do something when selected item is changed.
              },
              onSaved: (value) {
                selectedValue = value.toString();
              },
              buttonStyleData: const ButtonStyleData(
                padding: EdgeInsets.only(right: 8),
              ),
              iconStyleData: const IconStyleData(
                icon: Icon(
                  Icons.arrow_drop_down,
                  color: Colors.black45,
                ),
                iconSize: 24,
              ),
              dropdownStyleData: DropdownStyleData(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              menuItemStyleData: const MenuItemStyleData(
                padding: EdgeInsets.symmetric(horizontal: 16),
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(13),
            child: TextField(
              controller: nilaiIPMhs,
              decoration: InputDecoration(
                labelText: "Masukkan Nilai IP Mahasiswa",
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
              controller: kehadiranMhs,
              decoration: InputDecoration(
                labelText: "Masukkan Kehadiran ALPA",
                prefixIcon: Icon(Icons.people),
                border: myinputborder(),
                enabledBorder: myinputborder(),
                focusedBorder: myfocusborder(),
              ), // Only numbers can be entered
            ),
          ),
          PrettyNeumorphicButton(
            label: 'Submit',
            onPressed: () {
              
            },
          ),
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