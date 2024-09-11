import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_quizz_app/blocs/quesion_bloc/question_bloc.dart';
import 'package:math_quizz_app/blocs/score_bloc/score_bloc.dart';
import 'package:math_quizz_app/blocs/timer_cubi/timer_cubit.dart';
import 'package:math_quizz_app/presentation/widgets/answer_input.dart';
import 'package:math_quizz_app/presentation/widgets/question_widget.dart';
import 'package:math_quizz_app/presentation/widgets/score_board.dart';
import 'package:math_quizz_app/resources/constants/app_strings.dart';
import 'package:quickalert/quickalert.dart';
import 'dart:developer' as developer;

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    context.read<TimerCubit>().startTimer();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocListener<ScoreBloc, ScoreState>(
      listener: (context, state) {
        developer.log('the state of scorebloc is $state');

        if(state is ShowScoreBoard){
          showScoreboardDialog(context, state.rightAnswers, state.wrongAnsers,state.score);
          context.read<TimerCubit>().resetTimer();
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: IconButton(onPressed: (){
            context.read<TimerCubit>().resetTimer();
            Navigator.pop(context);
          }, icon: Icon(CupertinoIcons.back)),
          title: Text('Math Game')),
        body: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              BlocConsumer<QuestionBloc, QuestionState>(
                listener: (context, state) {
                  if (state is WrongAnswer) {
                    BlocProvider.of<ScoreBloc>(context).add(AnswerWrong());
                    QuickAlert.show(context: context, type: QuickAlertType.error,title: AppStrings.incorrectAnswer,text: 'Its a wrong answer');
                  } else if (state is CorrectAnswer) {
                    BlocProvider.of<ScoreBloc>(context).add(AnswerRight());
                    QuickAlert.show(context: context, type: QuickAlertType.success,title: AppStrings.congratulations,text: 'Its a right answer');
                  }
                },
                builder: (context, state) {
                  if (state is QuestionLoaded) {
                    return QuestionWidget(question: state.question);
                  }
                  return SizedBox();
                },
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: AnswerInput(
                  formKey: _formKey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
