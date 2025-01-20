import 'dart:convert';

import 'package:apis_demo/Fake%20APIs%20Tutorial/Details/fake_cats_api_details.dart';
import 'package:apis_demo/Fake%20APIs%20Tutorial/fake_apis_styles.dart';
import 'package:apis_demo/Fake%20APIs%20Tutorial/models/fake_cats_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FakeCatsAPIs extends StatefulWidget {
  const FakeCatsAPIs({super.key});

  @override
  State<FakeCatsAPIs> createState() => _FakeCatsAPIsState();
}

class _FakeCatsAPIsState extends State<FakeCatsAPIs> {
  List<FakeCatsModel> fakeCats = [];
  Future<List<FakeCatsModel>> getFakeCats() async {
    final response =
        await http.get(Uri.parse("https://www.freetestapi.com/api/v1/cats"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      fakeCats.clear();
      for (Map<String, dynamic> i in data) {
        fakeCats.add(FakeCatsModel.fromJson(i));
      }
      return fakeCats;
    } else {
      throw Exception('Failed to load cats');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fake Cats APIs"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      backgroundColor: bgColor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: getFakeCats(),
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
                      itemCount: fakeCats.length,
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
                            padding: const EdgeInsets.all(8),
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
                                              FakeCatsDetails(
                                                cats: fakeCats[index],
                                              )),
                                        ),
                                      );
                                    },
                                    child: Hero(
                                      tag:
                                          "${fakeCats[index].id}, ${fakeCats[index].image}",
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          image: DecorationImage(
                                            image: NetworkImage(
                                              "${fakeCats[index].image}",
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
                                  "${fakeCats[index].name}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: headingColor,
                                  ),
                                ),
                                Text(
                                  "${fakeCats[index].origin}",
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
