import 'package:firebase_auth/firebase_auth.dart' show FirebaseAuthException;
import 'package:flutter/foundation.dart' show immutable;

final Map<String, AuthError> authErrorMap = {
  'invalid-email': AuthErrorInvalidEmail(),
  'invalid-credential': AuthErrorInvalidCredential(),
  'weak-password': AuthErrorWeakPassword(),
  'email-already-in-use': AuthErrorEmailAlreadyInUse(),
  'requires-recent-login': AuthErrorRequiresRecentLogin(),
  'too-many-requests': AuthErrorTooManyRequests(),
};

@immutable
abstract class AuthError {
  final String dialogTitle;
  final String dialogText;

  const AuthError({
    required this.dialogTitle,
    required this.dialogText,
  });

  factory AuthError.from(FirebaseAuthException exception) =>
      authErrorMap[exception.code.toLowerCase().trim()] ??
      AuthErrorUnknown(exception: exception.code);
}

class AuthErrorUnknown extends AuthError {
  final String exception;
  const AuthErrorUnknown({required this.exception})
      : super(
          dialogTitle: 'Authentication Error',
          dialogText: 'Unknown authentication error.',
        );
}

class AuthErrorInvalidEmail extends AuthError {
  const AuthErrorInvalidEmail({
    super.dialogTitle = 'Invalid Email',
    super.dialogText = 'Your input email is invalid, please try again.',
  });
}

class AuthErrorInvalidCredential extends AuthError {
  const AuthErrorInvalidCredential({
    super.dialogTitle = 'Invalid Credentials',
    super.dialogText = 'email and password was wrong, please try again.',
  });
}

class AuthErrorWeakPassword extends AuthError {
  const AuthErrorWeakPassword({
    super.dialogTitle = 'Weak Password',
    super.dialogText = 'your password is low, please create a strong password',
  });
}

class AuthErrorEmailAlreadyInUse extends AuthError {
  const AuthErrorEmailAlreadyInUse({
    super.dialogTitle = 'Email Already in use',
    super.dialogText = 'your email already in use, please using another email',
  });
}

class AuthErrorRequiresRecentLogin extends AuthError {
  const AuthErrorRequiresRecentLogin({
    super.dialogTitle = 'Requires recent login',
    super.dialogText =
        'You need to log out and log in again to perform this operation',
  });
}

class AuthErrorTooManyRequests extends AuthError {
  const AuthErrorTooManyRequests({
    super.dialogTitle = 'Too many Requests',
    super.dialogText = 'Too many request, please try again.',
  });
}
