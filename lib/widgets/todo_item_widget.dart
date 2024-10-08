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
      // required this.isChecked,
      required this.value,
      this.onTap});
  final TaskModel taskModel;
  final void Function(bool?)? onChanged;

  final bool value;
  final void Function()? onTap;

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
                SizedBox(
                  width: 200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Checkbox(
                          value: widget.value, onChanged: widget.onChanged),
                      const SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.taskModel.title),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(widget.taskModel.description),
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TimeWidget(
                      date: formatDate(widget.taskModel.dateTime.toDate(),
                          [d, '/', M, ' - ', h, ':', nn, ' ', am]),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    EditWidget(
                      onTap: widget.onTap,
                    )
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
