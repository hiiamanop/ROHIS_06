import 'package:absensi_rohis/controller/AbsenceController.dart';
import 'package:flutter/material.dart';
import 'package:absensi_rohis/theme/theme.dart';

class DaftarHadirPage extends StatefulWidget {
  const DaftarHadirPage({Key? key}) : super(key: key);

  @override
  _DaftarHadirPageState createState() => _DaftarHadirPageState();
}

class _DaftarHadirPageState extends State<DaftarHadirPage> {
  AbsencesController _absencesController = AbsencesController();
  List<Map<String, dynamic>> _absences = [];

  @override
  void initState() {
    super.initState();
    fetchAbsences();
  }

  Future<void> fetchAbsences() async {
    try {
      // Replace 'your_token_here' with actual token retrieval logic
      String token = 'your_token_here';

      // Call method from AbsencesController to get all absences
      Map<String, dynamic> response =
          await _absencesController.getAllAbsences(token);

      setState(() {
        _absences = response['absences'].cast<Map<String, dynamic>>();
      });
    } catch (e) {
      // Handle error
      print('Error fetching absences: $e');
      // Optionally, show error message to user
    }
  }

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
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Daftar Hadir",
                          style: blacktextStyle.copyWith(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: greyColor,
                          borderRadius: BorderRadius.circular(12)),
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.7,
                      child: _absences.isNotEmpty
                          ? ListView.builder(
                              itemCount: _absences.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        _absences[index]['student']['name'],
                                        style: blacktextStyle.copyWith(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                          _absences[index]['status'] == 'absent'
                                              ? 'Hadir'
                                              : '-')
                                    ],
                                  ),
                                );
                              },
                            )
                          : Center(
                              child:
                                  CircularProgressIndicator()), // Menampilkan loading indicator jika data masih belum terambil
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
