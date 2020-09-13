import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/Models/WeatherModel.dart';

class GetWeatherDetails{


  Weather weather = new Weather();
  var jsondata;

  Future<Map<String,dynamic>> getWeatherdetails(String url) async{
    http.Response response = await http.get(url);
    print(response.statusCode);
    if(response.statusCode == 200){
      try{
        jsondata = json.decode(response.body);
        print(jsondata['name']);
        // print(jsondata.toString());
        // print(jsondata.toString().name);
        print(jsondata);
      }catch(e){
        print(e);
      }
    }else{
      print("status code doesn'\t matched");
    }
  }


}

