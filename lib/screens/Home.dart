import 'package:flutter/material.dart';
import 'package:weather_app/Models/ApiResponse.dart';
import 'package:weather_app/Models/WeatherModel.dart';
import 'package:weather_app/services/GetWeatherDetails.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final TextEditingController weatherName = TextEditingController();
  bool isOnPressedClicked = false;
  APIResponse<Weather> _apiResponse;
  GetWeatherDetails getWeatherDetailsServices = new GetWeatherDetails();

  
  @override
  void initState() {
    super.initState();
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
                onPressed:() async {
                  _apiResponse = await getWeatherDetailsServices.getWeatherdetails("Delhi");
                  print(_apiResponse);
                  // setState(() async {
                  //
                  //   //isOnPressedClicked =  true;
                  //   // var response;
                  //   // response = getWeatherDetails.getWeatherdetails("Delhi").then((value){
                  //   //   print(response);
                  //   //   var data = getWeatherDetails;
                  //   //   print(data);
                  //   //   print(data['name']);
                  //   // });
                  // });
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
