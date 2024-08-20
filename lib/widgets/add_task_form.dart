import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todo/consts.dart';
import 'package:todo/cubits/tasks_cubit/tasks_cubit.dart';
import 'package:todo/widgets/ImageList_widget.dart';
import 'package:todo/widgets/add_task_custom_button.dart';
import 'package:todo/widgets/addtask_custom_text_field.dart';

class AddTaskForm extends StatefulWidget {
  const AddTaskForm({super.key});

  @override
  State<AddTaskForm> createState() => _AddTaskFormState();
}

class _AddTaskFormState extends State<AddTaskForm> {
  TextEditingController titleController = TextEditingController();

  TextEditingController descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TasksCubit, TasksState>(
      listener: (context, state) {
        if (state is TasksAddSuccess) {
          Navigator.pop(context);
          Fluttertoast.showToast(
              msg: "Task Added",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black,
              textColor: Colors.white,
              fontSize: 16.0);
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            AddtaskCustomTextField(controller: titleController, hint: 'Title'),
            const SizedBox(
              height: 20,
            ),
            AddtaskCustomTextField(
                controller: descController, hint: 'Description'),
            const SizedBox(
              height: 32,
            ),
            const ImageList(),
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ConditionalBuilder(
                  fallback: (context) =>
                      const Center(child: CircularProgressIndicator()),
                  condition: state is! TasksAddLoading,
                  builder: (context) => AddTaskCustomButton(
                    onTap: () async {
                      await BlocProvider.of<TasksCubit>(context).addTask(
                          isCompleted: false,
                          taskTitle: titleController.text,
                          taskDescription: descController.text);
                    },
                    title: 'Add Task',
                    color: kColor,
                  ),
                ),
                AddTaskCustomButton(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  title: "Cancel",
                  color: Colors.red,
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        );
      },
    );
  }
}
