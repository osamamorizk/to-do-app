import 'package:flutter/material.dart';
import 'package:todo/consts.dart';
import 'package:todo/widgets/todo_item_widget.dart';

class DoneList extends StatelessWidget {
  const DoneList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 8, top: 8),
                  child: Text(
                    'Done',
                    style: TextStyle(
                        fontSize: 20,
                        color: kColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 630,
              child: ListView.builder(
                  padding: EdgeInsets.only(top: 0),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  itemCount: 10,
                  itemBuilder: (context, index) => const Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        // child: TodoItem(taskModel: ,),
                      )),
            ),
          ],
        ),
      ),
    );
  }
}
