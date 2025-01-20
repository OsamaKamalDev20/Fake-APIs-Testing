import 'dart:convert';

import 'package:apis_demo/Fake%20APIs%20Tutorial/Details/fake_destinations_api_details.dart';
import 'package:apis_demo/Fake%20APIs%20Tutorial/fake_apis_styles.dart';
import 'package:apis_demo/Fake%20APIs%20Tutorial/models/fake_destinations_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FakeDestinationsAPIs extends StatefulWidget {
  const FakeDestinationsAPIs({super.key});

  @override
  State<FakeDestinationsAPIs> createState() => _FakeDestinationsAPIsState();
}

class _FakeDestinationsAPIsState extends State<FakeDestinationsAPIs> {
  List<FakeDestinationsModel> fakeDestinations = [];
  Future<List<FakeDestinationsModel>> getCountries() async {
    final response = await http
        .get(Uri.parse("https://www.freetestapi.com/api/v1/destinations"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      fakeDestinations.clear();
      for (Map<String, dynamic> i in data) {
        fakeDestinations.add(FakeDestinationsModel.fromJson(i));
      }
      return fakeDestinations;
    } else {
      throw Exception('Failed to load countries');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: Color(0XFFE4003A),
        title: Text("Destinations APIs"),
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
                        itemCount: fakeDestinations.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(vertical: 15),
                            child: Container(
                              height: 280,
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
                                padding: const EdgeInsets.all(8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: ((context) =>
                                                FakeDestinationsDetails(
                                                  destinations:
                                                      fakeDestinations[index],
                                                )),
                                          ),
                                        );
                                      },
                                      child: Hero(
                                        tag: "${fakeDestinations[index].image}",
                                        child: Container(
                                          height: 200,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                "${fakeDestinations[index].image}",
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      "${fakeDestinations[index].name}",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: headingColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "${fakeDestinations[index].country}",
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: descriptionColor,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          "${fakeDestinations[index].continent.name}",
                                          style: description,
                                        ),
                                      ],
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
