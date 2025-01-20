import 'package:bloc/bloc.dart';
import 'package:e_commerce/data/api/firebase/auth/auth_errors.dart';
import 'package:e_commerce/data/api/firebase/auth/auth_service.dart';
import 'package:e_commerce/data/api/firebase/firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(CloudAuth cloudAuth)
      : super(const AuthStateUninitialized(isLoading: false)) {
    // initialize
    on<AuthEventInitialize>((event, emit) async {
      await cloudAuth.initialize();
      final user = cloudAuth.currentUser;

      if (user == null) {
        emit(const AuthStateLoggedOut(isLoading: false));
      } else {
        final getAddress = await CloudFirestore().getAddress(
          userId: user.uid,
        );
        emit(AuthStateLoggedIn(
          isLoading: false,
          user: user,
          profile: getAddress.address,
        ));
      }
    });
    // handle user authentication
    on<AuthEventRegister>((event, emit) async {
      try {
        emit(const AuthStateRegisterView(isLoading: true));
        await cloudAuth.createUser(
          displayName: event.displayName,
          email: event.email,
          password: event.password,
        );
        emit(const AuthStateRegisterView(isLoading: false));
      } on FirebaseAuthException catch (e) {
        emit(
          AuthStateRegisterView(
            isLoading: false,
            authError: AuthError.from(e),
          ),
        );
      }
    });
    on<AuthEventLogIn>((event, emit) async {
      try {
        emit(
          const AuthStateLoggedOut(isLoading: true),
        );
        final user = await cloudAuth.logIn(
          email: event.email,
          password: event.password,
        );
        final getAddress = await CloudFirestore().getAddress(
          userId: user!.uid,
        );
        emit(
          AuthStateLoggedIn(
            isLoading: false,
            user: user,
            profile: getAddress.address,
          ),
        );
      } on FirebaseAuthException catch (e) {
        emit(
          AuthStateLoggedOut(
            isLoading: false,
            authError: AuthError.from(e),
          ),
        );
      }
    });
    on<AuthEventLogOut>((event, emit) async {
      try {
        emit(
          const AuthStateLoggedOut(isLoading: true),
        );
        await cloudAuth.logOut();
        emit(
          const AuthStateLoggedOut(isLoading: false),
        );
      } on FirebaseAuthException catch (e) {
        emit(
          AuthStateLoggedOut(
            isLoading: false,
            authError: AuthError.from(e),
          ),
        );
      }
    });
    on<AuthEventEditProfile>(
      (event, emit) async {
        try {
          emit(AuthStateLoggedIn(isLoading: true));
          final user = cloudAuth.currentUser;
          await cloudAuth.updateAccount(
            newDisplayName: event.newName,
            newEmail: event.newEmail,
          );
          await CloudFirestore().createAddress(
            userId: user!.uid,
            address: event.newAddress,
          );
          final newAddress = await CloudFirestore().getAddress(
            userId: user.uid,
          );
          emit(AuthStateLoggedIn(
            isLoading: false,
            user: user,
            profile: newAddress.address,
          ));
        } on FirebaseAuthException catch (e) {
          emit(
            AuthStateLoggedIn(
              isLoading: false,
              authError: AuthError.from(e),
            ),
          );
        }
      },
    );
    on<AuthEventChangePassword>(
      (event, emit) async {
        try {
          emit(AuthStateLoggedIn(isLoading: true));
          await cloudAuth.changePassword(
            newPassword: event.newPassword,
          );
          emit(AuthStateLoggedIn(isLoading: false));
        } on FirebaseAuthException catch (e) {
          emit(
            AuthStateLoggedIn(
              isLoading: false,
              authError: AuthError.from(e),
            ),
          );
        }
      },
    );
    on<AuthEventResetPassword>(
      (event, emit) async {
        try {
          emit(AuthStateLoggedOut(isLoading: true));
          await cloudAuth.changePassword(
            newPassword: event.email,
          );
          emit(AuthStateLoggedOut(isLoading: false));
        } on FirebaseAuthException catch (e) {
          emit(
            AuthStateLoggedOut(
              isLoading: false,
              authError: AuthError.from(e),
            ),
          );
        }
      },
    );
  }
}
