import 'package:absensi_rohis/auth/loginPage.dart';
import 'package:absensi_rohis/theme/theme.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(),
              Image.asset("asset/images/splash.png", height: 150,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Powered by"),
                  Text("SMA N 6 Palembang",style: blacktextStyle,),
                  SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
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
