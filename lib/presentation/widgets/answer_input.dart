import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_quizz_app/blocs/quesion_bloc/question_bloc.dart';
import 'package:math_quizz_app/blocs/score_bloc/score_bloc.dart';
import 'package:math_quizz_app/blocs/timer_cubi/timer_cubit.dart';
import 'package:math_quizz_app/presentation/widgets/custom_button.dart';
import 'package:math_quizz_app/presentation/widgets/custom_textfield.dart';
import 'package:math_quizz_app/utils/custom_snackbar.dart';
import 'package:math_quizz_app/utils/validators.dart';


class AnswerInput extends StatefulWidget {
final GlobalKey<FormState> formKey;

   AnswerInput({super.key, required this.formKey});

  @override
  State<AnswerInput> createState() => _AnswerInputState();
}

class _AnswerInputState extends State<AnswerInput> {

final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Column(
      children: [
       CustomTextField(
        inputType: TextInputType.number,
        hintText: 'Enter your answer',
         textEditingController: _controller,
         validator: (value) => ValidatorFunctions.validateInput(value),
         prefixIcon: Icons.edit_document,
         ),
         SizedBox(height: 20,),
           Row(
              children: [
              Expanded(
                child: CustomButtonBlack(
                  text: 'Submit',
                ontap: () {
                  if(widget.formKey.currentState!.validate()){
                    BlocProvider.of<QuestionBloc>(context).add(SubmitAnswer(double.parse(_controller.text)));
                    BlocProvider.of<QuestionBloc>(context).add(LoadNewQuestion());
                    // _controller.clear();
                  }
                },
                ),
              ),
              SizedBox(width: 10,),
              Expanded(
                child: CustomButtonBlack(
                text: 'Next',
                ontap: () {
                  BlocProvider.of<QuestionBloc>(context).add(SubmitAnswer(0.0));
                  BlocProvider.of<QuestionBloc>(context).add(LoadNewQuestion());
                 
                },
                ),
              ),
              ],
            ),
      ],
    );
  }
}
