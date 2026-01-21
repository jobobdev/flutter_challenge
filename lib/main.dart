// File: lib/main.dart
import 'package:flutter/material.dart';
import 'package:toonflix/widgets/date.dart';
import 'package:toonflix/widgets/schdule_container.dart';

class Player {
  String name;

  Player({required this.name});
}

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFF1f1f1f),
        body: Column(
          children: [
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Container(
                        width: 56,
                        height: 56,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/player.png'),
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(56)),
                        ),
                      ),
                    ],
                  ),
                  const Column(
                    children: [Icon(Icons.add, color: Colors.white, size: 36)],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'MONDAY',
                        style: TextStyle(
                          color: Colors.white.withAlpha(200),
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        '16',
                        style: TextStyle(
                          color: Colors.white.withAlpha(200),
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            'TODAY',
                            style: TextStyle(
                              color: Colors.white.withAlpha(200),
                              fontSize: 42,
                              fontWeight: FontWeight.w500,
                              letterSpacing: -2,
                            ),
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6.0),
                        child: Column(
                          children: [
                            Text(
                              '•',
                              style: TextStyle(
                                color: Color(0xFFB22580),
                                fontSize: 36,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              DateWidget(date: '17'),
                              DateWidget(date: '18'),
                              DateWidget(date: '19'),
                              DateWidget(date: '20'),
                              DateWidget(date: '21'),
                              DateWidget(date: '22'),
                              DateWidget(date: '23'),
                              DateWidget(date: '24'),
                              DateWidget(date: '25'),
                              DateWidget(date: '26'),
                              DateWidget(date: '27'),
                              DateWidget(date: '28'),
                              DateWidget(date: '29'),
                              DateWidget(date: '30'),
                              DateWidget(date: '31'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 28),
            const Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ScheduleContainer(
                      startTimeHour: '11',
                      startTimeMin: '30',
                      endTimeHour: '12',
                      endTimeMin: '20',
                      scheduleTitleLine1: 'DESIGN',
                      scheduleTitleLine2: 'MEETING',
                      bgColor: Color(0xFFFEF754),
                      participant1: 'ALEX',
                      participant2: 'HELENA',
                      participant3: 'NANA',
                      participant4: ' ',
                    ),
                    SizedBox(height: 8),
                    ScheduleContainer(
                      startTimeHour: '11',
                      startTimeMin: '30',
                      endTimeHour: '12',
                      endTimeMin: '20',
                      scheduleTitleLine1: 'DESIGN',
                      scheduleTitleLine2: 'MEETING',
                      bgColor: Color(0xFF9C6BCE),
                      participant1: 'ALEX',
                      participant2: 'HELENA',
                      participant3: 'NANA',
                      participant4: ' ',
                    ),
                    SizedBox(height: 8),
                    ScheduleContainer(
                      startTimeHour: '11',
                      startTimeMin: '30',
                      endTimeHour: '12',
                      endTimeMin: '20',
                      scheduleTitleLine1: 'DESIGN',
                      scheduleTitleLine2: 'MEETING',
                      bgColor: Color(0xFFBBEE4B),
                      participant1: 'ALEX',
                      participant2: 'HELENA',
                      participant3: 'NANA',
                      participant4: ' ',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

















// return MaterialApp(
//       home: Scaffold(
//         backgroundColor: const Color(0xFF181818),
//         body: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 24.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const SizedBox(height: 48),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.end,
//                       children: [
//                         const Text(
//                           'Hey, Selena',
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 26,
//                             fontWeight: FontWeight.w800,
//                           ),
//                         ),
//                         Text(
//                           'Welcome Back',
//                           style: TextStyle(
//                             color: Colors.white.withAlpha(200),
//                             fontSize: 18,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 40),
//                 Text(
//                   'Total Balance',
//                   style: TextStyle(
//                     color: Colors.white.withAlpha(200),
//                     fontSize: 22,
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 const Text(
//                   '\$5 194 482',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.w600,
//                     fontSize: 42,
//                   ),
//                 ),
//                 const SizedBox(height: 24),
//                 const Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Button(
//                       text: 'Transfer',
//                       bgColor: Color(0xFFF1B33B),
//                       textColor: Colors.black,
//                     ),
//                     Button(
//                       text: 'Request',
//                       bgColor: Color(0xFF1F2123),
//                       textColor: Colors.white,
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 80),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   children: [
//                     const Text(
//                       'Wallets',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 32,
//                         fontWeight: FontWeight.w800,
//                       ),
//                     ),
//                     Text(
//                       'View All',
//                       style: TextStyle(
//                         color: Colors.white.withAlpha(200),
//                         fontWeight: FontWeight.w400,
//                         fontSize: 18,
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 24),
//                 const CurrencyCard(
//                   offset: 1,
//                   name: 'Euro',
//                   code: 'EUR',
//                   amount: '6 428',
//                   icon: Icons.euro_sharp,
//                   isInverted: false,
//                 ),

//                 const CurrencyCard(
//                   offset: 2,
//                   name: 'Bitcoin',
//                   code: 'BTC',
//                   amount: '1 428',
//                   icon: Icons.currency_bitcoin,
//                   isInverted: true,
//                 ),

//                 const CurrencyCard(
//                   offset: 3,
//                   name: 'Dollar',
//                   code: 'USD',
//                   amount: '4 428',
//                   icon: Icons.attach_money,
//                   isInverted: false,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );