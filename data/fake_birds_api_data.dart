import 'dart:convert';

import 'package:apis_demo/Fake%20APIs%20Tutorial/Details/fake_birds_api_details.dart';
import 'package:apis_demo/Fake%20APIs%20Tutorial/fake_apis_styles.dart';
import 'package:apis_demo/Fake%20APIs%20Tutorial/models/fake_birds_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FakeBirdsAPIs extends StatefulWidget {
  const FakeBirdsAPIs({super.key});

  @override
  State<FakeBirdsAPIs> createState() => _FakeBirdsAPIsState();
}

class _FakeBirdsAPIsState extends State<FakeBirdsAPIs> {
  List<FakeBirdsModel> fakeBirds = [];
  Future<List<FakeBirdsModel>> getFakeBirds() async {
    final response =
        await http.get(Uri.parse("https://www.freetestapi.com/api/v1/birds"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      fakeBirds.clear();
      for (Map<String, dynamic> i in data) {
        fakeBirds.add(FakeBirdsModel.fromJson(i));
      }
      return fakeBirds;
    } else {
      throw Exception('Failed to load birds');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fake Birds APIs"),
        centerTitle: true,
        backgroundColor: Colors.lightGreenAccent,
      ),
      backgroundColor: bgColor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: getFakeBirds(),
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
                      itemCount: fakeBirds.length,
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
                                              FakeBirdsDetails(
                                                birds: fakeBirds[index],
                                              )),
                                        ),
                                      );
                                    },
                                    child: Hero(
                                      tag:
                                          "${fakeBirds[index].id}, ${fakeBirds[index].image}",
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          image: DecorationImage(
                                            image: NetworkImage(
                                              "${fakeBirds[index].image}",
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
                                  "${fakeBirds[index].name}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: headingColor,
                                  ),
                                ),
                                Text(
                                  "${fakeBirds[index].family}",
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
