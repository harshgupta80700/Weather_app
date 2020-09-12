import 'dart:convert';

import 'package:http/http.dart' as http;

Future getWeatherdetails(String url) async{
  http.Response response = await http.get(url);
  print(response.statusCode);
  if(response.statusCode == 200){
    try{
      var jsondata = json.decode(response.body);
      print(jsondata['name']);

    }catch(e){

    }
  }
}