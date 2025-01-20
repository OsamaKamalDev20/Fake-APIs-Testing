import 'dart:convert';

import 'package:apis_demo/Fake%20APIs%20Tutorial/custom_widget.dart';
import 'package:apis_demo/Fake%20APIs%20Tutorial/fake_apis_styles.dart';
import 'package:apis_demo/Fake%20APIs%20Tutorial/models/fake_unitedStates_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FakeUnitedStatesAPIs extends StatefulWidget {
  const FakeUnitedStatesAPIs({super.key});

  @override
  State<FakeUnitedStatesAPIs> createState() => _FakeUnitedStatesAPIsState();
}

class _FakeUnitedStatesAPIsState extends State<FakeUnitedStatesAPIs> {
  List<FakeUnitedStatesModel> unitedStates = [];
  Future<List<FakeUnitedStatesModel>> getFakeUnitedStates() async {
    final response = await http
        .get(Uri.parse("https://www.freetestapi.com/api/v1/us-states"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      unitedStates.clear(); // Clear list before adding new data
      for (Map<String, dynamic> i in data) {
        unitedStates.add(FakeUnitedStatesModel.fromJson(i));
      }
      return unitedStates;
    } else {
      throw Exception('Failed to load united states');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[700],
        title: Text("Fake US APIs"),
      ),
      backgroundColor: bgColor,
      body: FutureBuilder(
        future: getFakeUnitedStates(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemCount: unitedStates.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  child: Material(
                    elevation: 6,
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      height: 450,
                      decoration: BoxDecoration(
                        color: cardColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 200,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                    "assets/images/unitedStates.jpg",
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("${unitedStates[index].name}",
                                    style: heading),
                                Text(
                                  "${unitedStates[index].capital}",
                                  style: description,
                                ),
                              ],
                            ),
                            Text(
                              "${unitedStates[index].timeZone.name}",
                              style: description,
                            ),
                            SizedBox(height: 10),
                            Wrap(
                              spacing: 15,
                              runSpacing: 10,
                              children: [
                                CustomSpecification(
                                  title: "Largest City",
                                  value: "${unitedStates[index].largestCity}",
                                  color: Colors.red[800],
                                ),
                                CustomSpecification(
                                  title: "Population",
                                  value: "${unitedStates[index].population}",
                                  color: Colors.blue[800],
                                ),
                                CustomSpecification(
                                  title: "Area Square Mile",
                                  value:
                                      "${unitedStates[index].population}  mi²",
                                  color: Colors.green[800],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
