import 'dart:convert';

import 'package:apis_demo/Fake%20APIs%20Tutorial/Details/fake_languages_api_details.dart';
import 'package:apis_demo/Fake%20APIs%20Tutorial/fake_apis_styles.dart';
import 'package:apis_demo/Fake%20APIs%20Tutorial/models/fake_languages_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FakeLanguagesAPIs extends StatefulWidget {
  const FakeLanguagesAPIs({super.key});

  @override
  State<FakeLanguagesAPIs> createState() => _FakeLanguagesAPIsState();
}

class _FakeLanguagesAPIsState extends State<FakeLanguagesAPIs> {
  List<FakeLanguagesModel> fakeLanguages = [];
  Future<List<FakeLanguagesModel>> getFakeLanguages() async {
    final response = await http
        .get(Uri.parse("https://www.freetestapi.com/api/v1/languages"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      fakeLanguages.clear();
      for (Map<String, dynamic> i in data) {
        fakeLanguages.add(FakeLanguagesModel.fromJson(i));
      }
      return fakeLanguages;
    } else {
      throw Exception('Failed to load languages');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("Fake Languages APIs"),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: FutureBuilder(
                future: getFakeLanguages(),
                builder: ((context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else
                    return ListView.builder(
                      itemCount: fakeLanguages.length,
                      itemBuilder: ((context, index) {
                        return Padding(
                          padding: EdgeInsets.all(10),
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
                              padding: EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 8,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ListTile(
                                    leading: Container(
                                      width: 55,
                                      height: 55,
                                      decoration: BoxDecoration(
                                        color: Colors.purple.withOpacity(.2),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Center(
                                        child: Text(
                                          "${fakeLanguages[index].languageCode}",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: Colors.purple,
                                          ),
                                        ),
                                      ),
                                    ),
                                    title: Text(
                                      "${fakeLanguages[index].name}",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    subtitle: Text(
                                      "${fakeLanguages[index].region}",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: descriptionColor,
                                      ),
                                    ),
                                    trailing: IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: ((context) =>
                                                FakeLanguagesDetails(
                                                  languages:
                                                      fakeLanguages[index],
                                                )),
                                          ),
                                        );
                                      },
                                      icon: Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        size: 16,
                                      ),
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
