import 'dart:convert';

import 'package:apis_demo/Fake%20APIs%20Tutorial/Details/fake_weather_api_details.dart';
import 'package:apis_demo/Fake%20APIs%20Tutorial/fake_apis_styles.dart';
import 'package:apis_demo/Fake%20APIs%20Tutorial/models/fake_weather_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FakeWeatherAPIs extends StatefulWidget {
  const FakeWeatherAPIs({super.key});

  @override
  State<FakeWeatherAPIs> createState() => _FakeWeatherAPIsState();
}

class _FakeWeatherAPIsState extends State<FakeWeatherAPIs> {
  List<FakeWeatherModel> fakeWeather = [];
  Future<List<FakeWeatherModel>> getWeather() async {
    final response = await http
        .get(Uri.parse("https://www.freetestapi.com/api/v1/weathers"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      fakeWeather.clear();
      for (Map<String, dynamic> i in data) {
        fakeWeather.add(FakeWeatherModel.fromJson(i));
      }
      return fakeWeather;
    } else {
      throw Exception('Failed to load weather');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: Colors.yellowAccent[700],
        title: Text("Fake Weather APIs"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: getWeather(),
                builder: ((context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else
                    return ListView.builder(
                      itemCount: fakeWeather.length,
                      itemBuilder: ((context, index) {
                        return Padding(
                          padding: EdgeInsets.all(15),
                          child: Container(
                            decoration: BoxDecoration(
                              color: cardColor,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 1,
                                  spreadRadius: 1,
                                  color: Colors.grey.withOpacity(.3),
                                  offset: Offset(1, 1),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 8,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ListTile(
                                    title: Text(
                                      "${fakeWeather[index].city}",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    subtitle: Text(
                                      "${fakeWeather[index].country}",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: descriptionColor,
                                      ),
                                    ),
                                    trailing: IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: ((context) =>
                                                FakeWeatherDetails(
                                                  weather: fakeWeather[index],
                                                )),
                                          ),
                                        );
                                      },
                                      icon: Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        size: 16,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                    );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
