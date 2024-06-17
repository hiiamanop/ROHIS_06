// ignore_for_file: file_names

import 'dart:convert';
import 'package:http/http.dart' as http;

class UserClassesController {
  static const String baseUrl = 'http://localhost:8000/api';

  Future<Map<String, dynamic>> getAllClasses(String token) async {
    final response = await http.get(
      Uri.parse('$baseUrl/classes'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load classes');
    }
  }

  Future<Map<String, dynamic>> getClassById(String id, String token) async {
    final response = await http.get(
      Uri.parse('$baseUrl/classes/$id'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load class');
    }
  }

  Future<Map<String, dynamic>> createClass(
      Map<String, dynamic> classData, String token) async {
    final response = await http.post(
      Uri.parse('$baseUrl/classes'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: json.encode(classData),
    );

    if (response.statusCode == 201) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to create class');
    }
  }

  Future<Map<String, dynamic>> updateClass(
      String id, Map<String, dynamic> classData, String token) async {
    final response = await http.put(
      Uri.parse('$baseUrl/classes/$id'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: json.encode(classData),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to update class');
    }
  }

  Future<Map<String, dynamic>> deleteClassById(String id, String token) async {
    final response = await http.delete(
      Uri.parse('$baseUrl/classes/$id'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to delete class');
    }
  }
}
