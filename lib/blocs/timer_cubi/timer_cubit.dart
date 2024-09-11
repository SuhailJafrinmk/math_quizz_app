import 'dart:async';
import 'package:bloc/bloc.dart';

class TimerCubit extends Cubit<int> {
  Timer? _timer;

  TimerCubit() : super(0); // Start from 0

  void startTimer() {
    if (_timer == null || !_timer!.isActive) {
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (state < 100) {
          emit(state + 1); 
        } else {
          emit(0); 
        }
      });
    }
  }

  void pauseTimer() {
    _timer?.cancel();
  }

  void resetTimer() {
    _timer?.cancel();
    emit(0); // Reset the timer to 0
  }

  @override
  Future<void> close() {
    _timer?.cancel(); // Cancel timer when closing the cubit
    return super.close();
  }
}
