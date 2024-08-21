import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
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
  final formKey = GlobalKey<FormState>();
  DateTime selectedDate = DateTime.now();

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
        return Form(
          key: formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              AddtaskCustomTextField(
                  controller: titleController, hint: 'Title'),
              const SizedBox(
                height: 20,
              ),
              AddtaskCustomTextField(
                  controller: descController, hint: 'Description'),
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
                        if (formKey.currentState!.validate()) {
                          await BlocProvider.of<TasksCubit>(context).addTask(
                            image: BlocProvider.of<TasksCubit>(context).image,
                            isCompleted: false,
                            taskTitle: titleController.text,
                            taskDescription: descController.text,
                            time: selectedDate,
                          );
                        }
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
                height: 50,
              ),
            ],
          ),
        );
      },
    );
  }
}

// class DatePicker extends StatelessWidget {
//   const DatePicker({
//     super.key,
//   });
//   // final DateTime selectedTime;
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 100,
//       child: CupertinoDatePicker(
//         mode: CupertinoDatePickerMode.dateAndTime,
//         initialDateTime: DateTime(1969, 1, 1, 11, 33),
//         onDateTimeChanged: (DateTime newDateTime) {
//           log(newDateTime.toString());
//         },
//         use24hFormat: false,
      
//         minuteInterval: 1,
//       ),
//     );
//   }
// }

// TimeOfDay selectedTime = TimeOfDay.now();



//  DateTime? selectedTime;

//   void pickDateDialog() {
//     showDatePicker(
//             context: context,
//             initialDate: DateTime.now(),
//             //which date will display when user open the picker
//             firstDate: DateTime(1950),
//             //what will be the previous supported year in picker
//             lastDate: DateTime(
//                 2025)) //what will be the up to supported date in picker
//         .then((pickedDate) {
//       //then usually do the future job
//       if (pickedDate == null) {
//         //if user tap cancel then this function will stop
//         return;
//       }
//       setState(() {
//         //for rebuilding the ui
//         selectedTime = pickedDate;
//       });
//     });
//   }