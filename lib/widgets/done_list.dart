import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/consts.dart';
import 'package:todo/cubits/tasks_cubit/tasks_cubit.dart';
import 'package:todo/models/task_model.dart';
import 'package:todo/widgets/todo_item_widget.dart';

class DoneList extends StatelessWidget {
  const DoneList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final taskCubit = BlocProvider.of<TasksCubit>(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 8, top: 8),
                  child: Text(
                    'Done',
                    style: TextStyle(
                        fontSize: 20,
                        color: kColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            StreamBuilder<QuerySnapshot>(
                stream: taskCubit.getCompleteTask(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  final List<TaskModel> completeTasks = [];
                  for (var task in snapshot.data!.docs) {
                    completeTasks.add(TaskModel.fromJson(task));
                  }

                  return SizedBox(
                    height: 630,
                    child: ListView.builder(
                        padding: const EdgeInsets.only(top: 0),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        itemCount: completeTasks.length,
                        itemBuilder: (context, index) => Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: TodoItem(
                                taskModel: completeTasks[index],
                                isChecked: true,
                              ),
                            )),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
