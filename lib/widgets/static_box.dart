import 'package:flutter/material.dart';
import 'package:todo/consts.dart';

class StatisticsContainer extends StatelessWidget {
  const StatisticsContainer(
      {super.key, required this.title, required this.numTask});
  final String title;
  final int numTask;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(color: kColorHints, fontSize: 23),
          ),
          const SizedBox(
            height: 4,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 22),
                child: Text(
                  '$numTask',
                  style: TextStyle(color: kColorHints, fontSize: 22),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
