import 'package:flutter/material.dart';

class ScheduleContainer extends StatelessWidget {
  final String startTimeHour,
      startTimeMin,
      endTimeHour,
      endTimeMin,
      scheduleTitleLine1,
      scheduleTitleLine2,
      participant1,
      participant2,
      participant3,
      participant4;
  final Color bgColor;

  const ScheduleContainer({
    super.key,
    required this.startTimeHour,
    required this.startTimeMin,
    required this.endTimeHour,
    required this.endTimeMin,
    required this.scheduleTitleLine1,
    required this.scheduleTitleLine2,
    required this.bgColor,
    required this.participant1,
    required this.participant2,
    required this.participant3,
    required this.participant4,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(36),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 28, 12, 28),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Column(
                  children: [
                    Text(
                      startTimeHour,
                      style: const TextStyle(
                        color: Color(0xff1f1f1f),
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      startTimeMin,
                      style: const TextStyle(
                        color: Color(0xff1f1f1f),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        letterSpacing: -1,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      height: 28,
                      width: 0,
                      decoration: BoxDecoration(
                        border: Border(
                          right: BorderSide(
                            color: Colors.black.withAlpha(150),
                            width: 0.5,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      endTimeHour,
                      style: const TextStyle(
                        color: Color(0xff1f1f1f),
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      endTimeMin,
                      style: const TextStyle(
                        color: Color(0xff1f1f1f),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        letterSpacing: -1,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            scheduleTitleLine1,
                            style: const TextStyle(
                              color: Color(0xff1f1f1f),
                              fontSize: 60,
                              fontWeight: FontWeight.w500,
                              height: 1,
                              letterSpacing: -1,
                            ),
                            textHeightBehavior: const TextHeightBehavior(
                              applyHeightToFirstAscent: false,
                              applyHeightToLastDescent: false,
                            ),
                          ),
                          Text(
                            scheduleTitleLine2,
                            style: const TextStyle(
                              color: Color(0xff1f1f1f),
                              fontSize: 60,
                              fontWeight: FontWeight.w500,
                              height: 1,
                              letterSpacing: -1,
                            ),
                            textHeightBehavior: const TextHeightBehavior(
                              applyHeightToFirstAscent: false,
                              applyHeightToLastDescent: false,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 24, 0),
                        child: Text(
                          participant1,
                          style: TextStyle(
                            color: const Color(0xff1f1f1f).withAlpha(150),
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 24, 0),
                        child: Text(
                          participant2,
                          style: TextStyle(
                            color: const Color(0xff1f1f1f).withAlpha(150),
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 24, 0),
                        child: Text(
                          participant3,
                          style: TextStyle(
                            color: const Color(0xff1f1f1f).withAlpha(150),
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 24, 0),
                        child: Text(
                          participant4,
                          style: TextStyle(
                            color: const Color(0xff1f1f1f).withAlpha(150),
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
