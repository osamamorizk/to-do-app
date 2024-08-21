import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todo/consts.dart';
import 'package:todo/cubits/tasks_cubit/tasks_cubit.dart';
import 'package:todo/models/task_model.dart';
import 'package:todo/views/home_view.dart';
import 'package:todo/widgets/ImageList_widget.dart';
import 'package:todo/widgets/add_task_custom_button.dart';
import 'package:todo/widgets/addtask_custom_text_field.dart';
import 'package:todo/widgets/custom_bottom_nav_barr.dart';

class EditTaskWidget extends StatefulWidget {
  const EditTaskWidget(
      {super.key,
      required this.taskId,
      required this.collection,
      required this.taskModel});
  final String taskId;
  final String collection;
  final TaskModel taskModel;
  @override
  State<EditTaskWidget> createState() => _EditTaskWidgetState();
}

class _EditTaskWidgetState extends State<EditTaskWidget> {
  TextEditingController titleController = TextEditingController();

  TextEditingController descController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  late DateTime selectedDate = widget.taskModel.dateTime.toDate();
  String? title, description;
  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2050));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TasksCubit, TasksState>(
      listener: (context, state) {
        if (state is TasksUpdatedSuccess) {
          Navigator.pop(context);
          Fluttertoast.showToast(
              msg: "Task Updated",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black,
              textColor: Colors.white,
              fontSize: 16.0);
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (context) => CustomBottomNavigationBar()),
              (Route<dynamic> route) => false);
        }
      },
      builder: (context, state) {
        return Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  AddtaskCustomTextField(
                      onChanged: (value) {
                        title = value;
                      },
                      controller: titleController,
                      hint: widget.taskModel.title),
                  const SizedBox(
                    height: 20,
                  ),
                  AddtaskCustomTextField(
                      onChanged: (value) {
                        description = value;
                      },
                      controller: descController,
                      hint: widget.taskModel.description),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 150,
                    child: CupertinoDatePicker(
                      minimumYear: 2024,
                      maximumDate: DateTime(2026),
                      backgroundColor: kColorBackground,
                      mode: CupertinoDatePickerMode.dateAndTime,
                      initialDateTime: DateTime.now(),
                      onDateTimeChanged: (DateTime newDateTime) {
                        setState(() {
                          selectedDate = newDateTime;
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
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
                            ///  widget.note.title = title ?? widget.note.title;

                            ///

                            BlocProvider.of<TasksCubit>(context)
                                .editTask(widget.taskId, widget.collection, {
                              'title': widget.taskModel.title =
                                  title ?? widget.taskModel.title,
                              'description': widget.taskModel.description =
                                  description ?? widget.taskModel.description,
                              'time': selectedDate,
                              'image':
                                  BlocProvider.of<TasksCubit>(context).image
                            });
                          },
                          title: 'Edit Task',
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
                    height: 50,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
