import 'package:app_library/pages/auth/login_page.dart';
import 'package:app_library/pages/book/input_buku.dart';
import 'package:app_library/pages/book/list_buku.dart';
import 'package:app_library/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: themeOranges,
          title: Text(
            "APP LIBRARY",
            style: TextStyle(
              fontFamily: 'quadrat',
              fontWeight: FontWeight.bold,
            ),
          ),
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: Text(
                      "Apkah Anda Yakin Keluar?",
                      textAlign: TextAlign.center,
                    ),
                    actions: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Tidak"),
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromRGBO(68, 68, 68, 1),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          SharedPreferences preferences =
                              await SharedPreferences.getInstance();
                          preferences.clear();
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return LoginPage();
                          }));
                        },
                        child: Text("Ya"),
                        style: ElevatedButton.styleFrom(primary: themeOranges),
                      ),
                    ],
                  ),
                );
              },
              icon: Icon(Icons.power_settings_new),
            )
          ],
        ),
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return InputBuku();
                            }));
                          },
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            width: MediaQuery.of(context).size.width,
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                children: const [
                                  Icon(
                                    Icons.book,
                                    size: 50,
                                  ),
                                  Text("INPUT BUKU")
                                ],
                              ),
                            ),
                          ),
                          style:
                              ElevatedButton.styleFrom(primary: themeOranges),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Flexible(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return ListBuku();
                            }));
                          },
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            width: MediaQuery.of(context).size.width,
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                children: const [
                                  Icon(
                                    Icons.list,
                                    size: 50,
                                  ),
                                  Text("LIST BUKU")
                                ],
                              ),
                            ),
                          ),
                          style:
                              ElevatedButton.styleFrom(primary: themeOranges),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
