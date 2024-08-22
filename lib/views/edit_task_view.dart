import 'package:flutter/material.dart';
import 'package:todo/consts.dart';
import 'package:todo/widgets/edit_task_widget.dart';

class EditTaskView extends StatelessWidget {
  const EditTaskView({
    super.key,
  });
  static String id = 'edit';
  // final String taskId;
  // final String collection;
  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
        backgroundColor: kColorBackground,
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 240, 237, 237),
          scrolledUnderElevation: 0,
          leading: const Icon(
            Icons.edit,
            color: kColor,
          ),
          title: const Text(
            "Edit Task",
            style: TextStyle(
              color: kColorHints,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
        body: EditTaskWidget(
          taskModel: arguments['taskModel'],
          collection: arguments["collection"]!,
          taskId: arguments['taskId']!,
        ));
  }
}
