import 'dart:convert';

import 'package:apis_demo/Fake%20APIs%20Tutorial/Details/fake_actors_api_details.dart';
import 'package:apis_demo/Fake%20APIs%20Tutorial/fake_apis_styles.dart';
import 'package:apis_demo/Fake%20APIs%20Tutorial/models/fake_actors_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FakeActorsAPI extends StatefulWidget {
  const FakeActorsAPI({super.key});

  @override
  State<FakeActorsAPI> createState() => _FakeActorsAPIState();
}

class _FakeActorsAPIState extends State<FakeActorsAPI> {
  List<FakeActorsModel> fakeActors = [];
  Future<List<FakeActorsModel>> getFakeActors() async {
    final response =
        await http.get(Uri.parse("https://www.freetestapi.com/api/v1/actors"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      fakeActors.clear();
      for (Map<String, dynamic> i in data) {
        fakeActors.add(FakeActorsModel.fromJson(i));
      }
      return fakeActors;
    } else {
      throw Exception('Failed to load actors');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Fake Actors APIs"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: getFakeActors(),
                builder: ((context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else
                    return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1 / 1.6,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: fakeActors.length,
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
                                              FakeActorsDetails(
                                                actors: fakeActors[index],
                                              )),
                                        ),
                                      );
                                    },
                                    child: Hero(
                                      tag: fakeActors[index].image,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          image: DecorationImage(
                                            image: NetworkImage(
                                              "${fakeActors[index].image}",
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
                                  "${fakeActors[index].name}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: headingColor,
                                  ),
                                ),
                                Text(
                                  "${fakeActors[index].nationality}",
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
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
