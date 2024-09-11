import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_quizz_app/blocs/quesion_bloc/question_bloc.dart';
import 'package:math_quizz_app/blocs/score_bloc/score_bloc.dart';
import 'package:math_quizz_app/blocs/timer_cubi/timer_cubit.dart';
import 'package:math_quizz_app/data/repositories/question_repo.dart';
import 'package:math_quizz_app/presentation/screens/welcome_screen.dart';
import 'package:math_quizz_app/resources/constants/apptheme.dart';

void main() {
  QuestionRepository repository=QuestionRepository();
  runApp(
    MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => QuestionBloc(repository),
      ),
      BlocProvider(
        create: (context) => ScoreBloc(),
      ),
      BlocProvider(
        create: (context) => TimerCubit(),
      )

    ],
    child: MyApp(),
  ));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
    );
  }
}