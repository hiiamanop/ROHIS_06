import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LoginController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> login(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      String userId = userCredential.user?.uid ?? '';
      String accountType = await _retrieveAccountTypeFromFirebase(userId);

      return accountType;
    } catch (e) {
      print('Login failed: $e');
      return '';
    }
  }

  Future<String> _retrieveAccountTypeFromFirebase(String userId) async {
    try {
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get();

      if (snapshot.exists) {
        Map<String, dynamic>? userData = snapshot.data() as Map<String, dynamic>?;
        return userData?['accountType'] ?? '';
      } else {
        return '';
      }
    } catch (e) {
      print('Error retrieving account type: $e');
      return '';
    }
  }
}