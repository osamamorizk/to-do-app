import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static String id = 'home';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text('hello'),
    );
  }
}
