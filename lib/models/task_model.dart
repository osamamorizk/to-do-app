import 'package:cloud_firestore/cloud_firestore.dart';

class TaskModel {
  String title;
  String description;
  Timestamp dateTime;
  bool isCompleted;
  // final String id;
  final String image;

  TaskModel({
    required this.image,
    // required this.id,
    required this.isCompleted,
    required this.title,
    required this.description,
    required this.dateTime,
  });
  factory TaskModel.fromJson(json) {
    return TaskModel(
      image: json['image'],
      // id: json['id'],
      title: json['title'].toString(),
      description: json['description'],
      dateTime: json['time'],
      isCompleted: json['isCompleted'],
    );
  }
}
