import 'package:flutter/material.dart';
import 'package:weather_app/screens/Home.dart';
import 'package:weather_app/screens/Landing.dart';

Map<String,WidgetBuilder> routes = {
  "/" : (context)=>Home(),
  "/landing":(context)=>Landing()
};