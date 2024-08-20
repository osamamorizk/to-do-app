import 'package:cloud_firestore/cloud_firestore.dart';

class TaskModel {
  final String title;
  final String description;
  final Timestamp dateTime;
  final bool isCompleted;

  TaskModel({
    required this.isCompleted,
    required this.title,
    required this.description,
    required this.dateTime,
  });
  factory TaskModel.fromJson(json) {
    return TaskModel(
      title: json['title'].toString(),
      description: json['description'],
      dateTime: json['time'],
      isCompleted: json['isCompleted'],
    );
  }
}
