import 'package:flutter/material.dart';
import 'package:africa_time/pages/home.dart';
import 'package:africa_time/pages/choose_location.dart';
import 'package:africa_time/pages/loading_page.dart';

void main() {
  runApp(MaterialApp(
    //home: Loading(),
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/location': (context) => ChooseLocation(),
    },
  ));
}
