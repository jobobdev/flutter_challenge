import 'dart:async';

import 'package:flutter/material.dart';
import 'package:toonflix/widgets/select_minute.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const initialMinutes = 25;
  static const initialPomodoros = 0;
  static const initialGoal = 0;
  static const finalPomodoros = 2;
  static const finalGoal = 2;
  static const int restSeconds = 5 * 60;
  bool isResting = false;
  int restRemainingSeconds = restSeconds;
  int totalSeconds = initialMinutes * 60;
  bool isRunning = false;
  int selectedMinute = 25;
  int totalPomodoros = initialPomodoros;
  int totalGoals = initialGoal;
  late Timer? timer;
  void startRest() {
    // 혹시 남아있는 타이머가 있으면 정리
    timer?.cancel();

    setState(() {
      isResting = true;
      isRunning = true; // “휴식 타이머도 동작 중”으로 볼지 여부는 취향
      restRemainingSeconds = restSeconds;
    });

    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (restRemainingSeconds == 0) {
        t.cancel();
        if (!mounted) return;
        setState(() {
          isResting = false;
          isRunning = false;
          // 다음 pomodoro를 자동 시작할지 여부는 정책 선택
          // totalSeconds는 이미 pomodoro 종료 로직에서 초기화되어 있어야 함
        });
        return;
      }

      if (!mounted) return;
      setState(() {
        restRemainingSeconds -= 1;
      });
    });
  }

  void cancelRest() {
    timer?.cancel();
    setState(() {
      isResting = false;
      isRunning = false;
      restRemainingSeconds = restSeconds;
    });
  }

  Future<bool> askForRest() async {
    final result = await showDialog<bool>(
      context: context,
      barrierDismissible: true, // 바깥 탭으로 닫히게 할지
      builder: (context) {
        return AlertDialog(
          title: const Text('휴식할까요?'),
          content: const Text('5분간 휴식 타이머를 시작할까요?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('No'),
            ),
            FilledButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text('Yes'),
            ),
          ],
        );
      },
    );

    return result ?? false;
  }

  Future<void> handleCompletionAndMaybeRest() async {
    // 이미 타이머는 cancel된 상태여야 안전합니다.
    final wantsRest = await askForRest();
    if (!mounted) return;

    if (wantsRest) {
      startRest();
    }
  }

  void onTick(Timer timer) {
    if (totalSeconds == 0 && totalPomodoros != finalPomodoros) {
      setState(() {
        totalPomodoros = totalPomodoros + 1;
        isRunning = false;
        totalSeconds = initialMinutes * 60; // ✅ (권장) 25분이면 1500초
      });
      timer.cancel();

      Future.microtask(() => handleCompletionAndMaybeRest()); // ✅ 여기 연결
      return;
    }

    if (totalSeconds != 0 && totalPomodoros != finalPomodoros) {
      setState(() {
        totalSeconds = totalSeconds - 1;
      });
      return;
    }

    if (totalSeconds == 0 &&
        totalPomodoros == finalPomodoros &&
        totalGoals != finalGoal) {
      setState(() {
        totalPomodoros = initialPomodoros;
        totalGoals = totalGoals + 1;
        isRunning = false;
        totalSeconds = initialMinutes * 60; // ✅ (권장)
      });
      timer.cancel();

      Future.microtask(() => handleCompletionAndMaybeRest()); // ✅ 여기 연결
      return;
    }

    if (totalSeconds != 0 && totalPomodoros == finalPomodoros) {
      setState(() {
        totalSeconds = totalSeconds - 1;
        // ⚠️ 이 블록에서 goals/pomodoros를 건드리면 1초마다 증가하는 버그가 납니다.
        // totalPomodoros = initialPomodoros;
        // totalGoals = totalGoals + 1;
      });
      return;
    }

    if (totalSeconds == 0 && totalGoals == finalGoal) {
      setState(() {
        totalGoals = initialGoal;
        isRunning = false;
        totalSeconds = initialMinutes * 60; // ✅ (권장)
      });
      timer.cancel();

      Future.microtask(() => handleCompletionAndMaybeRest()); // ✅ 여기 연결
      return;
    }
  }

  void onStartPressed() {
    timer = Timer.periodic(const Duration(seconds: 1), onTick);
    setState(() {
      isRunning = true;
    });
  }

  void onPausePressed() {
    timer?.cancel();
    setState(() {
      isRunning = false;
    });
  }

  String formatMinute(int seconds) {
    var duration = Duration(seconds: seconds);

    return duration.toString().split(".").first.substring(2, 4);
  }

  String formatSeconds(int seconds) {
    var duration = Duration(seconds: seconds);

    return duration.toString().split(".").first.substring(5, 7);
  }

  @override
  Widget build(BuildContext context) {
    final int displaySeconds = isResting ? restRemainingSeconds : totalSeconds;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
        children: [
          const SizedBox(height: 48),
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
            child: Row(
              children: [
                Text(
                  'POMOTIMER',
                  style: TextStyle(
                    color: Theme.of(context).textTheme.titleSmall?.color,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 6,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Positioned(
                          top: -12,
                          left: 9,
                          child: Container(
                            alignment: Alignment.center,
                            width: 118,
                            height: 180 * .85,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(6),
                              ),
                              color: Theme.of(context).cardColor.withAlpha(900),
                            ),
                          ),
                        ),
                        Positioned(
                          top: -6,
                          left: 6,
                          child: Container(
                            alignment: Alignment.center,
                            width: 124,
                            height: 180 * .95,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(6),
                              ),
                              color: Theme.of(context).cardColor.withAlpha(950),
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 136,
                          height: 180,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(6),
                            ),
                            color: Theme.of(context).cardColor,
                          ),
                          child: Text(
                            formatMinute(displaySeconds),
                            style: TextStyle(
                              fontSize: 72,
                              fontWeight: FontWeight.w800,
                              color: Theme.of(
                                context,
                              ).textTheme.titleLarge!.color,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        ':',
                        style: TextStyle(
                          fontSize: 56,
                          fontWeight: FontWeight.w600,
                          color: Colors.white.withAlpha(100),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Positioned(
                          top: -12,
                          left: 9,
                          child: Container(
                            alignment: Alignment.center,
                            width: 118,
                            height: 172,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(6),
                              ),
                              color: Theme.of(context).cardColor.withAlpha(150),
                            ),
                          ),
                        ),
                        Positioned(
                          top: -6,
                          left: 6,
                          child: Container(
                            alignment: Alignment.center,
                            width: 124,
                            height: 172,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(6),
                              ),
                              color: Theme.of(context).cardColor.withAlpha(200),
                            ),
                          ),
                        ),

                        Container(
                          alignment: Alignment.center,
                          width: 136,
                          height: 180,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(6),
                            ),
                            color: Theme.of(context).cardColor,
                          ),
                          child: Text(
                            formatSeconds(displaySeconds),
                            style: TextStyle(
                              fontSize: 72,
                              fontWeight: FontWeight.w800,
                              color: Theme.of(
                                context,
                              ).textTheme.titleLarge!.color,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),

          Flexible(
            flex: 2,
            child: Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [1, 2, 3, 4, 5].map((m) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: SelectMinute(
                        minute: m,
                        isSelected: selectedMinute == m,
                        onTap: () {
                          setState(() {
                            selectedMinute = m;
                            // ✅ 휴식 모드 해제(중요)
                            isResting = false;
                            restRemainingSeconds = restSeconds;

                            // ✅ 선택한 분을 pomodoro 타이머에 반영
                            totalSeconds = m * 60;

                            // ✅ 버튼을 눌러야 시작하게 만들려면 멈춘 상태로
                            isRunning = false;
                          });
                        },
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black.withAlpha(100),
                  ),
                  child: Center(
                    child: IconButton(
                      iconSize: 56,
                      color: Theme.of(context).cardColor,
                      onPressed: isRunning ? onPausePressed : onStartPressed,
                      icon: Icon(isRunning ? Icons.pause : Icons.play_arrow),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 2,

            child: Padding(
              padding: const EdgeInsets.fromLTRB(48, 0, 48, 64),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              Text(
                                '$totalPomodoros /',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w800,
                                  color: Theme.of(
                                    context,
                                  ).textTheme.titleSmall!.color!.withAlpha(100),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                ' $finalPomodoros',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w800,
                                  color: Theme.of(
                                    context,
                                  ).textTheme.titleSmall!.color!.withAlpha(100),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'ROUND',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                              color: Theme.of(
                                context,
                              ).textTheme.titleSmall!.color,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              Text(
                                '$totalGoals /',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w800,
                                  color: Theme.of(
                                    context,
                                  ).textTheme.titleSmall!.color!.withAlpha(100),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                ' $finalGoal',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w800,
                                  color: Theme.of(
                                    context,
                                  ).textTheme.titleSmall!.color!.withAlpha(100),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'GOAL',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                              color: Theme.of(
                                context,
                              ).textTheme.titleSmall!.color,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
