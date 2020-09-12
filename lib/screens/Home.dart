import 'package:flutter/material.dart';
import 'package:weather_app/services/GetWeatherDetails.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  @override
  void initState() {
    super.initState();
    getWeatherdetails('https://hg-weather-application.herokuapp.com/weather?address=delhi');
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
    );
  }
}
