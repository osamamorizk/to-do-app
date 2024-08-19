import 'package:flutter/material.dart';
import 'package:todo/consts.dart';

class QuestionWidget extends StatelessWidget {
  const QuestionWidget({
    super.key,
    required this.question,
    required this.action,
    this.onPressed,
  });

  final String question;
  final String action;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          question,
          style: const TextStyle(
            color: kColorHints,
            fontSize: 17,
          ),
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            action,
            style: TextStyle(color: Colors.black.withOpacity(.8)),
          ),
        )
      ],
    );
  }
}
