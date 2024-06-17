import 'package:absensi_rohis/theme/theme.dart';
import 'package:flutter/material.dart';

class DaftarHadirPage extends StatelessWidget {
  const DaftarHadirPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text("Daftar Hadir", style: blacktextStyle.copyWith(fontSize: 20, fontWeight: FontWeight.bold),)],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Container(
                      decoration: BoxDecoration(color: greyColor, borderRadius: BorderRadius.circular(12)),
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.7,
                      child: Stack(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Nama', style: blacktextStyle.copyWith(fontWeight: FontWeight.bold),),
                                    Text('Status',style: blacktextStyle.copyWith(fontWeight: FontWeight.bold)),
                                    ],
                                ),

                                // Tabel yang menampilkan semua nama siswa yang ada, dengan status null dan hadir
                                Column(
                                  children: [],
                                )
                              ],
                            ),)
                        ],
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
      ),
    );
  }
}
