import 'package:absensi_rohis/app/DPKmainPage.dart';
import 'package:absensi_rohis/app/SiswamainPage.dart';
import 'package:absensi_rohis/auth/registerPage.dart';
import 'package:absensi_rohis/controller/loginController.dart';
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
  final LoginController _loginController = LoginController();
  
  String accountType = "";

  Future<void> login() async {
    String email = _emailController.text;
    String password = _passwordController.text;

    String retrievedAccountType = await _loginController.login(email, password);

    setState(() {
      accountType = retrievedAccountType;
    });

    if (accountType == 'siswa') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SiswamainPage()),
      );
    } else if (accountType == 'dpk') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DPKmainPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
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
                  width: 400,
                  height: 304.44,
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
                                controller: _emailController,
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
                                controller: _passwordController,
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

                                  onPressed: login,
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