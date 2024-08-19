import 'package:flutter/material.dart';
import 'package:todo/consts.dart';
import 'package:todo/views/add_task_view.dart';
import 'package:todo/widgets/home_body_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static String id = 'home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Get Things Done',
          style: TextStyle(
            color: kColorHints,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      backgroundColor: kColorBackground,
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32),
        ),
        onPressed: () {
          showModalBottomSheet(
              backgroundColor: kColorBackground,
              isScrollControlled: true,
              context: context,
              builder: (context) => AddTaskView());
        },
        backgroundColor: kColor,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: const HomeBodyWidget(),
    );
  }
}
