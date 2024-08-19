import 'package:flutter/material.dart';
import 'package:todo/widgets/done_list.dart';
import 'package:todo/widgets/todo_list.dart';

class HomeBodyWidget extends StatelessWidget {
  const HomeBodyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        SizedBox(height: 5),
        TodoList(),
        DoneList(),
      ],
    );
  }
}
