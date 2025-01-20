part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent extends Equatable {
  const AuthEvent();
}

@immutable
class AuthEventInitialize implements AuthEvent {
  const AuthEventInitialize();

  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => false;
}

// events authentication
@immutable
class AuthEventLogIn implements AuthEvent {
  final String email;
  final String password;

  const AuthEventLogIn({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [email, password];

  @override
  bool? get stringify => false;
}

@immutable
class AuthEventLogOut implements AuthEvent {
  const AuthEventLogOut();
  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => false;
}

@immutable
class AuthEventRegister implements AuthEvent {
  final String displayName;
  final String email;
  final String password;

  const AuthEventRegister({
    required this.displayName,
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [email, password];

  @override
  bool? get stringify => false;
}

@immutable
class AuthEventEditProfile implements AuthEvent {
  final String newName;
  final String newEmail;
  final String newAddress;

  const AuthEventEditProfile({
    required this.newName,
    required this.newEmail,
    required this.newAddress,
  });

  @override
  List<Object?> get props => [newName, newEmail, newAddress];

  @override
  bool? get stringify => false;
}

@immutable
class AuthEventChangePassword implements AuthEvent {
  final String newPassword;
  const AuthEventChangePassword({required this.newPassword});

  @override
  List<Object?> get props => [newPassword];

  @override
  bool? get stringify => false;
}

@immutable
class AuthEventResetPassword implements AuthEvent {
  final String email;
  const AuthEventResetPassword({required this.email});

  @override
  List<Object?> get props => [email];

  @override
  bool? get stringify => false;
}
