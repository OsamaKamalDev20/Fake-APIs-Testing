import 'package:apis_demo/Fake%20APIs%20Tutorial/custom_weather_details.dart';
import 'package:apis_demo/Fake%20APIs%20Tutorial/fake_apis_styles.dart';
import 'package:apis_demo/Fake%20APIs%20Tutorial/models/fake_weather_model.dart';
import 'package:flutter/material.dart';

class FakeWeatherDetails extends StatelessWidget {
  final FakeWeatherModel weather;
  const FakeWeatherDetails({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: Colors.yellowAccent[700],
        title: Text("${weather.city} Weather"),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: AssetImage("assets/images/weatherIcon.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text("${weather.city}", style: heading),
                Text("${weather.weatherDescription.name}", style: description),
                SizedBox(height: 15),
                Text("Weather Details", style: heading),
                SizedBox(height: 10),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      CustomWeatherDetails(
                        image: "assets/images/maxTemp.png",
                        label: "Temperature",
                        value: "${weather.temperature} °C",
                        color: Colors.red[600],
                      ),
                      SizedBox(width: 15),
                      CustomWeatherDetails(
                        image: "assets/images/humidity.png",
                        label: "Humidity",
                        value: "${weather.humidity} %",
                        color: Colors.blue[600],
                      ),
                      SizedBox(width: 15),
                      CustomWeatherDetails(
                        image: "assets/images/windSpeed.png",
                        label: "WindSpeed",
                        value: "${weather.windSpeed}km/h",
                        color: Colors.green[600],
                      ),
                      SizedBox(width: 15),
                      CustomWeatherDetails(
                        image: "assets/images/latitudeIcon.png",
                        label: "Latitude",
                        value: "${weather.latitude.toStringAsFixed(2)}°",
                        color: Colors.deepPurple[600],
                      ),
                      SizedBox(width: 15),
                      CustomWeatherDetails(
                        image: "assets/images/longitudeIcon.png",
                        label: "Longitude",
                        value: "${weather.longitude.toStringAsFixed(2)}°",
                        color: Colors.yellowAccent[700],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Text("2 Days Weather Forecasts", style: heading),
                SizedBox(height: 10),
                SizedBox(
                  height: 224,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: weather.forecast.length,
                    itemBuilder: ((context, index) {
                      final forecast = weather.forecast[index];
                      return Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: Material(
                          elevation: 4,
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            padding: EdgeInsets.all(6),
                            margin: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: cardColor,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Date",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "Date: ${forecast.date.toLocal()}"
                                          .split(' ')[1],
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red[700],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Temperature",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "${forecast.temperature} °C",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue[700],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Weather Description",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "${forecast.weatherDescription.name}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green[700],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Humidity",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "${forecast.humidity} %",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.yellowAccent[400],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
