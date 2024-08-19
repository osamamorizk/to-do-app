import 'package:flutter/material.dart';
import 'package:todo/consts.dart';
import 'package:todo/widgets/ImageList_widget.dart';
import 'package:todo/widgets/add_task_custom_button.dart';
import 'package:todo/widgets/addtask_custom_text_field.dart';

class AddTaskForm extends StatelessWidget {
  const AddTaskForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(
          height: 20,
        ),
        AddtaskCustomTextField(hint: 'Title'),
        SizedBox(
          height: 20,
        ),
        AddtaskCustomTextField(hint: 'Describtion'),
        SizedBox(
          height: 32,
        ),
        ImageList(),
        SizedBox(
          height: 32,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AddTaskCustomButton(
              title: 'Add Task',
              color: kColor,
            ),
            AddTaskCustomButton(
              title: "Cancel",
              color: Colors.red,
            ),
          ],
        ),
        SizedBox(
          height: 40,
        ),
      ],
    );
  }
}
