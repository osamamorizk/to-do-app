import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todo/consts.dart';
import 'package:todo/cubits/tasks_cubit/tasks_cubit.dart';
import 'package:todo/models/task_model.dart';
import 'package:todo/widgets/todo_item_widget.dart';

class TodoList extends StatefulWidget {
  const TodoList({
    super.key,
  });

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  late String taskId;
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    final taskCubit = BlocProvider.of<TasksCubit>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: BlocConsumer<TasksCubit, TasksState>(
        listener: (context, state) {
          if (state is! TasksDoneLoading) {
            isChecked = false;
          } else {
            isChecked = true;
          }
          if (state is TasksDoneSuccess) {
            taskCubit.delete(taskId);
            Fluttertoast.showToast(
                msg: "Great !",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.black,
                textColor: Colors.white,
                fontSize: 16.0);
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 8, top: 5),
                      child: Expanded(
                        child: Text(
                          'To Do',
                          style: TextStyle(
                              fontSize: 20,
                              color: kColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
                StreamBuilder<QuerySnapshot>(
                  stream: taskCubit.getTask(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    final List<TaskModel> tasks = [];
                    for (var task in snapshot.data!.docs) {
                      tasks.add(TaskModel.fromJson(task));
                    }

                    return SizedBox(
                      height: 600,
                      child: ListView.builder(
                          padding: const EdgeInsets.only(top: 0),
                          clipBehavior: Clip.antiAlias,
                          itemCount: tasks.length,
                          itemBuilder: (context, index) => Padding(
                                padding: EdgeInsets.only(bottom: 10),
                                child: TodoItem(
                                  isChecked: isChecked,
                                  onChanged: (value) async {
                                    value = true;
                                    setState(() {});
                                    taskCubit.completeTask(
                                        isCompleted: true,
                                        taskTitle: tasks[index].title,
                                        taskDescription:
                                            tasks[index].description);
                                    taskId = snapshot.data!.docs[index].id;
                                  },
                                  taskModel: tasks[index],
                                ),
                              )),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
