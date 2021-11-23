import 'package:app_library/pages/auth/login_page.dart';
import 'package:app_library/pages/dashboard/dashboard_page.dart';
import 'package:app_library/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    loginStatus();
  }

  loginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString("username") == null) {
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return LoginPage();
        }));
      });
    } else {
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return DashboardPage();
        }));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(gradient: bgGradient()),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "APP LIBRARY",
              style: TextStyle(
                fontFamily: 'Serif',
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(72, 72, 72, 1),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SvgPicture.asset(
              'assets/svg/logo1.svg',
              width: MediaQuery.of(context).size.width * 0.1,
              height: MediaQuery.of(context).size.height * 0.2,
            ),
            SizedBox(
              height: 40,
            ),
            CircularProgressIndicator(
              color: Color.fromRGBO(72, 72, 72, 1),
              backgroundColor: Color.fromRGBO(255, 121, 70, 0.3),
            )
          ],
        ),
      ),
    );
  }
}
