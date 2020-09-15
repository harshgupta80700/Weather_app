import 'package:flutter/material.dart';
import 'package:weather_app/Models/WeatherModel.dart';

class Landing extends StatelessWidget {

  final Weather weather;

  Landing({this.weather});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Weather Details",style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: Center(
        child: Text(weather.name),
      ),
    );
  }
}

