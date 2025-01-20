import 'dart:convert';

import 'package:apis_demo/Fake%20APIs%20Tutorial/Details/fake_authors_api_details.dart';
import 'package:apis_demo/Fake%20APIs%20Tutorial/fake_apis_styles.dart';
import 'package:apis_demo/Fake%20APIs%20Tutorial/models/fake_authors_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FakeAuthorsAPIs extends StatefulWidget {
  const FakeAuthorsAPIs({super.key});

  @override
  State<FakeAuthorsAPIs> createState() => _FakeAuthorsAPIsState();
}

class _FakeAuthorsAPIsState extends State<FakeAuthorsAPIs> {
  List<FakeAuthorsModel> fakeAuthors = [];
  Future<List<FakeAuthorsModel>> getFakeAuthors() async {
    final response =
        await http.get(Uri.parse("https://www.freetestapi.com/api/v1/authors"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      fakeAuthors.clear();
      for (Map<String, dynamic> i in data) {
        fakeAuthors.add(FakeAuthorsModel.fromJson(i));
      }
      return fakeAuthors;
    } else {
      throw Exception('Failed to load authors');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Fake Authors APIs"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: getFakeAuthors(),
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
                      itemCount: fakeAuthors.length,
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
                                              FakeAuthorsDetails(
                                                authors: fakeAuthors[index],
                                              )),
                                        ),
                                      );
                                    },
                                    child: Hero(
                                      tag:
                                          "${fakeAuthors[index].id}, ${fakeAuthors[index].image}",
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          image: DecorationImage(
                                            image: NetworkImage(
                                              "${fakeAuthors[index].image}",
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
                                  "${fakeAuthors[index].name}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: headingColor,
                                  ),
                                ),
                                Text(
                                  "${fakeAuthors[index].nationality}",
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
