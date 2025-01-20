import 'dart:convert';

import 'package:apis_demo/Fake%20APIs%20Tutorial/Details/fake_cars_api_details.dart';
import 'package:apis_demo/Fake%20APIs%20Tutorial/fake_apis_styles.dart';
import 'package:apis_demo/Fake%20APIs%20Tutorial/models/fake_cars_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FakeCarsAPIs extends StatefulWidget {
  const FakeCarsAPIs({super.key});

  @override
  State<FakeCarsAPIs> createState() => _FakeCarsAPIsState();
}

class _FakeCarsAPIsState extends State<FakeCarsAPIs> {
  List<FakeCarsModel> fakeCars = [];
  Future<List<FakeCarsModel>> getFakeCars() async {
    final response =
        await http.get(Uri.parse("https://www.freetestapi.com/api/v1/cars"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      fakeCars.clear();
      for (Map<String, dynamic> i in data) {
        fakeCars.add(FakeCarsModel.fromJson(i));
      }
      return fakeCars;
    } else {
      throw Exception('Failed to load cars');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fake Cars APIs"),
        centerTitle: true,
        backgroundColor: Colors.yellow,
        foregroundColor: Colors.black,
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.bold,
          fontFamily: 'Poppins',
        ),
      ),
      backgroundColor: bgColor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: getFakeCars(),
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
                      itemCount: fakeCars.length,
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
                                              FakeCarsDetails(
                                                cars: fakeCars[index],
                                              )),
                                        ),
                                      );
                                    },
                                    child: Hero(
                                      tag:
                                          "${fakeCars[index].id}, ${fakeCars[index].image}",
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          image: DecorationImage(
                                            image: NetworkImage(
                                              "${fakeCars[index].image}",
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
                                  "${fakeCars[index].model}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: headingColor,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "${fakeCars[index].make}",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: descriptionColor,
                                      ),
                                    ),
                                    Text(
                                      "${fakeCars[index].year.toString()}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                        color: Colors.blue[800],
                                      ),
                                    ),
                                  ],
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
