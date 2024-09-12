import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:math_quizz_app/resources/constants/app_colors.dart';
import 'package:math_quizz_app/resources/constants/app_strings.dart';

class FactWidget extends StatelessWidget {
  final String quote;
  const FactWidget({super.key, required this.quote});
  @override
  Widget build(BuildContext context) {
    final words = splitText(quote);
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context).textTheme;
    log('the words are ${words[0]} and ${words[1]}');
    return Padding(
      padding: EdgeInsets.only(right: size.width * .15),
      child: Material(
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.backgroundColor,
              border: Border.all(color: Colors.black45)),
          width: size.width * .9,
          child: Row(
            children: [
              Expanded(flex: 1, child: Image.asset(AppStrings.bulbImage)),
              Expanded(
                flex: 1,
                child: RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: words[0],
                      style: theme.displayMedium?.copyWith(fontSize: 50)),
                  TextSpan(
                      text: " ${words[1]}",
                      style: theme.displayLarge?.copyWith(fontSize: 15)),
                ])),
              )
            ],
          ),
        ),
      ),
    );
  }
}

List<String> splitText(String word) {
  RegExp regExp = RegExp(r'^(\d+)');
  var match = regExp.firstMatch(word);
  String number = match!.group(0)!;
  String balance = word.substring(number.length).trim();
  List<String> words = [number, balance];
  return words;
}
