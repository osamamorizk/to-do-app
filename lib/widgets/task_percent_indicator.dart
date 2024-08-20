import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:todo/consts.dart';

class TaskPercentIndicator extends StatelessWidget {
  final double percent;
  final int completedTasks;
  final int totalTasks;

  const TaskPercentIndicator({
    Key? key,
    required this.percent,
    required this.completedTasks,
    required this.totalTasks,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      footer: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 80,
            child: ListTile(
              horizontalTitleGap: 5,
              contentPadding: const EdgeInsets.all(0),
              leading: Container(
                color: kColor,
                height: 20,
                width: 20,
              ),
              title: const Text(
                'Done',
                style: TextStyle(
                  fontSize: 16.0,
                  color: kColorHints,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 80,
            child: ListTile(
              horizontalTitleGap: 5,
              contentPadding: EdgeInsets.only(left: 10),
              leading: Container(
                color: Colors.white,
                height: 20,
                width: 20,
              ),
              title: const Text(
                'Todo',
                style: TextStyle(
                  fontSize: 16.0,
                  color: kColorHints,
                ),
              ),
            ),
          ),
        ],
      ),
      header: const Padding(
        padding: EdgeInsets.only(bottom: 15),
        child: Text(
          "Your Progress",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
            color: kColorHints,
          ),
        ),
      ),
      radius: 115.0,
      animation: true,
      animationDuration: 1200,
      lineWidth: 25.0,
      percent: percent,
      center: Text(
        "${(percent * 100).toStringAsFixed(1)}%",
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20.0,
        ),
      ),
      circularStrokeCap: CircularStrokeCap.round,
      progressColor: kColor,
    );
  }
}
