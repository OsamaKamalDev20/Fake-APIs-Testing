import 'dart:convert';

import 'package:apis_demo/Fake%20APIs%20Tutorial/Details/fake_poets_api_details.dart';
import 'package:apis_demo/Fake%20APIs%20Tutorial/fake_apis_styles.dart';
import 'package:apis_demo/Fake%20APIs%20Tutorial/models/fake_poets_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FakePoetsAPIs extends StatefulWidget {
  const FakePoetsAPIs({super.key});

  @override
  State<FakePoetsAPIs> createState() => _FakePoetsAPIsState();
}

class _FakePoetsAPIsState extends State<FakePoetsAPIs> {
  List<FakePoetsModel> fakePoets = [];
  Future<List<FakePoetsModel>> getFakePoets() async {
    final response =
        await http.get(Uri.parse("https://www.freetestapi.com/api/v1/poets"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      fakePoets.clear();
      for (Map<String, dynamic> i in data) {
        fakePoets.add(FakePoetsModel.fromJson(i));
      }
      return fakePoets;
    } else {
      throw Exception('Failed to load poets');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: Text("Fake Poets APIs"),
        centerTitle: true,
        backgroundColor: Colors.indigoAccent,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: getFakePoets(),
                builder: ((context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1 / 1.6,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: fakePoets.length,
                      itemBuilder: ((context, index) {
                        return Container(
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
                            padding: EdgeInsets.all(8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: ((context) =>
                                              FakePoetsDetails(
                                                poets: fakePoets[index],
                                              )),
                                        ),
                                      );
                                    },
                                    child: Hero(
                                      tag:
                                          "${fakePoets[index].id}, ${fakePoets[index].image}",
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          image: DecorationImage(
                                            image: NetworkImage(
                                              "${fakePoets[index].image}",
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "${fakePoets[index].name}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: headingColor,
                                  ),
                                ),
                                Text(
                                  "${fakePoets[index].nationality}",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: descriptionColor,
                                  ),
                                ),
                              ],
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
    );
  }
}
