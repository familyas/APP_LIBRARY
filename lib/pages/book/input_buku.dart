import 'package:app_library/API/apibuku.dart';
import 'package:app_library/pages/dashboard/dashboard_page.dart';
import 'package:app_library/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:select_form_field/select_form_field.dart';

class InputBuku extends StatefulWidget {
  @override
  _InputBukuState createState() => _InputBukuState();
}

class _InputBukuState extends State<InputBuku> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _judul = TextEditingController();
  TextEditingController _isbn = TextEditingController();
  TextEditingController _thnterbit = TextEditingController();
  TextEditingController _penerbit = TextEditingController();
  TextEditingController _jmlbk = TextEditingController();
  TextEditingController _kategori = TextEditingController();
  RoundedLoadingButtonController _simpanbook =
      new RoundedLoadingButtonController();

  String _valueChanged = '';
  String _valueToValidate = '';
  String _valueSaved = '';

  final List<Map<String, dynamic>> _itempenerbit = [
    {
      'value': 'Erlangga',
      'label': 'Erlangga',
    },
    {
      'value': 'Tiga Serangkai',
      'label': 'Tiga Serangkai',
    },
    {
      'value': 'Elex Media',
      'label': 'Elex Media',
    }
  ];

  final List<Map<String, dynamic>> _itemkategori = [
    {
      'value': 'Petualang',
      'label': 'Petualang',
    },
    {
      'value': 'Romance',
      'label': 'Romance',
    },
    {
      'value': 'Edukasi',
      'label': 'Edukasi',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeOranges,
        title: Text(
          "INPUT BUKU",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'quadrat',
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  TextFormField(
                    controller: _judul,
                    cursorColor: themeOranges,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Some Text';
                      }
                      return null;
                    },
                    decoration: Dekorasi().dekorasiInput(
                      Icon(
                        Icons.book,
                        color: Colors.black38,
                      ),
                      "Judul Buku",
                      15,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  TextFormField(
                    controller: _isbn,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Some Text';
                      }
                      return null;
                    },
                    cursorColor: themeOranges,
                    decoration: Dekorasi().dekorasiInput(
                      Icon(
                        Icons.category,
                        color: Colors.black38,
                      ),
                      "ISBN",
                      15,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  TextFormField(
                    controller: _thnterbit,
                    cursorColor: themeOranges,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Some Text';
                      }
                      return null;
                    },
                    decoration: Dekorasi().dekorasiInput(
                      Icon(
                        Icons.calendar_today,
                        color: Colors.black38,
                      ),
                      "Tahun Terbit",
                      15,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  SelectFormField(
                    controller: _penerbit,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.people,
                        color: Colors.black38,
                      ),
                      labelText: "Penerbit",
                      labelStyle: TextStyle(color: Colors.black38),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: themeOranges,
                          width: 4,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    items: _itempenerbit,
                    onChanged: (val) => setState(() => _valueChanged = val),
                    validator: (val) {
                      setState(() => _valueToValidate = val ?? '');
                      return null;
                    },
                    onSaved: (val) => setState(() => _valueSaved = val ?? ''),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  TextFormField(
                    controller: _jmlbk,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'please enter some text';
                      }
                      return null;
                    },
                    cursorColor: themeOranges,
                    decoration: Dekorasi().dekorasiInput(
                      Icon(
                        Icons.book_online_rounded,
                        color: Colors.black38,
                      ),
                      "Jumlah Buku",
                      15,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  SelectFormField(
                    controller: _kategori,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.add_location,
                        color: Colors.black38,
                      ),
                      labelText: "Kategori",
                      labelStyle: TextStyle(color: Colors.black38),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: themeOranges,
                          width: 4,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    items: _itemkategori,
                    onChanged: (val) => setState(() => _valueChanged = val),
                    validator: (val) {
                      setState(() => _valueToValidate = val ?? '');
                      return null;
                    },
                    onSaved: (val) => setState(() => _valueSaved = val ?? ''),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  RoundedLoadingButton(
                    width: MediaQuery.of(context).size.width * 0.9,
                    color: themeOranges,
                    controller: _simpanbook,
                    child: Text(
                      "Simpan Buku",
                      style: TextStyle(
                        color: Colors.black38,
                        fontFamily: 'quadrat',
                        fontSize: 20,
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        APIBOOK.InserBuku(
                          context,
                          _judul.text,
                          _isbn.text,
                          _thnterbit.text,
                          _penerbit.text,
                          _jmlbk.text,
                          _kategori.text,
                          'createdby',
                        ).then((value) {
                          MessageToash(context, value[0].apimessage);
                          if (value[0].status == "success") {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return DashboardPage();
                            }));
                          }
                        });
                      } else {
                        MessageToash(context, "Lengkapi Data Anda");
                      }
                      _simpanbook.reset();
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
