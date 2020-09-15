import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/Models/ApiResponse.dart';
import 'package:weather_app/Models/WeatherModel.dart';

class GetWeatherDetails{
    String url = "https://hg-weather-application.herokuapp.com/weather?address=";

  Future<APIResponse<Weather>> getWeatherdetails(String address){
    print("services called");
    return http.get(url + address).then((value) {
      if(value.statusCode == 200){
        print("status code checked");
        var jsonData = jsonDecode(value.body);
        print(jsonData['name']);
        final weather = Weather.fromjson(jsonData);
        print('before printing');
        print(weather.name);
        return APIResponse<Weather>(
            data: weather
        );
      }else throw Error();
    }).catchError((e){
      return APIResponse<Weather>(
        error: true,
        errorMessage: "An error has occured",
      );
    });

    }
  }



