// lib/widgets/select_minute.dart
import 'package:flutter/material.dart';

class SelectMinute extends StatelessWidget {
  final int minute;
  final bool isSelected;
  final VoidCallback onTap;

  const SelectMinute({
    super.key,
    required this.minute,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final cardColor = Theme.of(context).cardColor;
    final scaffoldColor = Theme.of(context).scaffoldBackgroundColor;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: 64,
        height: 48,
        decoration: BoxDecoration(
          // ✅ 선택 / 비선택 배경색
          color: isSelected ? cardColor : scaffoldColor,

          // ✅ 선택 / 비선택 border
          border: Border.all(
            color: isSelected ? cardColor : cardColor.withAlpha(150),
            width: 4,
          ),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          '$minute',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: isSelected
                ? Theme.of(context).textTheme.titleLarge!.color
                : cardColor.withAlpha(150),
          ),
        ),
      ),
    );
  }
}
