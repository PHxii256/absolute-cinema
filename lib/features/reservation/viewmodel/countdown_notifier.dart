import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'countdown_notifier.g.dart';

@Riverpod(keepAlive: true)
class Countdown extends _$Countdown {
  final int _durationMinutes = 10;
  Timer? _timer;
  bool _paused = false;

  @override
  String build() {
    return getFormatedTime(0);
  }

  void startTimer() {
    if (_timer != null) return;

    _timer = Timer.periodic(Duration(seconds: 1), (callback) {
      if (callback.tick <= _durationMinutes * 60) {
        if (!_paused) {
          state = getFormatedTime(callback.tick);
        }
      } else {
        callback.cancel();
      }
    });
  }

  void cancelTimer() {
    if (_timer != null) {
      _timer!.cancel();
      _timer = null;
      ref.invalidateSelf();
    }
  }

  bool isTimerActive() {
    if (_timer != null) return _timer!.isActive;
    return false;
  }

  void pauseTimer() => _paused = true;
  void resumeTimer() => _paused = false;
  bool isPaused() => _paused;

  String getFormatedTime(int currentTick) {
    int timeLeftSec = _durationMinutes * 60 - currentTick;
    int minLeft = (timeLeftSec / 60).floor();
    int remainingSeconds = timeLeftSec - minLeft * 60;
    if (remainingSeconds <= 9) {
      return "$minLeft:0$remainingSeconds";
    }
    return "$minLeft:$remainingSeconds";
  }
}
