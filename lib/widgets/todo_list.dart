import 'package:flutter/material.dart';
import 'package:todo/consts.dart';
import 'package:todo/widgets/todo_item_widget.dart';

class TodoList extends StatelessWidget {
  const TodoList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 8, top: 5),
                  child: Expanded(
                    child: Text(
                      'To Do',
                      style: TextStyle(
                          fontSize: 20,
                          color: kColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 610,
              child: ListView.builder(
                  padding: const EdgeInsets.only(top: 0),
                  clipBehavior: Clip.antiAlias,
                  itemCount: 10,
                  itemBuilder: (context, index) => const Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: TodoItem(),
                      )),
            ),
          ],
        ),
      ),
    );
  }
}
