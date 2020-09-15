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

  factory Weather.fromJson(Map<String,dynamic> item){
    return Weather(
      name: item['name'],
      address: item['address'],
      latitude: item['latitude'].toString(),
      location: item['location'],
      longitude: item['longitude'].toString(),
      region: item['region'],
      country: item['country'],
      tempinC: item['tempinC'].toString(),
      tempinF: item['tempinF'].toString()
    );
  }

}