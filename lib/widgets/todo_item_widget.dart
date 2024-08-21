import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';

import 'package:todo/models/task_model.dart';
import 'package:todo/widgets/edit_widget.dart';
import 'package:todo/widgets/time_widget.dart';

class TodoItem extends StatefulWidget {
  const TodoItem(
      {super.key,
      required this.taskModel,
      this.onChanged,
      required this.isChecked,
      required this.value});
  final TaskModel taskModel;
  final void Function(bool?)? onChanged;
  final bool isChecked;
  final bool value;

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 115,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Checkbox(value: widget.value, onChanged: widget.onChanged),
                    const SizedBox(width: 70),
                    SizedBox(
                      width: 80,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.taskModel.title),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(widget.taskModel.description),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    TimeWidget(
                      date: formatDate(
                          widget.taskModel.dateTime.toDate(), [HH, ':', nn]),
                      //dd, '/', mm, '_',
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    EditWidget()
                  ],
                ),
              ],
            ),
            Image(
                height: 100,
                width: 100,
                image: AssetImage(widget.taskModel.image)),
          ],
        ),
      ),
    );
  }
}
