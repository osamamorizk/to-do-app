import 'package:flutter/material.dart';
import 'package:todo/widgets/edit_widget.dart';
import 'package:todo/widgets/time_widget.dart';

class TodoItem extends StatefulWidget {
  const TodoItem({super.key});

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  bool isChecked = true;
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  // mainAxisAlignment: MainAxisAlignment.s,
                  children: [
                    Checkbox(
                      value: isChecked,
                      onChanged: (value) {
                        isChecked = value!;
                        setState(() {});
                      },
                    ),
                    const SizedBox(width: 50),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("todo name"),
                        SizedBox(
                          height: 8,
                        ),
                        Text('todo description'),
                      ],
                    ),
                  ],
                ),
                const Row(
                  children: [
                    TimeWidget(),
                    SizedBox(
                      width: 10,
                    ),
                    EditWidget()
                  ],
                ),
              ],
            ),
            const Image(
                height: 100,
                width: 100,
                image: AssetImage('assets/images/0.png')),
          ],
        ),
      ),
    );
  }
}
