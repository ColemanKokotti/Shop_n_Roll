import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth;
  AuthService(this._firebaseAuth);

  Future<User?> login(String email, String password) async {
    try {
      final UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      print('Errore nel login: $e');
      throw AuthException('Login fallito. Si prega di riprovare.');
    }
  }

  Future<User?> register(String email, String password) async {
    try {
      final UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      print('Errore nella registrazione: $e');
      throw AuthException('Registrazione fallita. Si prega di riprovare.');
    }
  }

  Future<void> logout() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      print('Errore nel logout: $e');
      throw AuthException('Errore durante il logout.');
    }
  }
}

class AuthException implements Exception {
  final String message;
  AuthException(this.message);
}
