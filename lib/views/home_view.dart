import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo/consts.dart';
import 'package:todo/widgets/todo_item_widget.dart';

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
