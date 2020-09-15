import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/Models/ApiResponse.dart';
import 'package:weather_app/Models/WeatherModel.dart';

class GetWeatherDetails{


  Weather weather = new Weather();

  String url = "https://hg-weather-application.herokuapp.com/weather?address=";

  Future<APIResponse<Weather>> getWeatherdetails(String address) async{
    return http.get(url + address).then((value){
      var jsonData = jsonDecode(value.body);
      Weather weather;

      print(value.statusCode);
      print(jsonData);

    }).catchError((e){

    });

    }
  }



