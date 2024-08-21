import 'package:flutter/material.dart';
import 'package:todo/consts.dart';
import 'package:todo/widgets/done_list.dart';

class ArchivedView extends StatelessWidget {
  const ArchivedView({super.key});
  static String id = 'home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 240, 237, 237),
          scrolledUnderElevation: 0,
          leading: const Icon(
            Icons.archive_rounded,
            color: kColor,
          ),
          title: const Text(
            "Archived",
            style: TextStyle(
              color: kColorHints,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
        backgroundColor: kColorBackground,
        // floatingActionButton: FloatingActionButton(
        //   shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.circular(32),
        //   ),
        //   onPressed: () {
        //     showModalBottomSheet(
        //         backgroundColor: kColorBackground,
        //         isScrollControlled: true,
        //         context: context,
        //         builder: (context) => AddTaskView());
        //   },
        //   backgroundColor: kColor,
        //   child: const Icon(
        //     Icons.add,
        //     color: Colors.white,
        //   ),
        // ),
        body: DoneList());
  }
}
