import 'package:flutter/material.dart';
import 'detail_page.dart';

void main() {
  runApp(MaterialApp(
    title: "Cari Prestasi",
    home: BelajarForm(),
  ));
}

class BelajarForm extends StatefulWidget {
  @override
  _BelajarFormState createState() => _BelajarFormState();
}

class _BelajarFormState extends State<BelajarForm> {
  final _formKey = GlobalKey<FormState>();

  final nim = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SIMAPRES"),
      ),
      // untuk membuat form input tambahakan widget form()
      body: Form(
        // key adalah kunci unik untuk mengidentifikasi suatu form
        // di bawah key ini tambahkan widget sesuai selera kalian
        key: _formKey,
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            //agar semua widget diposisi kiri
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //textformfield digunakan untuk membuat widget form
              TextFormField(
                //memberikan identitas untuk setiap form
                controller: nim,
                decoration: InputDecoration(
                  hintText: "Masukkan NIM Anda",
                  labelText: "NIM",
                ),
                //memberikan validasi jika form kosong
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'NIM tidak boleh kosong';
                  }
                  return null;
                },
              ),
              //memberikan jarak
              SizedBox(height: 20),
              //membuat button untuk mengirim dataw
              ElevatedButton(
                child: Text(
                  "Submit",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  //jika data lengkap maka kirim data ke halaman selanjutnya
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            //name.text adalah parameter yang dikirim
                            //alamat.text adalah paramter yang dikirim
                            builder: (_) => DetailPage(
                                  nim: nim.text,
                                )));
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
