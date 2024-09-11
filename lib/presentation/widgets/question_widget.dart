import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_quizz_app/blocs/timer_cubi/timer_cubit.dart';
import 'package:math_quizz_app/data/models/question_model.dart';

class QuestionWidget extends StatelessWidget {
  final Question question;

  QuestionWidget({required this.question});

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    final theme=Theme.of(context).textTheme;
    return Material(
      borderRadius: BorderRadius.circular(10),
      clipBehavior: Clip.hardEdge,
      elevation: 10,
      child: Column(
        children: [
          Container(
        padding: EdgeInsets.all(10),
        height: size.height*.3,
        width: size.width*.9,
        child: Text(
        "q) Calculate the result: ${question.firstOperand} ${question.operator} ${question.secondOperand} ?",
        style: theme.displayLarge
      ),
      ),
      SizedBox(height: 30,),
      BlocBuilder<TimerCubit, int>(
        builder: (context, state) {
          return Text('$state',style: theme.displayLarge?.copyWith(fontSize: 40),);
        },
      )
        ],
      ),
    );
  }
}
