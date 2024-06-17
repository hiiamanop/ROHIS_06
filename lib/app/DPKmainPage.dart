import 'package:absensi_rohis/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class DPKmainPage extends StatelessWidget {
  const DPKmainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Tampilkan pada siswa',
                        style: blacktextStyle.copyWith(
                            fontSize: 20, fontWeight: FontWeight.w800),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('untuk discan',
                          style: blacktextStyle.copyWith(
                              fontSize: 20, fontWeight: FontWeight.w800))
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  QrImageView(
                    data: '1234567890',
                    version: QrVersions.auto,
                    size: 200.0,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.08,
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: primaryColor,
                      minimumSize: Size(100,
                          50), // Set the minimum width to match the parent's width
                      padding: EdgeInsets.zero, // Remove the default padding
                    ),
                    onPressed: () {},
                    child: Container(
                      width: MediaQuery.of(context).size.width *
                          0.8, // Set the desired width (e.g., 80% of the screen width)
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Lihat Daftar Hadir',
                            style: whitetextStyle.copyWith(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Powered by"),
                  Text(
                    "SMA N 6 Palembang",
                    style: blacktextStyle,
                  ),
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
