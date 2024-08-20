import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

part 'tasks_state.dart';

class TasksCubit extends Cubit<TasksState> {
  TasksCubit() : super(TasksInitial());
  User? user = FirebaseAuth.instance.currentUser;

  Future<void> addTask({
    required String taskTitle,
    required String taskDescription,
    required bool isCompleted,
    // required String id,
  }) async {
    if (user != null) {
      String uid = user!.uid;
      CollectionReference tasks = FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .collection('tasks');

      try {
        emit(TasksAddLoading());
        await tasks.add({
          'title': taskTitle,
          'description': taskDescription,
          'time': DateTime.now(),
          'isCompleted': isCompleted,
          // 'id': id,
        });
        emit(TasksAddSuccess());
      } catch (e) {
        emit(TasksAddFailure(errorMessage: e.toString()));
      }
    } else {
      print('No user is signed in.');
    }
  }

  getTask() {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      String uid = user.uid;
      return FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .collection('tasks')
          .orderBy('time', descending: true)
          .snapshots();
    } else {
      throw Exception('No user is signed in');
    }
  }

  Future<void> completeTask({
    required String taskTitle,
    required String taskDescription,
    required bool isCompleted,
    // required String id,
  }) async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      String uid = user.uid;
      CollectionReference completeTask = FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .collection('completeTasks');

      try {
        emit(TasksDoneLoading());
        await completeTask.add({
          'title': taskTitle,
          'description': taskDescription,
          'isCompleted': isCompleted,
          'time': DateTime.now(),
          // 'id': id,
        });
        emit(TasksDoneSuccess());
      } catch (e) {
        emit(
          TasksDoneFailure(errorMessage: e.toString()),
        );
      }
    } else {
      print('no user');
    }
  }

  getCompleteTask() {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      String uid = user.uid;
      return FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .collection('completeTasks')
          .orderBy('time', descending: true)
          .snapshots();
    } else {
      throw Exception('No User login');
    }
  }

  delete(String taskId) {
    // emit(TasksDeleteLoading());
    User? user = FirebaseAuth.instance.currentUser;
    String uid = user!.uid;
    try {
      DocumentReference task = FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .collection('tasks')
          .doc(taskId);

      return task.delete().then((value) => emit(TasksDeleteSuccess()));
    } catch (e) {
      emit(TasksDeleteFailure(errorMessage: e.toString()));
    }
  }
}
