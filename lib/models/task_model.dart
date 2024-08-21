import 'package:cloud_firestore/cloud_firestore.dart';

class TaskModel {
  final String title;
  final String description;
  final Timestamp dateTime;
  bool isCompleted;

  final String image;

  TaskModel({
    required this.image,
    required this.isCompleted,
    required this.title,
    required this.description,
    required this.dateTime,
  });
  factory TaskModel.fromJson(json) {
    return TaskModel(
      image: json['image'],
      title: json['title'].toString(),
      description: json['description'],
      dateTime: json['time'],
      isCompleted: json['isCompleted'],
    );
  }
}
