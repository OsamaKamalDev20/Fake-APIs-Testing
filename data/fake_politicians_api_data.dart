import 'dart:convert';

import 'package:apis_demo/Fake%20APIs%20Tutorial/Details/fake_politicians_api_details.dart';
import 'package:apis_demo/Fake%20APIs%20Tutorial/fake_apis_styles.dart';
import 'package:apis_demo/Fake%20APIs%20Tutorial/models/fake_politicians_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FakePoliticiansAPIs extends StatefulWidget {
  const FakePoliticiansAPIs({super.key});

  @override
  State<FakePoliticiansAPIs> createState() => _FakePoliticiansAPIsState();
}

class _FakePoliticiansAPIsState extends State<FakePoliticiansAPIs> {
  List<FakePoliticianModel> fakePoliticians = [];
  Future<List<FakePoliticianModel>> getFakePoliticians() async {
    final response = await http
        .get(Uri.parse("https://www.freetestapi.com/api/v1/politicians"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      fakePoliticians.clear();
      for (Map<String, dynamic> i in data) {
        fakePoliticians.add(FakePoliticianModel.fromJson(i));
      }
      return fakePoliticians;
    } else {
      throw Exception('Failed to load politicians');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: Text("Fake Politicians APIs"),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent[700],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: getFakePoliticians(),
                builder: ((context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else
                    return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.5,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: fakePoliticians.length,
                      itemBuilder: ((context, index) {
                        return Material(
                          elevation: 5,
                          borderRadius: BorderRadius.circular(8),
                          child: Container(
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
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: ((context) =>
                                                  FakePoliticiansDetails(
                                                    politicians:
                                                        fakePoliticians[index],
                                                  )),
                                            ),
                                          );
                                        },
                                        child: Hero(
                                          tag: fakePoliticians[index].image,
                                          child: Image.network(
                                            "${fakePoliticians[index].image}",
                                            fit: BoxFit.cover,
                                            errorBuilder:
                                                ((context, error, stackTrace) {
                                              return Image.network(
                                                "https://rfkhumanrights.org/wp-content/uploads/2023/12/President-of-Ukraine-e1717448862735.jpeg",
                                                fit: BoxFit.cover,
                                              );
                                            }),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    "${fakePoliticians[index].name}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: headingColor,
                                    ),
                                  ),
                                  Text(
                                    "${fakePoliticians[index].country}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15,
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
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
