import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:math_quizz_app/resources/constants/app_strings.dart';

class TimerCubit extends Cubit<int> {
  Timer? _timer;
  // final AudioPlayer audioPlayer = AudioPlayer(); // Audio player instance

  TimerCubit() : super(1);

  // Start the timer and play the ticking sound
  void startTimer() async {
    if (_timer == null || !_timer!.isActive) {
      // Play the ticking sound in loop
      // await audioPlayer.setReleaseMode(ReleaseMode.loop);
      // await audioPlayer.play(AssetSource(AppStrings.tickingMp3));
       // Your audio file
      // Start the timer that emits every second
      _timer = Timer.periodic(const Duration(seconds: 1), (timer){
        if (state < 200) {
          emit(state + 1); // Increment the timer state
        } else {
          emit(1); // Reset if timer reaches 100 seconds
          // _stopTickingSound(); // Stop sound when timer ends
        }
      });
    }
  }

  // // Pause the timer and stop the ticking sound
  // void pauseTimer() {
  //   _timer?.cancel();
  //   _stopTickingSound(); // Stop sound on pause
  // }

  // Reset the timer and stop the ticking sound
  void resetTimer()async{
    // await audioPlayer.stop();
    // _timer?.cancel();
    // _stopTickingSound(); // Stop sound on reset
    emit(0); // Reset timer state to 0
  }

  // // Stop the ticking sound
  // Future<void> _stopTickingSound() async {
  //   await audioPlayer.stop(); // Stop playing the ticking sound
  // }

  // @override
  // Future<void> close() {
  //   _timer?.cancel();
  //   _stopTickingSound(); // Stop sound and cancel the timer when cubit closes
  //   return super.close();
  // }
}
