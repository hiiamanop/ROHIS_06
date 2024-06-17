import 'package:absensi_rohis/app/DPKMainPage.dart';
import 'package:absensi_rohis/app/siswaMainPage.dart';
import 'package:absensi_rohis/auth/registerPage.dart';
import 'package:absensi_rohis/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String accountType = "";

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(75),
                bottomRight: Radius.circular(75),
              ),
            ),
            child: Column(
              children: [
                Container(
                  width: screenWidth * 0.8,
                  height: screenHeight * 0.3,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('asset/images/imgLogin.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.025,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "ROHIS UKHUWAH 06",
                              style: primarytextStyle.copyWith(
                                  fontSize: 20, fontWeight: FontWeight.w800),
                            )
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.04,
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Masukan Email',
                                  style: blacktextStyle,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            Container(
                              height: 50, // Set the desired height
                              child: TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide(color: borderColor),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide(color: borderColor),
                                  ),
                                  hintText: "Email",
                                  hintStyle: greytextStyle,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Masukan Password',
                                  style: blacktextStyle,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            Container(
                              height: 50, // Set the desired height
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide(color: borderColor),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide(color: borderColor),
                                  ),
                                  hintText: "Password",
                                  hintStyle: greytextStyle,
                                ),
                              ),
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.015,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                // for reset password will focus in later
                                Text(
                                  "Lupa Password?",
                                  style: secondarytextStyle.copyWith(
                                    decoration: TextDecoration.underline,
                                    decorationColor: secondaryColor,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.075,
                            ),
                            // button login
                            Container(
                              child: TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: primaryColor,
                                  ),

                                  // on pressed will direct to main page, if NIS and PW are right
                                  // if login as siswa, will direct to SiswamainPage, if login as DPK
                                  //will direct to DPKmainPage

                                  onPressed: () => {},
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Masuk',
                                          style: whitetextStyle.copyWith(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  )),
                            ),
                            SizedBox(
                              height: 10,
                            ),

                            // belum punya akun? daftar sekarang!
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Belum Punya Akun? ",
                                  style: blacktextStyle,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => RegisterPage()),
                                    );
                                  },
                                  child: Text(
                                    // also daftar nanti aja
                                    "Daftar sekarang!",
                                    style: secondarytextStyle.copyWith(
                                      decoration: TextDecoration.underline,
                                      decorationColor: secondaryColor,
                                    ),
                                  ),
                                )
                              ],
                            ),

                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.079,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          )
        ],
      ),
    );
  }
}
