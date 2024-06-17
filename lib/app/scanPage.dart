import 'package:absensi_rohis/app/resultPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({super.key});

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {

  Future<void> scanQR() async {
    String result = "";

    try {
      result = await FlutterBarcodeScanner.scanBarcode("#0000ff", "Cancel", false, ScanMode.BARCODE,);
    } catch(e) {
      print("ERROR");
    } 

    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => ResultPage(scanResult: result,)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            scanQR();
          },
          child: Container(
            height: 80,
            width: 150,
            color: Colors.orange,
            child: const Center(
              child: Text(
                "Scan QR Code",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}