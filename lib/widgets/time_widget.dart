import 'package:flutter/material.dart';
import 'package:todo/consts.dart';

class TimeWidget extends StatelessWidget {
  const TimeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 90,
      decoration:
          BoxDecoration(color: kColor, borderRadius: BorderRadius.circular(32)),
      child: const Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              '19:50',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
            Image(
                height: 17,
                width: 17,
                image: AssetImage('assets/images/icon_time.png')),
          ],
        ),
      ),
    );
  }
}
