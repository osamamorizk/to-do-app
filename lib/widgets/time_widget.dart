import 'package:flutter/material.dart';
import 'package:todo/consts.dart';

class TimeWidget extends StatelessWidget {
  const TimeWidget({
    super.key,
    required this.date,
  });
  final String date;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 100,
      decoration:
          BoxDecoration(color: kColor, borderRadius: BorderRadius.circular(32)),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              date,
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
            const Image(
                height: 17,
                width: 17,
                image: AssetImage('assets/images/icon_time.png')),
          ],
        ),
      ),
    );
  }
}
