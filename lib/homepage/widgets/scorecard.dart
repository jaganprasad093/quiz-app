import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_22/controller/homepage_controller.dart';
import 'package:flutter_application_22/core/constants/color_constnats.dart';
import 'package:flutter_application_22/homepage/homepage.dart';
import 'package:provider/provider.dart';

class Scorecard extends StatelessWidget {
  const Scorecard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstnats.backgroundColor,
        title: Text(
          "Quiz App",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: ColorConstnats.primarywhite),
        ),
      ),
      body: Container(
        color: ColorConstnats.primarywhite,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Total scored=${context.read<HomepageController>().selected_answer}",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: ColorConstnats.backgroundColor,
                    fontSize: 30),
              ),
              // ElevatedButton(
              //     onPressed: () async {
              //       await context.read<HomepageController>().getdata();
              //       context.read<HomepageController>().isCorrectList.clear();
              //       log("isCorrectlist----${context.read<HomepageController>().isCorrectList}");
              //       // Restart.restartApp();
              //       Navigator.pushReplacement(
              //           context,
              //           MaterialPageRoute(
              //             builder: (context) => Homepage(),
              //           ));
              //     },
              //     child: Text("RESTART"))
            ],
          ),
        ),
      ),
    );
  }
}
