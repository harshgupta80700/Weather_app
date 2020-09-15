import 'package:flutter/material.dart';
import 'package:weather_app/Models/ApiResponse.dart';
import 'package:weather_app/Models/WeatherModel.dart';
import 'package:weather_app/screens/Landing.dart';
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
                  setState(() {
                    isOnPressedClicked = true;
                  });
                  print("before");
                  getWeatherDetailsServices.getWeatherdetails(weatherName.text.toString()).then((value){
                    _apiResponse =  value;
                    if(_apiResponse.error){
                      setState(() {
                        isOnPressedClicked =  false;
                      });
                      showDialog(context: context,
                          builder: (_){
                            return AlertDialog(
                              title: Text(_apiResponse.errorMessage),
                              actions: [
                                FlatButton(onPressed: (){
                                  Navigator.pop(context);
                                }, child: Text("OK"))
                              ],
                            );
                          }
                      );
                    }else{
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>Landing(weather: _apiResponse.data,))).then((value){
                        setState(() {
                          isOnPressedClicked =  false;
                        });
                      });
                    }
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
