import 'dart:convert';

import 'package:apis_demo/Fake%20APIs%20Tutorial/Details/fake_animals_api_details.dart';
import 'package:apis_demo/Fake%20APIs%20Tutorial/fake_apis_styles.dart';
import 'package:apis_demo/Fake%20APIs%20Tutorial/models/fake_animals_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FakeAnimalsAPIs extends StatefulWidget {
  const FakeAnimalsAPIs({super.key});

  @override
  State<FakeAnimalsAPIs> createState() => _FakeAnimalsAPIsState();
}

class _FakeAnimalsAPIsState extends State<FakeAnimalsAPIs> {
  List<FakeAnimalsModel> fakeAnimals = [];
  Future<List<FakeAnimalsModel>> getAnimals() async {
    final response =
        await http.get(Uri.parse("https://www.freetestapi.com/api/v1/animals"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      fakeAnimals.clear();
      for (Map<String, dynamic> i in data) {
        fakeAnimals.add(FakeAnimalsModel.fromJson(i));
      }
      return fakeAnimals;
    } else {
      throw Exception("Failed to load animals");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text("Fake Animals APIs"),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: FutureBuilder(
                  future: getAnimals(),
                  builder: ((context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return ListView.builder(
                        itemCount: fakeAnimals.length,
                        itemBuilder: ((context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(vertical: 15),
                            child: Container(
                              height: 300,
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
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: ((context) =>
                                                FakeAnimalsDetails(
                                                  animals: fakeAnimals[index],
                                                )),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        height: 200,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          image: DecorationImage(
                                            image: NetworkImage(
                                                "${fakeAnimals[index].image}"),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      "${fakeAnimals[index].name}",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: headingColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "${fakeAnimals[index].placeOfFound}",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: descriptionColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                      );
                    }
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
