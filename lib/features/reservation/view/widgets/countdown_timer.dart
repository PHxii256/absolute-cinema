import 'package:flutter/material.dart';
import 'package:flutter_application/features/reservation/viewmodel/countdown_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CountdownTimer extends ConsumerStatefulWidget {
  const CountdownTimer({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CountdownTimerState();
}

class _CountdownTimerState extends ConsumerState<CountdownTimer> {
  @override
  Widget build(BuildContext context) {
    final timeLeft = ref.watch(countdownProvider);
    final timerRunning = ref.watch(countdownProvider.notifier).isTimerActive();

    return timerRunning
        ? Padding(
          padding: const EdgeInsets.fromLTRB(8, 8, 16, 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.timer_outlined),
              SizedBox(width: 4),
              Text(timeLeft, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            ],
          ),
        )
        : Container();
  }
}
