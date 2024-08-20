import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/bloc_observer.dart';
import 'package:todo/firebase_options.dart';
import 'package:todo/views/home_view.dart';
import 'package:todo/views/login_view.dart';
import 'package:todo/views/register_view.dart';
import 'package:todo/widgets/custom_bottom_nav_barr.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ToDoApp());
  Bloc.observer = MyBlocObserver();
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        RegisterView.id: (context) => const RegisterView(),
        LoginView.id: (context) => const LoginView(),
        HomeView.id: (context) => const HomeView(),
      },
      home: AuthChecker(),
    );
  }
}

class AuthChecker extends StatelessWidget {
  const AuthChecker({super.key});

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      return LoginView();
    } else {
      return CustomBottomNavigationBar();
    }
  }
}
