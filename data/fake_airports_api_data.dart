import 'dart:convert';

import 'package:apis_demo/Fake%20APIs%20Tutorial/Details/fake_airports_api_details.dart';
import 'package:apis_demo/Fake%20APIs%20Tutorial/fake_apis_styles.dart';
import 'package:apis_demo/Fake%20APIs%20Tutorial/models/fake_airports_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FakeAirportsAPIs extends StatefulWidget {
  const FakeAirportsAPIs({super.key});

  @override
  State<FakeAirportsAPIs> createState() => _FakeAirportsAPIsState();
}

class _FakeAirportsAPIsState extends State<FakeAirportsAPIs> {
  List<FakeAirportModel> fakeAirports = [];
  Future<List<FakeAirportModel>> getFakeAirports() async {
    final response = await http
        .get(Uri.parse("https://www.freetestapi.com/api/v1/airports"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      fakeAirports.clear();
      for (Map<String, dynamic> i in data) {
        fakeAirports.add(FakeAirportModel.fromJson(i));
      }
      return fakeAirports;
    } else {
      throw Exception('Failed to load airports');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: Text("Fake Airports APIs"),
        centerTitle: true,
        backgroundColor: Colors.redAccent[700],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: FutureBuilder(
                future: getFakeAirports(),
                builder: ((context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else
                    return ListView.builder(
                      itemCount: fakeAirports.length,
                      itemBuilder: ((context, index) {
                        return Padding(
                          padding: EdgeInsets.all(10),
                          child: Material(
                            elevation: 4,
                            borderRadius: BorderRadius.circular(8),
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
                                  horizontal: 8,
                                  vertical: 8,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${fakeAirports[index].name}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: headingColor,
                                      ),
                                    ),
                                    Text(
                                      "${fakeAirports[index].country}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        color: descriptionColor,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                Colors.redAccent[700],
                                          ),
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: ((context) =>
                                                    FakeAirportsDetails(
                                                      airports:
                                                          fakeAirports[index],
                                                    )),
                                              ),
                                            );
                                          },
                                          child: Text(
                                            "View More Details",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: cardColor,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            color: Colors.redAccent
                                                .withOpacity(.2),
                                          ),
                                          padding: EdgeInsets.all(6),
                                          child: Text(
                                            "${fakeAirports[index].code}",
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w800,
                                              color: Colors.redAccent[700],
                                            ),
                                          ),
                                        ),
                                      ],
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
