import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/Models/ApiResponse.dart';
import 'package:weather_app/Models/WeatherModel.dart';

class GetWeatherDetails{
    String url = "https://hg-weather-application.herokuapp.com/weather?address=";

  Future<APIResponse<Weather>> getWeatherdetails(String address){
    return http.get(url + address).then((value) {
      if(value.statusCode == 200){
        var jsonData = jsonDecode(value.body);
        final weather = Weather.fromJson(jsonData);
        print(weather.name);
        return APIResponse<Weather>(
            data: weather
        );
      }
      throw Error();
    }).catchError((e){
      print(e);
      return APIResponse<Weather>(
        error: true,
        errorMessage: "An error has occured",
      );
    });

    }
  }



