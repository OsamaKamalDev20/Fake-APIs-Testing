// To parse this JSON data, do
//
//     final fakeWeatherModel = fakeWeatherModelFromJson(jsonString);

import 'dart:convert';

List<FakeWeatherModel> fakeWeatherModelFromJson(String str) =>
    List<FakeWeatherModel>.from(
        json.decode(str).map((x) => FakeWeatherModel.fromJson(x)));

String fakeWeatherModelToJson(List<FakeWeatherModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FakeWeatherModel {
  int id;
  String city;
  String country;
  double latitude;
  double longitude;
  double temperature;
  WeatherDescription weatherDescription;
  int humidity;
  double windSpeed;
  List<Forecast> forecast;

  FakeWeatherModel({
    required this.id,
    required this.city,
    required this.country,
    required this.latitude,
    required this.longitude,
    required this.temperature,
    required this.weatherDescription,
    required this.humidity,
    required this.windSpeed,
    required this.forecast,
  });

  factory FakeWeatherModel.fromJson(Map<String, dynamic> json) =>
      FakeWeatherModel(
        id: json["id"],
        city: json["city"],
        country: json["country"],
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        temperature: json["temperature"]?.toDouble(),
        weatherDescription:
            weatherDescriptionValues.map[json["weather_description"]]!,
        humidity: json["humidity"],
        windSpeed: json["wind_speed"]?.toDouble(),
        forecast: List<Forecast>.from(
            json["forecast"].map((x) => Forecast.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "city": city,
        "country": country,
        "latitude": latitude,
        "longitude": longitude,
        "temperature": temperature,
        "weather_description":
            weatherDescriptionValues.reverse[weatherDescription],
        "humidity": humidity,
        "wind_speed": windSpeed,
        "forecast": List<dynamic>.from(forecast.map((x) => x.toJson())),
      };
}

class Forecast {
  DateTime date;
  int temperature;
  WeatherDescription weatherDescription;
  int humidity;
  double windSpeed;

  Forecast({
    required this.date,
    required this.temperature,
    required this.weatherDescription,
    required this.humidity,
    required this.windSpeed,
  });

  factory Forecast.fromJson(Map<String, dynamic> json) => Forecast(
        date: DateTime.parse(json["date"]),
        temperature: json["temperature"],
        weatherDescription:
            weatherDescriptionValues.map[json["weather_description"]]!,
        humidity: json["humidity"],
        windSpeed: json["wind_speed"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "temperature": temperature,
        "weather_description":
            weatherDescriptionValues.reverse[weatherDescription],
        "humidity": humidity,
        "wind_speed": windSpeed,
      };
}

enum WeatherDescription {
  CLEAR_SKY,
  CLOUDY,
  PARTLY_CLOUDY,
  RAIN,
  RAINY,
  RAIN_SHOWERS,
  SCATTERED_CLOUDS,
  SUNNY,
  WEATHER_DESCRIPTION_PARTLY_CLOUDY
}

final weatherDescriptionValues = EnumValues({
  "Clear sky": WeatherDescription.CLEAR_SKY,
  "Cloudy": WeatherDescription.CLOUDY,
  "Partly cloudy": WeatherDescription.PARTLY_CLOUDY,
  "Rain": WeatherDescription.RAIN,
  "Rainy": WeatherDescription.RAINY,
  "Rain showers": WeatherDescription.RAIN_SHOWERS,
  "Scattered clouds": WeatherDescription.SCATTERED_CLOUDS,
  "Sunny": WeatherDescription.SUNNY,
  "Partly Cloudy": WeatherDescription.WEATHER_DESCRIPTION_PARTLY_CLOUDY
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
