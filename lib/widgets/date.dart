import 'package:flutter/material.dart';

class DateWidget extends StatelessWidget {
  final String date;

  const DateWidget({super.key, required this.date});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 24, 0),
      child: Text(
        date,
        style: TextStyle(
          color: Colors.white.withAlpha(100),
          fontSize: 38,
          fontWeight: FontWeight.w500,
          letterSpacing: -1,
        ),
      ),
    );
  }
}
