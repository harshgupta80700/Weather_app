import 'package:flutter/material.dart';
import 'package:weather_app/Models/WeatherModel.dart';
import 'package:weather_app/services/GetWeatherDetails.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final TextEditingController weatherName = TextEditingController();
  bool isOnPressedClicked = false;
  Weather weather = new Weather();
  
  @override
  void initState() {
    super.initState();
    getWeatherdetails('https://hg-weather-application.herokuapp.com/weather?address=delhi');
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isOnPressedClicked ?
      Center(child: CircularProgressIndicator(),) :
      Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: weatherName,
                decoration: InputDecoration(
                  border: OutlineInputBorder()
                ),
              ),
              SizedBox(height: 30,),
              RaisedButton(
                onPressed:(){
                  setState(() {
                    //isOnPressedClicked =  true;
                    weather = getWeatherdetails('https://hg-weather-application.herokuapp.com/weather?address=delhi').then((value){
                      print(weather.name);
                    }) as Weather;
                  });
                },
                child: Text("Submit"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
