import 'dart:convert';

import 'package:apis_demo/Fake%20APIs%20Tutorial/Details/fake_movies_api_details.dart';
import 'package:apis_demo/Fake%20APIs%20Tutorial/fake_apis_styles.dart';
import 'package:flutter/material.dart';
import '../models/fake_movies_model.dart';
import 'package:http/http.dart' as http;

class FakeMoviesAPIs extends StatefulWidget {
  const FakeMoviesAPIs({super.key});

  @override
  State<FakeMoviesAPIs> createState() => _FakeMoviesAPIsState();
}

class _FakeMoviesAPIsState extends State<FakeMoviesAPIs> {
  List<FakeMoviesModel> fakeMovies = [];
  Future<List<FakeMoviesModel>> getFakeMovies() async {
    final response =
        await http.get(Uri.parse("https://www.freetestapi.com/api/v1/movies"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      fakeMovies.clear();
      for (Map<String, dynamic> i in data) {
        fakeMovies.add(FakeMoviesModel.fromJson(i));
      }
      return fakeMovies;
    } else {
      throw Exception('Failed to load movies');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text("Fake Movies APIs"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Expanded(
                child: FutureBuilder(
                  future: getFakeMovies(),
                  builder: ((context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return ListView.builder(
                        itemCount: fakeMovies.length,
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
                                padding: const EdgeInsets.all(10),
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
                                                  FakeMoviesDetails(
                                                    movie: fakeMovies[index],
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
                                                "${fakeMovies[index].poster}",
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      "${fakeMovies[index].title}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: headingColor,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: List.generate(
                                            fakeMovies[index].genre.length,
                                            (index) {
                                              return Text(
                                                " ${fakeMovies[index].genre.first}",
                                                style: description,
                                              );
                                            },
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Icon(Icons.star_rounded,
                                                color: Colors.amber, size: 24),
                                            Text(
                                              "${fakeMovies[index].rating.toString()}",
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
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
