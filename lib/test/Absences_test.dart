// ignore_for_file: file_names, depend_on_referenced_packages

import 'package:absensi_rohis/controller/AbsenceController.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AbsencesController Tests', () {
    late AbsencesController absencesController;

    setUp(() {
      absencesController = AbsencesController();
    });

    test('Get All Absences', () async {
      final response =
          await absencesController.getAllAbsences('your-auth-token');
      expect(response['absences'], isList);
      // Add more assertions based on your API response structure
    });

    test('Get Absence by ID', () async {
      const absenceId = '1'; // Replace with a valid absence ID
      final response =
          await absencesController.getAbsenceById(absenceId, 'your-auth-token');
      expect(response.containsKey('absence'), true);
      // Add more assertions based on your API response structure
    });

    test('Scan QR Code', () async {
      const qrCode = 'MTIxMjg4Mw=='; // Replace with a valid QR code
      final response =
          await absencesController.scanQrCode(qrCode, 'your-auth-token');
      expect(response.containsKey('absence'), true);
      // Add more assertions based on your API response structure
    });

    // Add more tests as needed for other AbsencesController methods
  });
}
