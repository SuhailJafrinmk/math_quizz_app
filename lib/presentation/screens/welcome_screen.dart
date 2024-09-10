import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:math_quizz_app/blocs/quesion_bloc/question_bloc.dart';
import 'package:math_quizz_app/presentation/screens/game_screen.dart';
import 'package:math_quizz_app/presentation/widgets/custom_button.dart';
import 'package:math_quizz_app/resources/constants/app_strings.dart';
import 'package:math_quizz_app/resources/constants/apptheme.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    final theme=Theme.of(context).textTheme;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 30,),
          Text(AppStrings.appName,style: theme.displayLarge?.copyWith(fontSize: 50),),
          SizedBox(height: 10,),
          SizedBox(
            height: size.height*.3,
            child: SvgPicture.asset(AppStrings.welcomeSvg),
          ),
          Expanded(child: SizedBox(
            width: size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 40,),
                Text(AppStrings.welcomeMessage,style: theme.displayLarge?.copyWith(fontSize: 30),),
                SizedBox(height: 40,),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(AppStrings.wecomeMessageAdditionl,style: theme.displayMedium,),
                ),
                SizedBox(height: 150,),
                CustomButtonBlack(
                  text: 'Get started',
                  ontap: (){
                    BlocProvider.of<QuestionBloc>(context).add(LoadNewQuestion());
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>GameScreen()));
                  }
                  ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
