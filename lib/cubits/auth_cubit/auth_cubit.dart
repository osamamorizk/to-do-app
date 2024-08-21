import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  userLogin({required String email, required String password}) async {
    emit(AuthLoading());
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(AuthLoginSuccess(successMessage: "Login Successfuly"));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-credential') {
        emit(AuthFailure(errorMessage: 'Invalid credential'));
      }
    } catch (e) {
      emit(AuthFailure(errorMessage: e.toString()));
    }
  }

  userRegister({required String email, required String password}) async {
    emit(AuthLoading());
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      emit(AuthRegisterSuccess(successMessage: 'Register Successfluy'));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(AuthFailure(errorMessage: 'The password is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        emit(AuthFailure(
            errorMessage: 'The account already exists for that email.'));
      } else if (e.code == 'invalid-email') {
        emit(AuthFailure(errorMessage: 'The email address is badly formatted'));
      }
    } catch (e) {
      emit(AuthFailure(errorMessage: e.toString()));
    }
  }

  logOut() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      try {
        await FirebaseAuth.instance.signOut();

        emit(AuthLogOutSuccess(successMessage: 'Log out successfluly'));
      } catch (e) {
        emit(AuthFailure(errorMessage: e.toString()));
      }
    }
  }
}
