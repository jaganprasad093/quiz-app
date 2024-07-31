import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_application_22/controller/homepage_controller.dart';
import 'package:flutter_application_22/core/constants/color_constnats.dart';
import 'package:flutter_application_22/homepage/widgets/number_widget.dart';
import 'package:flutter_application_22/homepage/widgets/question_widgets.dart';
import 'package:flutter_application_22/homepage/widgets/scorecard.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  // int? selectedIndex;
  int currentIndex = 0;
  bool submitted = false;
  @override
  void initState() {
    context.read<HomepageController>().getdata();
    // iniLoad();
    super.initState();
  }

  // iniLoad() async {
  //   await context.read<HomepageController>().getdata();
  // }

  PageController pageviewcontroller = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    var prov = context.read<HomepageController>().quizModel;
    var provider = context.read<HomepageController>();

    log("length homepage:${prov.length}");
    log("current index:${currentIndex}");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstnats.backgroundColor,
        title: Text(
          "Quiz App",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: context.watch<HomepageController>().isLoading
          ? Center(
              child: CircularProgressIndicator(
              color: ColorConstnats.primarywhite,
            ))
          : Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => NumberWidget(
                            index: index,
                          ),
                      separatorBuilder: (context, index) => SizedBox(
                            width: 40,
                          ),
                      itemCount: prov.length),
                ),
                SizedBox(
                  height: 500,
                  child: PageView.builder(
                    onPageChanged: (int index) {
                      setState(() {
                        currentIndex = index;
                        log("current index1:$currentIndex");
                      });
                    },
                    itemCount: prov.length,
                    controller: pageviewcontroller,
                    scrollDirection: Axis.horizontal,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return QuestionWidgets(
                        submitted: submitted,
                        index: index,
                        quizModel: prov[index],
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () async {
                    // log(" subittt a:${provider.pressedA}");

                    if (submitted == true) {
                      if (currentIndex + 1 == prov.length) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Scorecard(),
                            ));
                        return;
                      }

                      provider.changeType(ColorConstnats.primarywhite);

                      setState(() {
                        submitted = false;
                      });
                      provider.currentIndex++;
                      pageviewcontroller.nextPage(
                          duration: Duration(milliseconds: 100),
                          curve: Curves.bounceInOut);
                    } else {
                      if (provider.submitA == true ||
                          provider.submitB == true ||
                          provider.submitC == true ||
                          provider.submitD == true) {
                        await provider.submit(currentIndex);

                        log("submitted the answer");
                        setState(() {
                          submitted = true;
                        });
                        log("submitted:$submitted");
                      }
                    }
                  },
                  child: Container(
                    height: 50,
                    width: 250,
                    decoration: BoxDecoration(
                        color: submitted != true
                            ? ColorConstnats.button_color
                            : Colors.green,
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: Text(
                        submitted != true ? "SUBMIT" : "NEXT",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 22),
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
