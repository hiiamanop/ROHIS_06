// ignore_for_file: file_names

import 'dart:convert';
import 'package:http/http.dart' as http;

class AbsencesController {
  static const String baseUrl = 'http://localhost:8000/api';

  Future<Map<String, dynamic>> getAllAbsences(String token) async {
    final response = await http.get(
      Uri.parse('$baseUrl/absences'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load absences');
    }
  }

  Future<Map<String, dynamic>> getAbsenceById(String id, String token) async {
    final response = await http.get(
      Uri.parse('$baseUrl/absences/$id'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load absence');
    }
  }

  Future<Map<String, dynamic>> scanQrCode(String qrCode, String token) async {
    final response = await http.post(
      Uri.parse('$baseUrl/absences/scan-qr-code'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: json.encode({'qr_code': qrCode}),
    );

    if (response.statusCode == 201) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to scan QR code');
    }
  }
}
