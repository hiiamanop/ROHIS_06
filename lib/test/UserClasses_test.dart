// ignore_for_file: file_names

import 'package:absensi_rohis/controller/UserClassesController.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('UserClassesController Tests', () {
    late UserClassesController userClassesController;

    setUp(() {
      userClassesController = UserClassesController();
    });

    test('Get All Classes', () async {
      final response =
          await userClassesController.getAllClasses('your-auth-token');
      expect(response['classes'], isList);
      expect(response['classes'].length, greaterThan(0));
    });

    test('Get Class By ID', () async {
      const classId = '1'; // Replace with an existing class ID
      final response =
          await userClassesController.getClassById(classId, 'your-auth-token');
      expect(response.containsKey('class'), true);
    });

    test('Create Class', () async {
      final classData = {
        'name': 'Math Class',
      };
      final response =
          await userClassesController.createClass(classData, 'your-auth-token');
      expect(response.containsKey('class'), true);
      expect(response['class']['name'], 'Math Class');
    });

    test('Delete Class By ID', () async {
      const classId = '7'; // Replace with an existing class ID to delete
      final response = await userClassesController.deleteClassById(
          classId, 'your-auth-token');
      expect(response.containsKey('message'), true);
      expect(response['message'], 'Class deleted successfully');
    });

    // Add more tests as needed for other UserClassesController methods
  });
}
