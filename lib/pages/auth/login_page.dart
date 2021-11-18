import 'package:app_library/pages/auth/register_page.dart';
import 'package:app_library/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  RoundedLoadingButtonController _login = new RoundedLoadingButtonController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: bgGradient(),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/svg/logo2.svg',
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 0.3,
              ),
              Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    child: Padding(
                      padding: EdgeInsets.all(2),
                      child: TextField(
                        cursorColor: themeOranges,
                        autocorrect: false,
                        obscureText: false,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.black38,
                          ),
                          hintText: "Enter Username",
                          hintStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'quadrat',
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color.fromRGBO(255, 88, 33, 0.6),
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    child: Padding(
                      padding: EdgeInsets.all(2),
                      child: TextField(
                        cursorColor: themeOranges,
                        autocorrect: false,
                        obscureText: true,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.vpn_key,
                            color: Colors.black38,
                          ),
                          hintText: "Enter Pasword",
                          hintStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'quadrat',
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color.fromRGBO(255, 88, 33, 0.6),
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RoundedLoadingButton(
                    controller: _login,
                    onPressed: () {},
                    child: Text("LOGIN",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black38,
                          fontFamily: 'quadrat',
                          fontWeight: FontWeight.w800,
                        )),
                    width: MediaQuery.of(context).size.width * 0.85,
                    color: themeOranges,
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.002,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "Dont have an account",
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'quadrat',
                      color: Colors.black38,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.01,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return RegisterPage();
                      }));
                    },
                    child: Text(
                      'SIGN UP',
                      style: TextStyle(
                        color: themeOranges,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
