import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      try {
        emit(LoginLoading());
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: event.email,
          password: event.password,
        );
        emit(LoginSuccess(successMessage: "Login Successfuly"));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'invalid-credential') {
          emit(LoginFailure(errorMessage: 'Invalid credential'));
        }
      } catch (e) {
        emit(LoginFailure(errorMessage: e.toString()));
      }
    });
  }
}
