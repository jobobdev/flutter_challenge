import 'package:flutter/material.dart';

class Participant extends StatelessWidget {
  final String name;

  const Participant({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 24, 0),
      child: Text(
        name,
        style: TextStyle(
          color: const Color(0xff1f1f1f).withAlpha(150),
          fontSize: 14,
        ),
      ),
    );
  }
}
