import 'package:flutter/material.dart';
import 'package:todo/consts.dart';
import 'package:todo/views/add_task_view.dart';
import 'package:todo/widgets/todo_list.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static String id = 'home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const Icon(
            Icons.task,
            color: kColor,
          ),
          scrolledUnderElevation: 0,
          backgroundColor: const Color.fromARGB(255, 240, 237, 237),
          title: const Text(
            'Tasks',
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
        body: TodoList());
  }
}
