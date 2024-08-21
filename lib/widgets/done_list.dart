import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todo/consts.dart';
import 'package:todo/cubits/tasks_cubit/tasks_cubit.dart';
import 'package:todo/models/task_model.dart';
import 'package:todo/widgets/todo_item_widget.dart';

class DoneList extends StatefulWidget {
  const DoneList({
    super.key,
  });

  @override
  State<DoneList> createState() => _DoneListState();
}

class _DoneListState extends State<DoneList> {
  late Map<String, bool> isCompletedtask = {};
  late String taskId;
  @override
  Widget build(BuildContext context) {
    final taskCubit = BlocProvider.of<TasksCubit>(context);

    return BlocConsumer<TasksCubit, TasksState>(
      listener: (context, state) {
        if (state is TasksAddSuccess) {
          taskCubit.delete(taskId, 'completeTasks');
          Fluttertoast.showToast(
              msg: "Get task done soon !",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black,
              textColor: Colors.white,
              fontSize: 16.0);
        }
      },
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                StreamBuilder<QuerySnapshot>(
                    stream: taskCubit.getCompleteTask(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (!snapshot.hasData) {
                        return const SizedBox(
                            height: 600,
                            child: Center(child: CircularProgressIndicator()));
                      }
                      final List<TaskModel> completeTasks = [];
                      for (var task in snapshot.data!.docs) {
                        TaskModel taskModel = TaskModel.fromJson(task);
                        completeTasks.add(taskModel);

                        if (!isCompletedtask.containsKey(taskModel.title)) {
                          isCompletedtask[taskModel.title] =
                              taskModel.isCompleted;
                        }
                      }

                      return SizedBox(
                        height: 630,
                        child: completeTasks.isEmpty
                            ? const Center(
                                child: Text(
                                  "Get Things Done !",
                                  style: TextStyle(
                                      fontSize: 18, color: kColorHints),
                                ),
                              )
                            : ListView.builder(
                                padding: const EdgeInsets.only(top: 20),
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                itemCount: completeTasks.length,
                                itemBuilder: (context, index) => Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 10),
                                      child: TodoItem(
                                        value: isCompletedtask[
                                            completeTasks[index].title]!,
                                        onChanged: (value) async {
                                          setState(() {
                                            isCompletedtask[completeTasks[index]
                                                .title] = value!;
                                          });
                                          await taskCubit.addTask(
                                              image: completeTasks[index].image,
                                              isCompleted: false,
                                              taskTitle:
                                                  completeTasks[index].title,
                                              taskDescription:
                                                  completeTasks[index]
                                                      .description);
                                          taskId =
                                              snapshot.data!.docs[index].id;
                                        },
                                        taskModel: completeTasks[index],
                                        isChecked: isCompletedtask[
                                            completeTasks[index].title]!,
                                      ),
                                    )),
                      );
                    }),
              ],
            ),
          ),
        );
      },
    );
  }
}
