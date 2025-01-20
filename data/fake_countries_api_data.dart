import 'dart:convert';

import 'package:apis_demo/Fake%20APIs%20Tutorial/Details/fake_countries_api_details.dart';
import 'package:apis_demo/Fake%20APIs%20Tutorial/fake_apis_styles.dart';
import 'package:apis_demo/Fake%20APIs%20Tutorial/models/fake_countries_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FakeCountriesAPIs extends StatefulWidget {
  const FakeCountriesAPIs({super.key});

  @override
  State<FakeCountriesAPIs> createState() => _FakeCountriesAPIsState();
}

class _FakeCountriesAPIsState extends State<FakeCountriesAPIs> {
  List<FakeCountriesModel> fakeCountries = [];
  Future<List<FakeCountriesModel>> getCountries() async {
    final response = await http
        .get(Uri.parse("https://www.freetestapi.com/api/v1/countries"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      fakeCountries.clear();
      for (Map<String, dynamic> i in data) {
        fakeCountries.add(FakeCountriesModel.fromJson(i));
      }
      return fakeCountries;
    } else {
      throw Exception('Failed to load countries');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text("Fake Countries APIs"),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Expanded(
                child: FutureBuilder(
                  future: getCountries(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return ListView.builder(
                        itemCount: fakeCountries.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(vertical: 15),
                            child: Container(
                              height: 320,
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
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: ((context) =>
                                                FakeCountriesDetails(
                                                  countries:
                                                      fakeCountries[index],
                                                )),
                                          ),
                                        );
                                      },
                                      child: Hero(
                                        tag: fakeCountries[index].flag,
                                        child: Container(
                                          height: 200,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                "${fakeCountries[index].flag}",
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      "${fakeCountries[index].name}",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: headingColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "${fakeCountries[index].capital}",
                                      style: description,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
