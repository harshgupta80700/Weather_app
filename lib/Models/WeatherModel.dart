class Weather {
  String name;
  String address;
  String latitude;
  String longitude;
  String region;
  String country;
  String location;
  String tempinF;
  String tempinC;

  Weather({
    this.name,
    this.address,
    this.latitude,
    this.longitude,
    this.region,
    this.country,
    this.location,
    this.tempinF,
    this.tempinC
  });

  factory Weather.fromjson(Map<String,dynamic> item){
    print("weather model called");
    final weather =  Weather(
      name: item['name'],
      address: item['address'],
      latitude: item['latitude'],
      location: item['location'],
      longitude: item['longitude'],
      region: item['region'],
      country: item['country'],
      tempinC: item['tempinC'],
      tempinF: item['tempinF']
    );
    print(weather.name);
    return weather;
  }

}