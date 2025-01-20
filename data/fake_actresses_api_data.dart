import 'dart:convert';

import 'package:apis_demo/Fake%20APIs%20Tutorial/Details/fake_actresses_api_details.dart';
import 'package:apis_demo/Fake%20APIs%20Tutorial/fake_apis_styles.dart';
import 'package:apis_demo/Fake%20APIs%20Tutorial/models/fake_actresses_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FakeActressesAPIs extends StatefulWidget {
  const FakeActressesAPIs({super.key});

  @override
  State<FakeActressesAPIs> createState() => _FakeActressesAPIsState();
}

class _FakeActressesAPIsState extends State<FakeActressesAPIs> {
  List<FakeActressesModel> fakeActresses = [];
  Future<List<FakeActressesModel>> getFakeActresses() async {
    final response = await http
        .get(Uri.parse("https://www.freetestapi.com/api/v1/actresses"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      fakeActresses.clear();
      for (Map<String, dynamic> i in data) {
        fakeActresses.add(FakeActressesModel.fromJson(i));
      }
      return fakeActresses;
    } else {
      throw Exception('Failed to load actresses');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("Fake Actresses APIs"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: getFakeActresses(),
                builder: ((context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1 / 1.7,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: fakeActresses.length,
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
                                              FakeActressesDetails(
                                                actresses: fakeActresses[index],
                                              )),
                                        ),
                                      );
                                    },
                                    child: Hero(
                                      tag: fakeActresses[index].image,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          image: DecorationImage(
                                            image: NetworkImage(
                                              "${fakeActresses[index].image}",
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
                                  "${fakeActresses[index].name}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: headingColor,
                                  ),
                                ),
                                Text(
                                  "${fakeActresses[index].nationality}",
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
