import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_application_22/controller/homepage_controller.dart';
import 'package:flutter_application_22/core/constants/color_constnats.dart';
import 'package:provider/provider.dart';

class NumberWidget extends StatefulWidget {
  final int index;

  const NumberWidget({
    super.key,
    required this.index,
  });

  @override
  State<NumberWidget> createState() => _NumberWidgetState();
}

class _NumberWidgetState extends State<NumberWidget> {
  @override
  Widget build(BuildContext context) {
    int numbers = context.watch<HomepageController>().quizModel.length;
    // int displayNumber = 0;
    int displayNumber = (widget.index <= numbers) ? widget.index + 1 : numbers;
    // for (int i = 1; i <= numbers; i++) {
    //   log("display number: $i");
    //   displayNumber = i;
    // }
    log("index2--------${widget.index}");
    var provider = context.read<HomepageController>();
    log("display numbers:$displayNumber");
    // log("current Index-----------------${context.read<HomepageController>().currentIndex}");

    return CircleAvatar(
        backgroundColor:
            displayNumber == context.read<HomepageController>().currentIndex + 1
                ? ColorConstnats.button_color
                : ColorConstnats.primarywhite,
        child: provider.currentIndex < displayNumber
            ? Text(
                "$displayNumber",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              )
            : provider.isCorrectList[widget.index] == true
                ? Icon(
                    Icons.check,
                    color: Colors.green,
                  )
                : Icon(
                    Icons.close,
                    color: Colors.red,
                  ));
  }
}
