import 'dart:convert';

import 'package:apis_demo/Fake%20APIs%20Tutorial/fake_apis_styles.dart';
import 'package:apis_demo/Fake%20APIs%20Tutorial/models/fake_teachers_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FakeTeachersAPIs extends StatefulWidget {
  const FakeTeachersAPIs({super.key});

  @override
  State<FakeTeachersAPIs> createState() => _FakeTeachersAPIsState();
}

class _FakeTeachersAPIsState extends State<FakeTeachersAPIs> {
  List<FakeTeachersModel> fakeTeachers = [];
  Future<List<FakeTeachersModel>> getFakeTeachersAPI() async {
    final response = await http
        .get(Uri.parse("https://www.freetestapi.com/api/v1/teachers"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      fakeTeachers.clear();
      for (Map<String, dynamic> i in data) {
        fakeTeachers.add(FakeTeachersModel.fromJson(i));
      }
      return fakeTeachers;
    } else {
      throw Exception('Failed to load teachers');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fake Teachers APIs"),
        centerTitle: true,
        backgroundColor: Colors.limeAccent,
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: FutureBuilder(
                future: getFakeTeachersAPI(),
                builder: ((context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: fakeTeachers.length,
                      itemBuilder: ((context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(15),
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
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 15,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 200,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          "${fakeTeachers[index].image}",
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text("Teacher's Name", style: heading),
                                  Text(
                                    "${fakeTeachers[index].name}",
                                    style: description,
                                  ),
                                  SizedBox(height: 10),
                                  Text("Teacher's Age", style: heading),
                                  Text(
                                    "${fakeTeachers[index].age.toString()} Years Old",
                                    style: description,
                                  ),
                                  SizedBox(height: 10),
                                  Text("Teacher's Gender", style: heading),
                                  Text(
                                    "${fakeTeachers[index].gender.name}",
                                    style: description,
                                  ),
                                  SizedBox(height: 10),
                                  Text("Teacher's Address", style: heading),
                                  Text(
                                    "Street: ${fakeTeachers[index].address.street}, City: ${fakeTeachers[index].address.city}, Zip: ${fakeTeachers[index].address.zip.toString()}, Country: ${fakeTeachers[index].address.country.name}",
                                    style: description,
                                  ),
                                  SizedBox(height: 10),
                                  Text("Teacher's Email", style: heading),
                                  SizedBox(height: 5),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.email_rounded,
                                        color: Colors.red,
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        "${fakeTeachers[index].email}",
                                        style: description,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Text("Teacher's Phone No", style: heading),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.phone_rounded,
                                        color: Colors.blueAccent,
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        "${fakeTeachers[index].phone.toString()}",
                                        style: description,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Text("Experience", style: heading),
                                  Text(
                                    "${fakeTeachers[index].yearsOfExperience.toString()} Years Of Experience",
                                    style: description,
                                  ),
                                  SizedBox(height: 10),
                                  Text("Subjects", style: heading),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: List.generate(
                                      fakeTeachers[index].subjects.length,
                                      (index) {
                                        return Text(
                                          "• ${fakeTeachers[index].subjects[index]}",
                                          style: description,
                                        );
                                      },
                                    ),
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
            )
          ],
        ),
      ),
    );
  }
}
