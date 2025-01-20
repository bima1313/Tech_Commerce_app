import 'package:e_commerce/firebase_options.dart' show DefaultFirebaseOptions;
import 'package:firebase_core/firebase_core.dart' show Firebase;
import 'package:firebase_auth/firebase_auth.dart' show FirebaseAuth, User;
import 'package:flutter/foundation.dart' show immutable;

@immutable
class CloudAuth {
  Future<void> initialize() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  Future<User?> createUser({
    required String displayName,
    required String email,
    required String password,
  }) async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .whenComplete(
      () {
        currentUser?.updateDisplayName(displayName);
      },
    );
    return currentUser;
  }

  Future<User?> logIn({
    required String email,
    required String password,
  }) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    return currentUser;
  }

  Future<void> updateAccount({
    required String newEmail,
    required String newDisplayName,
  }) async {
    final user = FirebaseAuth.instance.currentUser;

    await user?.verifyBeforeUpdateEmail(newEmail).whenComplete(
          () => user.updateDisplayName(newDisplayName),
        );
  }

  Future<User?> changePassword({required String newPassword}) async {
    await FirebaseAuth.instance.currentUser?.updatePassword(newPassword);

    return currentUser;
  }

  Future<User?> resetPassword({required String email}) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);

    return currentUser;
  }

  Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
  }

  User? get currentUser => FirebaseAuth.instance.currentUser;
}
