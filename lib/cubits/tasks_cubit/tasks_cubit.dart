import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

part 'tasks_state.dart';

class TasksCubit extends Cubit<TasksState> {
  TasksCubit() : super(TasksInitial());
  User? user = FirebaseAuth.instance.currentUser;
  String image = 'assets/images/0.png';

  Future<void> addTask({
    required String taskTitle,
    required String taskDescription,
    required bool isCompleted,
    required String image,
    required DateTime time,
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
          'time': time,
          'isCompleted': isCompleted,
          'image': image,
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
          .orderBy('time', descending: false)
          .snapshots();
    } else {
      emit(NoUserSigned());
      // Navigator.pushNamed(context, LoginView.id);
      // throw Exception('No user is signed in');
    }
  }

  Future<void> completeTask({
    required String taskTitle,
    required String taskDescription,
    required bool isCompleted,
    required String image,
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
          'image': image,
        });
        emit(TasksDoneSuccess());
      } catch (e) {
        emit(
          TasksDoneFailure(errorMessage: e.toString()),
        );
      }
    } else {
      log('no user');
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
      emit(NoUserSigned());
    }
  }

  delete(String taskId, String collection) {
    // emit(TasksDeleteLoading());
    User? user = FirebaseAuth.instance.currentUser;
    String uid = user!.uid;

    try {
      DocumentReference task = FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .collection(collection)
          .doc(taskId);

      return task.delete().then((value) => emit(TasksDeleteSuccess()));
    } catch (e) {
      emit(TasksDeleteFailure(errorMessage: e.toString()));
    }
  }

  editTask(String taskId, String collection, Map<Object, Object?> data) {
    User? user = FirebaseAuth.instance.currentUser;
    String uid = user!.uid;

    try {
      DocumentReference task = FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .collection(collection)
          .doc(taskId);

      task.update(data);
      emit(TasksUpdatedSuccess());
    } catch (e) {
      emit(TasksDeleteFailure(errorMessage: e.toString()));
    }
  }
}

// var collection = FirebaseFirestore.instance.collection('collection');
// collection 
//     .doc('doc_id') 
//     .update({'key' : 'value'}) // <-- Updated data
//     .then((_) => print('Success'))
//     .catchError((error) => print('Failed: $error'));

