import 'package:absensi_rohis/app/scanPage.dart';
import 'package:absensi_rohis/app/siswaMainPage.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({Key? key, required this.scanResult}) : super(key: key);

  final String scanResult;

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  bool buildWidgets = false;

  @override
  void initState() {
    super.initState();
    checkKey();
  }

  Future<void> checkKey() async {
    // Simulated key validation
    String key = "DUMMY_KEY";

    await Future.delayed(const Duration(seconds: 2)); // Simulated delay

    if (widget.scanResult.toUpperCase() == key) {
      debugPrint("True");
      setState(() {
        buildWidgets = true;
      });
    } else {
      debugPrint("False");
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const SiswamainPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: buildWidgets
            ? const Text('Access Granted')
            : const CircularProgressIndicator(),
      ),
    );
  }
}
