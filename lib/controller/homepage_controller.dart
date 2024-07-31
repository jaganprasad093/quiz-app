import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_22/core/constants/color_constnats.dart';
import 'package:flutter_application_22/model/quiz_model.dart';

import 'package:http/http.dart' as http;

class HomepageController with ChangeNotifier {
  List<QuizModel> quizModel = [];
  List<bool> isCorrectList = [];

  bool isLoading = false;
  int correct_ans = 0;
  int selected_answer = 0;

  // Color? color;

  Future<void> getdata() async {
    isLoading = true;
    Uri url = Uri.parse(
        "https://quizapi.io/api/v1/questions?apiKey=miKa0AK6KcwHjHIFwG6AVZd4fmyOM05lenRRO78f&category=linux&difficulty=hard&limit=10");
    var res = await http.get(url);
    if (res.statusCode == 200) {
      var decodedData = jsonDecode(res.body);
      if (decodedData is List && decodedData.isNotEmpty) {
        quizModel = (decodedData as List)
            .map(
              (e) => QuizModel.fromJson(e),
            )
            .toList();
        // quizModel.addAll(QuizModel.fromJson(decodedData));
        log("length----${quizModel.length}");
        log("length----$quizModel");

        // log("status code: ${""}");
        log("API fetched successfully");
      } else {
        log("API returned empty data");
      }
    } else {
      log("API fetch failed: ${res.statusCode}");
    }
    isLoading = false;
    notifyListeners();
  }

  Color colorC = ColorConstnats.primarywhite;
  Color colorB = ColorConstnats.primarywhite;
  Color colorD = ColorConstnats.primarywhite;
  Color colorA = ColorConstnats.primarywhite;

  bool pressedA = false;
  bool pressedB = false;
  bool pressedC = false;
  bool pressedD = false;

  bool? submitA;
  bool? submitB;
  bool? submitC;
  bool? submitD;

  changeType(Color value) {
    if (pressedA == true) {
      colorA = value;
      submitA = pressedA;
      pressedA = false;

      colorB = ColorConstnats.primarywhite;
      colorD = ColorConstnats.primarywhite;
      colorC = ColorConstnats.primarywhite;
    } else if (pressedB == true) {
      colorB = value;
      colorA = ColorConstnats.primarywhite;
      colorD = ColorConstnats.primarywhite;
      colorC = ColorConstnats.primarywhite;
      submitB = pressedB;
      pressedB = false;
    } else if (pressedC == true) {
      colorC = value;
      colorB = ColorConstnats.primarywhite;
      colorD = ColorConstnats.primarywhite;
      colorA = ColorConstnats.primarywhite;
      submitC = pressedC;
      pressedC = false;
    } else {
      colorD = value;
      submitD = pressedD;
      pressedD = false;
      colorB = ColorConstnats.primarywhite;
      colorA = ColorConstnats.primarywhite;
      colorC = ColorConstnats.primarywhite;
    }

    notifyListeners();
  }

// ---------- submit ---------

  String optionA = "answer_a";
  String optionB = "answer_b";
  String optionC = "answer_c";
  String optionD = "answer_d";
  int currentIndex = 0;
  bool isCorrect = false;

  submit(int index) {
    // isCorrectList = List<bool>.filled(quizModel.length, false);
    var quiz = quizModel[index];

    log("correct ans: ${quiz.correctAnswer}");
    if (submitA == true) {
      if (optionA == quiz.correctAnswer) {
        selected_answer++;
        isCorrect = true;
      } else {
        isCorrect = false;
      }
    } else if (submitB == true) {
      if (optionB == quiz.correctAnswer) {
        selected_answer++;
        isCorrect = true;
      } else {
        isCorrect = false;
      }
    } else if (submitC == true) {
      if (optionC == quiz.correctAnswer) {
        selected_answer++;
        isCorrect = true;
      } else {
        isCorrect = false;
      }
    } else if (submitD == true) {
      if (optionD == quiz.correctAnswer) {
        selected_answer++;
        isCorrect = true;
      } else {
        isCorrect = false;
      }
    }
    isCorrectList.add(isCorrect);
    log("index:$index");
    log("correct list:$isCorrectList");
    log("total scored: $selected_answer");
    isCorrect = false;
    index++;
    // currentIndex = index;
    log("index: $index");

    submitA = false;
    submitB = false;
    submitC = false;
    submitD = false;
    notifyListeners();
  }
}
