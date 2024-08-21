import 'package:flutter/material.dart';

class AddTaskCustomButton extends StatelessWidget {
  const AddTaskCustomButton(
      {super.key, this.color, required this.title, this.onTap});
  final Color? color;
  final String title;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 45,
        width: 120,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
            child: Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 18),
        )),
      ),
    );
  }
}
