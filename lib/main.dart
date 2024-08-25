import 'package:flutter/material.dart';
import 'result_page.dart';
import 'page1.dart';
import 'welcome_page.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/welcome',
    routes: {
      '/welcome': (context) => const WelcomePage(),
      '/page1': (context) => const BMICalculator(),
      '/resultPage': (context) => const ResultPage(bmi: 0, resultRoute: ''),
    },
  ));
}
