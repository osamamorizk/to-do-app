import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo/consts.dart';
import 'package:todo/widgets/static_box.dart';

class ProfileWidget extends StatefulWidget {
  final int todoNumber;
  final int doneNumber;

  const ProfileWidget(
      {super.key, required this.todoNumber, required this.doneNumber});

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Container(
              height: 70,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      "Account:  ${user!.email}",
                      style: TextStyle(color: kColorHints, fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Tasks Overview",
                style: TextStyle(color: kColorHints, fontSize: 20),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              StatisticsContainer(
                title: 'Todo',
                numTask: widget.todoNumber,
              ),
              StatisticsContainer(
                title: 'Done',
                numTask: widget.doneNumber,
              ),
            ],
          ),
          const SizedBox(
            height: 35,
          ),
        ],
      ),
    );
  }
}
