import 'package:flutter/material.dart';

class EditWidget extends StatelessWidget {
  const EditWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 60,
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(.2),
          borderRadius: BorderRadius.circular(32)),
      child: const Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'edit',
              style: TextStyle(color: Colors.black, fontSize: 13),
            ),
            Image(
                height: 15,
                width: 15,
                image: AssetImage('assets/images/icon_edit.png')),
          ],
        ),
      ),
    );
  }
}
