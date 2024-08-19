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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 5, top: 8),
            child: Text(
              'Done',
              style: TextStyle(
                  fontSize: 20, color: kColor, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 290,
            child: ListView.builder(
                padding: EdgeInsets.only(top: 8),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                itemCount: 5,
                itemBuilder: (context, index) => const Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: TodoItem(),
                    )),
          ),
        ],
      ),
    );
  }
}
