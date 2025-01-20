part of 'auth_bloc.dart';

@immutable
sealed class AuthState extends Equatable {
  final bool isLoading;
  final User? user;
  final String? profile;
  final AuthError? authError;
  const AuthState({
    required this.isLoading,
    this.user,
    this.profile,
    this.authError,
  });

  @override
  List<Object?> get props => [isLoading, user, profile, authError];
}

@immutable
class AuthStateUninitialized extends AuthState {
  const AuthStateUninitialized({required super.isLoading, super.user});
}

@immutable
class AuthStateLoggedOut extends AuthState {
  const AuthStateLoggedOut({
    required super.isLoading,
    super.authError,
  });
}

@immutable
class AuthStateRegisterView extends AuthState {
  const AuthStateRegisterView({
    required super.isLoading,
    super.authError,
  });
}

@immutable
class AuthStateLoggedIn extends AuthState {
  const AuthStateLoggedIn({
    required super.isLoading,
    super.user,
    super.profile,
    super.authError,
  });
}
