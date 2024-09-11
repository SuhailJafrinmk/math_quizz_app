import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_quizz_app/blocs/quesion_bloc/question_bloc.dart';
import 'package:math_quizz_app/blocs/score_bloc/score_bloc.dart';
import 'package:math_quizz_app/data/models/question_model.dart';
import 'package:math_quizz_app/presentation/widgets/answer_input.dart';
import 'package:math_quizz_app/presentation/widgets/custom_button.dart';
import 'package:math_quizz_app/presentation/widgets/question_widget.dart';
import 'package:math_quizz_app/presentation/widgets/score_board.dart';
import 'package:math_quizz_app/utils/custom_snackbar.dart';
import 'package:math_quizz_app/utils/right_answer_dialogue.dart';
import 'package:math_quizz_app/utils/wrong_answer_dialogue.dart';
import 'package:quickalert/quickalert.dart';

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocListener<ScoreBloc, ScoreState>(
      listener: (context, state) {
        if(state is ShowScoreBoard){
          showScoreboardDialog(context, state.rightAnswers, state.wrongAnsers);
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(title: Text('Math Game')),
        body: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              BlocConsumer<QuestionBloc, QuestionState>(
                listener: (context, state) {
                  if (state is WrongAnswer) {
                    BlocProvider.of<ScoreBloc>(context).add(AnswerWrong());
                    QuickAlert.show(context: context, type: QuickAlertType.error,title: 'better luck',text: 'Its a wrong answer');
                    // showWrongAnswerDialog(context);
                  } else if (state is CorrectAnswer) {
                    BlocProvider.of<ScoreBloc>(context).add(AnswerRight());
                    QuickAlert.show(context: context, type: QuickAlertType.success,title: 'yureekaa',text: 'Its a right answer');
                    // showCorrectAnswerDialog(context);
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
