import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_application_22/controller/homepage_controller.dart';
import 'package:flutter_application_22/core/constants/color_constnats.dart';
import 'package:flutter_application_22/model/quiz_model.dart';
import 'package:provider/provider.dart';

class QuestionWidgets extends StatelessWidget {
  final int index;
  final QuizModel quizModel;
  final bool submitted;

  const QuestionWidgets(
      {super.key,
      required this.index,
      required this.quizModel,
      required this.submitted});

  @override
  Widget build(BuildContext context) {
    // var selecteditem;
    log("index 2nd:$index");
    var prov = context.read<HomepageController>();
    return index == 10
        ? Container(
            color: ColorConstnats.primarywhite,
            child: Center(
              child: Text(
                "Total scored=${prov.selected_answer}",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: ColorConstnats.backgroundColor,
                    fontSize: 30),
              ),
            ),
          )
        : submitted != true
            ? Container(
                height: 500,
                width: 600,
                decoration: BoxDecoration(
                    color: ColorConstnats.primarywhite,
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Question  " + "${index + 1}/10",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: ColorConstnats.font_color),
                        ),
                        Text(
                          quizModel.question ?? "",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: ColorConstnats.font_color),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () {
                            prov.pressedA = true;
                            prov.changeType(
                              prov.colorA == ColorConstnats.primarywhite
                                  ? ColorConstnats.backgroundColor
                                  : ColorConstnats.primarywhite,
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: prov.colorA,
                                border: Border.all(
                                    color: ColorConstnats.font_color),
                                borderRadius: BorderRadius.circular(20)),
                            width: 250,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                              child: Text(
                                quizModel.answers?.answerA == null
                                    ? "a:   " + "none of above"
                                    : "a:   " + "${quizModel.answers?.answerA}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: prov.colorA ==
                                            ColorConstnats.primarywhite
                                        ? ColorConstnats.backgroundColor
                                        : ColorConstnats.primarywhite),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () {
                            prov.pressedB = true;
                            prov.changeType(
                                prov.colorB == ColorConstnats.primarywhite
                                    ? ColorConstnats.backgroundColor
                                    : ColorConstnats.primarywhite);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: prov.colorB,
                                border: Border.all(
                                    color: prov.submitB == true
                                        ? Colors.green
                                        : ColorConstnats.font_color),
                                borderRadius: BorderRadius.circular(20)),
                            width: 250,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                              child: Text(
                                quizModel.answers?.answerB == null
                                    ? "b:   " + "none of above"
                                    : "b:   " + "${quizModel.answers?.answerB}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: prov.colorB ==
                                            ColorConstnats.primarywhite
                                        ? ColorConstnats.backgroundColor
                                        : ColorConstnats.primarywhite),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () {
                            prov.pressedC = true;
                            prov.changeType(
                                prov.colorC == ColorConstnats.primarywhite
                                    ? ColorConstnats.backgroundColor
                                    : ColorConstnats.primarywhite);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: prov.colorC,
                                border: Border.all(
                                    color: prov.submitC == true
                                        ? Colors.green
                                        : ColorConstnats.font_color),
                                borderRadius: BorderRadius.circular(20)),
                            width: 250,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                              child: Text(
                                quizModel.answers?.answerC == null
                                    ? "c:   " + "none of above"
                                    : "c:   " + "${quizModel.answers?.answerC}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: prov.colorC ==
                                            ColorConstnats.primarywhite
                                        ? ColorConstnats.backgroundColor
                                        : ColorConstnats.primarywhite),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () {
                            prov.pressedD = true;
                            prov.changeType(
                              prov.colorD == ColorConstnats.primarywhite
                                  ? ColorConstnats.backgroundColor
                                  : ColorConstnats.primarywhite,
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: prov.colorD,
                                border: Border.all(
                                    color: prov.submitD == true
                                        ? Colors.green
                                        : ColorConstnats.font_color),
                                borderRadius: BorderRadius.circular(20)),
                            width: 250,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                              child: Text(
                                quizModel.answers?.answerD == null
                                    ? "d:   " + "none of above"
                                    : "d:   " + "${quizModel.answers?.answerD}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: prov.colorD ==
                                            ColorConstnats.primarywhite
                                        ? ColorConstnats.backgroundColor
                                        : ColorConstnats.primarywhite),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              )

            // ---------------second---------------

            : Container(
                height: 500,
                width: 600,
                decoration: BoxDecoration(
                    color: ColorConstnats.primarywhite,
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Question  " + "${index + 1}/10",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: ColorConstnats.font_color),
                        ),
                        Text(
                          quizModel.question ?? "",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: ColorConstnats.font_color),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          // onTap: () {
                          //   prov.pressedA = true;
                          //   prov.changeType(
                          //     prov.colorA == ColorConstnats.primarywhite
                          //         ? ColorConstnats.backgroundColor
                          //         : ColorConstnats.primarywhite,
                          //   );
                          // },
                          child: Container(
                            decoration: BoxDecoration(
                                color: quizModel.correctAnswer == prov.optionA
                                    ? Colors.green
                                    : prov.colorA,
                                border: Border.all(
                                    color: ColorConstnats.font_color),
                                borderRadius: BorderRadius.circular(20)),
                            width: 250,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                              child: Text(
                                quizModel.answers?.answerA == null
                                    ? "a:   " + "none of above"
                                    : "a:   " + "${quizModel.answers?.answerA}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: prov.colorA ==
                                            ColorConstnats.primarywhite
                                        ? ColorConstnats.backgroundColor
                                        : ColorConstnats.primarywhite),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          // onTap: () {
                          //   prov.pressedB = true;
                          //   prov.changeType(
                          //       prov.colorB == ColorConstnats.primarywhite
                          //           ? ColorConstnats.backgroundColor
                          //           : ColorConstnats.primarywhite);
                          // },
                          child: Container(
                            decoration: BoxDecoration(
                                color: quizModel.correctAnswer == prov.optionB
                                    ? Colors.green
                                    : prov.colorB,
                                border: Border.all(
                                    color: ColorConstnats.font_color),
                                borderRadius: BorderRadius.circular(20)),
                            width: 250,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                              child: Text(
                                quizModel.answers?.answerB == null
                                    ? "b:   " + "none of above"
                                    : "b:   " + "${quizModel.answers?.answerB}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: prov.colorB ==
                                            ColorConstnats.primarywhite
                                        ? ColorConstnats.backgroundColor
                                        : ColorConstnats.primarywhite),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          // onTap: () {
                          //   prov.pressedC = true;
                          //   prov.changeType(
                          //       prov.colorC == ColorConstnats.primarywhite
                          //           ? ColorConstnats.backgroundColor
                          //           : ColorConstnats.primarywhite);
                          // },
                          child: Container(
                            decoration: BoxDecoration(
                                color: quizModel.correctAnswer == prov.optionC
                                    ? Colors.green
                                    : prov.colorC,
                                border: Border.all(
                                    color: prov.submitC == true
                                        ? Colors.green
                                        : ColorConstnats.font_color),
                                borderRadius: BorderRadius.circular(20)),
                            width: 250,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                              child: Text(
                                quizModel.answers?.answerC == null
                                    ? "c:   " + "none of above"
                                    : "c:   " + "${quizModel.answers?.answerC}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: prov.colorC ==
                                            ColorConstnats.primarywhite
                                        ? ColorConstnats.backgroundColor
                                        : ColorConstnats.primarywhite),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          // onTap: () {
                          //   prov.pressedD = true;
                          //   prov.changeType(
                          //     prov.colorD == ColorConstnats.primarywhite
                          //         ? ColorConstnats.backgroundColor
                          //         : ColorConstnats.primarywhite,
                          //   );
                          // },
                          child: Container(
                            decoration: BoxDecoration(
                                color: quizModel.correctAnswer == prov.optionD
                                    ? Colors.green
                                    : prov.colorD,
                                border: Border.all(
                                    color: prov.submitD == true
                                        ? Colors.green
                                        : ColorConstnats.font_color),
                                borderRadius: BorderRadius.circular(20)),
                            width: 250,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                              child: Text(
                                quizModel.answers?.answerD == null
                                    ? "d:   " + "none of above"
                                    : "d:   " + "${quizModel.answers?.answerD}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: prov.colorD ==
                                            ColorConstnats.primarywhite
                                        ? ColorConstnats.backgroundColor
                                        : ColorConstnats.primarywhite),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              );
  }
}
