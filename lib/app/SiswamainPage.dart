import 'package:absensi_rohis/app/resultPage.dart';
import 'package:absensi_rohis/app/scanPage.dart';
import 'package:absensi_rohis/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class SiswamainPage extends StatefulWidget {
  const SiswamainPage({super.key});

  @override
  State<SiswamainPage> createState() => _SiswamainPageState();
}

class _SiswamainPageState extends State<SiswamainPage> {
  Future<void> scanQR() async {
    String result = "";

    try {
      result = await FlutterBarcodeScanner.scanBarcode(
        "#0000ff",
        "Cancel",
        false,
        ScanMode.BARCODE,
      );
    } catch (e) {
      print("ERROR");
    }

    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) => ResultPage(
                scanResult: result,
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.06,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Palembang,',
                            style: blacktextStyle.copyWith(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          Text(
                            '19 Juni 2024',
                            style: blacktextStyle.copyWith(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ],
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(
                                  0.2), // Shadow color with opacity
                              spreadRadius: 2, // Spread radius of the shadow
                              blurRadius: 4, // Blur radius of the shadow
                              offset: Offset(0, 2),
                            )
                          ],
                        ),
                        child: InkWell(
                          onTap: () {},
                          child: Icon(
                            Icons.person,
                            color: primaryColor,
                          ),
                        ),
                      )
                    ]),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Container(
                  width: 340,
                  height: 641,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black
                            .withOpacity(0.2), // Shadow color with opacity
                        spreadRadius: 2, // Spread radius of the shadow
                        blurRadius: 4, // Blur radius of the shadow
                        offset: Offset(0, 2),
                      )
                    ],
                    image: DecorationImage(
                      image: AssetImage("asset/images/layer.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Halo...",
                              style: whitetextStyle.copyWith(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "Ahmad Naufal Muzakki",
                              style: whitetextStyle.copyWith(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "XII IPA 7",
                              style: whitetextStyle.copyWith(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 100,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    color: whiteColor,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(
                                            0.2), // Shadow color with opacity
                                        spreadRadius:
                                            2, // Spread radius of the shadow
                                        blurRadius:
                                            4, // Blur radius of the shadow
                                        offset: Offset(0, 2),
                                      )
                                    ],
                                  ),
                                  child: InkWell(
                                    onTap: () {
                                      scanQR();
                                    },
                                    child: Icon(
                                      Icons.qr_code,
                                      color: primaryColor,
                                      size: 75,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Center(
                              child: Column(
                                children: [
                                  Text(
                                    "Scan",
                                    style: whitetextStyle.copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        "Silahkan scan QR code pada DPK",
                                        style: whitetextStyle,
                                      ),
                                      Text(
                                        "untuk absensi",
                                        style: whitetextStyle,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
