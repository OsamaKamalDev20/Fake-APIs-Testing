import 'dart:convert';

import 'package:apis_demo/Fake%20APIs%20Tutorial/Details/fake_books_api_details.dart';
import 'package:apis_demo/Fake%20APIs%20Tutorial/fake_apis_styles.dart';
import 'package:apis_demo/Fake%20APIs%20Tutorial/models/fake_books_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FakeBooksAPIs extends StatefulWidget {
  const FakeBooksAPIs({super.key});

  @override
  State<FakeBooksAPIs> createState() => _FakeBooksAPIsState();
}

class _FakeBooksAPIsState extends State<FakeBooksAPIs> {
  // List to store books
  List<FakeBooksModel> fakeBooks = [];
  // Fetching books from API
  Future<List<FakeBooksModel>> getFakeBooks() async {
    final response =
        await http.get(Uri.parse("https://www.freetestapi.com/api/v1/books"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      fakeBooks.clear(); // Clear list before adding new data
      for (Map<String, dynamic> i in data) {
        fakeBooks.add(FakeBooksModel.fromJson(i));
      }
      return fakeBooks;
    } else {
      throw Exception('Failed to load books');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text("Fake Books APIs"),
      ),
      body: FutureBuilder(
        future: getFakeBooks(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemCount: fakeBooks.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
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
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: ((context) => FakeBookDetails(
                                          books: fakeBooks[index],
                                        )),
                                  ),
                                );
                              },
                              child: Container(
                                height: 200,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      "${fakeBooks[index].coverImage}",
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "${fakeBooks[index].title}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: headingColor,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "${fakeBooks[index].author}",
                                style: description,
                              ),
                              Text(
                                "${fakeBooks[index].publicationYear}",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: headingColor,
                                  fontWeight: FontWeight.w600,
                                ),
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
    );
  }
}
