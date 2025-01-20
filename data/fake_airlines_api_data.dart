import 'dart:convert';

import 'package:apis_demo/Fake%20APIs%20Tutorial/fake_apis_styles.dart';
import 'package:apis_demo/Fake%20APIs%20Tutorial/models/fake_airlines_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FakeAirlinesAPIs extends StatefulWidget {
  const FakeAirlinesAPIs({super.key});

  @override
  State<FakeAirlinesAPIs> createState() => _FakeAirlinesAPIsState();
}

class _FakeAirlinesAPIsState extends State<FakeAirlinesAPIs> {
  List<FakeAirlinesModel> fakeAirlines = [];
  Future<List<FakeAirlinesModel>> getFakeAirlines() async {
    final response = await http
        .get(Uri.parse("https://www.freetestapi.com/api/v1/airlines"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      fakeAirlines.clear();
      for (Map<String, dynamic> i in data) {
        fakeAirlines.add(FakeAirlinesModel.fromJson(i));
      }
      return fakeAirlines;
    } else {
      throw Exception('Failed to load airlines');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: Text("Fake Airlines APIs"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent[700],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: FutureBuilder(
                future: getFakeAirlines(),
                builder: ((context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else
                    return ListView.builder(
                      itemCount: fakeAirlines.length,
                      itemBuilder: ((context, index) {
                        return Padding(
                          padding: EdgeInsets.all(10),
                          child: Material(
                            elevation: 4,
                            borderRadius: BorderRadius.circular(8),
                            child: Container(
                              decoration: BoxDecoration(
                                color: cardColor,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 8,
                                ),
                                child: Stack(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${fakeAirlines[index].name}",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                            color: headingColor,
                                          ),
                                        ),
                                        Text(
                                          "${fakeAirlines[index].country}",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16,
                                            color: descriptionColor,
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          "Fleet Size:- ",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                            color: headingColor,
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          "${fakeAirlines[index].fleetSize}",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            color: Colors.blueAccent[700],
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          "Headquarters",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                            color: headingColor,
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          "${fakeAirlines[index].headquarters}",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            color: Colors.blueAccent[700],
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.language_outlined,
                                              size: 30,
                                              color: Colors.blueAccent[700],
                                            ),
                                            SizedBox(width: 8),
                                            Text(
                                              "Website",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                                color: headingColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          "${fakeAirlines[index].website}.",
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: descriptionColor,
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Align(
                                          alignment: Alignment.bottomRight,
                                          child: Text(
                                            "${fakeAirlines[index].founded}",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 24,
                                              color: Colors.blueAccent[700],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Positioned(
                                      right: 5,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          color:
                                              Colors.blueAccent.withOpacity(.2),
                                        ),
                                        padding: EdgeInsets.all(6),
                                        child: Text(
                                          "${fakeAirlines[index].code}",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w800,
                                            color: Colors.blueAccent[700],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
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
