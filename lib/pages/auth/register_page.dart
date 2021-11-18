import 'package:app_library/API/apistatus.dart';
import 'package:app_library/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _email = TextEditingController();
  TextEditingController _username = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _password = TextEditingController();
  RoundedLoadingButtonController _register =
      new RoundedLoadingButtonController();
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
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  SvgPicture.asset(
                    'assets/svg/logo3.svg',
                    width: MediaQuery.of(context).size.width * 0.2,
                    height: MediaQuery.of(context).size.height * 0.2,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.85,
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          obscureText: false,
                          controller: _email,
                          keyboardType: TextInputType.emailAddress,
                          cursorColor: themeOranges,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.mail,
                              color: Colors.black38,
                            ),
                            hintText: 'Your E-Mail',
                            hintStyle: TextStyle(
                              color: Colors.black38,
                              fontFamily: 'quadrat',
                              fontSize: 16,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                color: themeOranges,
                                width: 4,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.85,
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          controller: _username,
                          obscureText: false,
                          cursorColor: themeOranges,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.black38,
                            ),
                            hintText: 'Your Username',
                            hintStyle: TextStyle(
                              color: Colors.black38,
                              fontFamily: 'quadrat',
                              fontSize: 16,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                color: themeOranges,
                                width: 4,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.85,
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          controller: _phone,
                          keyboardType: TextInputType.phone,
                          obscureText: false,
                          cursorColor: themeOranges,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.phone_android,
                              color: Colors.black38,
                            ),
                            hintText: 'Your Phone',
                            hintStyle: TextStyle(
                              color: Colors.black38,
                              fontFamily: 'quadrat',
                              fontSize: 16,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                color: themeOranges,
                                width: 4,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.85,
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          controller: _password,
                          obscureText: true,
                          cursorColor: themeOranges,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.vpn_key,
                              color: Colors.black38,
                            ),
                            suffixIcon: Icon(
                              Icons.remove_red_eye,
                              size: 15,
                            ),
                            hintText: 'Your Password',
                            hintStyle: TextStyle(
                              color: Colors.black38,
                              fontFamily: 'quadrat',
                              fontSize: 16,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                color: themeOranges,
                                width: 4,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      RoundedLoadingButton(
                        controller: _register,
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            APIStatus.insertUser(context, _email.text,
                                    _username.text, _phone.text, _password.text)
                                .then((value) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(value[0].apimessage)),
                              );
                            });
                          } else {
                            // If the form is valid, display a snackbar. In the real world,
                            // you'd often call a server or save the information in a database.
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Processing Data')),
                            );
                          }
                          _register.reset();
                        },
                        child: Text(
                          'REGISTER',
                          style: TextStyle(
                              color: Colors.black38,
                              fontFamily: 'quadrat',
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        width: MediaQuery.of(context).size.width * 0.85,
                        color: themeOranges,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.35,
                            height: 2,
                            color: Colors.white,
                          ),
                          Text(
                            " OR ",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'quadrat',
                              fontSize: 20,
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.35,
                            height: 2,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 12,
                                  offset: Offset(0, 8),
                                )
                              ],
                            ),
                            child: SvgPicture.asset(
                              'assets/svg/facebook.svg',
                              width: 60,
                              height: 60,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.07,
                          ),
                          Container(
                            padding: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 12,
                                  offset: Offset(0, 8),
                                )
                              ],
                            ),
                            child: SvgPicture.asset(
                              'assets/svg/gmail.svg',
                              width: 60,
                              height: 60,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.07,
                          ),
                          Container(
                            padding: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 12,
                                  offset: Offset(0, 8),
                                )
                              ],
                            ),
                            child: SvgPicture.asset(
                              'assets/svg/twitter.svg',
                              width: 60,
                              height: 60,
                            ),
                          ),
                        ],
                      )
                    ],
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
