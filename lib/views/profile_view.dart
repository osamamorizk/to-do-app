import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/consts.dart';
import 'package:todo/cubits/tasks_cubit/tasks_cubit.dart';
import 'package:todo/widgets/profile_widget.dart';
import 'package:todo/widgets/task_percent_indicator.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Profile',
          style: TextStyle(
            color: kColorHints,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      body: ProfileBody(),
    );
  }
}

////
///

class ProfileBody extends StatelessWidget {
  const ProfileBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final taskCubit = BlocProvider.of<TasksCubit>(context);

    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: taskCubit.getTask(),
        builder: (context, taskSnapshot) {
          if (!taskSnapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          int todoNum = taskSnapshot.data!.docs.length;
          log(todoNum.toString());

          return StreamBuilder<QuerySnapshot>(
            stream: taskCubit.getCompleteTask(),
            builder: (context, completedTaskSnapshot) {
              if (!completedTaskSnapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }

              int completedTasks = completedTaskSnapshot.data!.docs.length;
              int alltasks = completedTasks + todoNum;
              double percent = alltasks == 0 ? 0.0 : completedTasks / alltasks;

              return SingleChildScrollView(
                child: Column(
                  children: [
                    ProfileWidget(
                      todoNumber: todoNum,
                      doneNumber: completedTasks,
                    ),
                    Center(
                      child: TaskPercentIndicator(
                        percent: percent,
                        completedTasks: completedTasks,
                        totalTasks: alltasks,
                      ),
                    )
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
/////

