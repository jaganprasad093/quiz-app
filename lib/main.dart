import 'package:flutter/material.dart';
import 'package:flutter_application_22/controller/homepage_controller.dart';
import 'package:flutter_application_22/core/constants/color_constnats.dart';
import 'package:flutter_application_22/homepage/homepage.dart';
import 'package:provider/provider.dart';

void main() {
  // runApp(DevicePreview(enabled: !kReleaseMode, builder: (context) => MyApp()));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomepageController(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // locale: DevicePreview.locale(context),
        useInheritedMediaQuery: true,
        theme:
            ThemeData(scaffoldBackgroundColor: ColorConstnats.backgroundColor),
        home: Homepage(),
      ),
    );
  }
}
