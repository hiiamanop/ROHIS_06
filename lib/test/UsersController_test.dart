// ignore_for_file: file_names, depend_on_referenced_packages

import 'package:absensi_rohis/controller/UsersController.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('UsersController Tests', () {
    late UsersController usersController;

    setUp(() {
      usersController = UsersController();
    });

    test('Register User', () async {
      final response = await usersController.register(
        'John Doe',
        'john.doe@example.com',
        'password',
        123456,
        1,
      );
      expect(response.containsKey('message'), true);
      expect(response['message'], 'User registered successfully');
      expect(response.containsKey('user'), true);
    });

    test('Login User', () async {
      final response = await usersController.login(
        'john.doe@example.com',
        'password',
      );
      expect(response.containsKey('message'), true);
      expect(response['message'], 'Login successful');
      expect(response.containsKey('token'), true);
      expect(response.containsKey('user'), true);
    });

    test('Get All Users', () async {
      final response = await usersController.getAllUsers('your-auth-token');
      expect(response['users'], isList);
      expect(response['users'].length, greaterThan(0));
    });

    test('Get User By ID', () async {
      const userId = '1'; // Replace with an existing user ID
      final response =
          await usersController.getUserById(userId, 'your-auth-token');
      expect(response.containsKey('user'), true);
    });

    test('Delete User By ID', () async {
      const userId = '1'; // Replace with an existing user ID to delete
      final response =
          await usersController.deleteUserById(userId, 'your-auth-token');
      expect(response.containsKey('message'), true);
      expect(response['message'], 'User deleted successfully');
    });

    // Add more tests as needed for other UsersController methods
  });
}
