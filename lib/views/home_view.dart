import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo/consts.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static String id = 'home';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: kColorBackground,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TodoItem(),
            ],
          ),
        ));
  }
}

class TodoItem extends StatelessWidget {
  const TodoItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 115,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
