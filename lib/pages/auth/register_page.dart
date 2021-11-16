import 'package:app_library/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
                      child: TextField(
                        autocorrect: false,
                        obscureText: false,
                        cursorColor: themeOranges,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.mail,
                            color: Colors.black38,
                          ),
                          hintText: 'Your Mail',
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
                      child: TextField(
                        autocorrect: false,
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
                      child: TextField(
                        autocorrect: false,
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
                      child: TextField(
                        autocorrect: false,
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
                      onPressed: () {},
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
    );
  }
}
