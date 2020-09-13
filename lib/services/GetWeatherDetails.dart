import 'dart:convert';

import 'package:http/http.dart' as http;

class GetWeatherDetails{

  Future getWeatherdetails(String url) async{
    http.Response response = await http.get(url);
    print(response.statusCode);
    if(response.statusCode == 200){
      try{
        var jsondata = json.decode(response.body);
        print(jsondata['name']);
        // print(jsondata.toString());
        // print(jsondata.toString().name);
        return jsondata;

      }catch(e){
        print(e);
      }
    }else{
      print("status code doesn'\t matched");
    }
  }


}

