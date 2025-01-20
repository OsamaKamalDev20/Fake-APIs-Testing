import 'dart:convert';

import 'package:apis_demo/Fake%20APIs%20Tutorial/fake_apis_styles.dart';
import 'package:apis_demo/Fake%20APIs%20Tutorial/models/fake_students_model.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class FakeStudentsAPIs extends StatefulWidget {
  const FakeStudentsAPIs({super.key});

  @override
  State<FakeStudentsAPIs> createState() => _FakeStudentsAPIsState();
}

class _FakeStudentsAPIsState extends State<FakeStudentsAPIs> {
  List<FakeStudentsModel> fakeStudents = [];
  Future<List<FakeStudentsModel>> getFakeStudentAPI() async {
    final response = await http
        .get(Uri.parse("https://www.freetestapi.com/api/v1/students"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      fakeStudents.clear();
      for (Map<String, dynamic> i in data) {
        fakeStudents.add(FakeStudentsModel.fromJson(i));
      }
      return fakeStudents;
    } else {
      throw Exception('Failed to load students');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fake Students APIs"),
        centerTitle: true,
        backgroundColor: Colors.brown,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: getFakeStudentAPI(),
                builder: ((context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: fakeStudents.length,
                      itemBuilder: ((context, index) {
                        return Padding(
                          padding: EdgeInsets.all(15),
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
                                          "${fakeStudents[index].image}",
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text("Name", style: heading),
                                  Text(
                                    "${fakeStudents[index].name}",
                                    style: description,
                                  ),
                                  SizedBox(height: 10),
                                  Text("Age", style: heading),
                                  Text(
                                    "${fakeStudents[index].age.toString()} Years Old",
                                    style: description,
                                  ),
                                  SizedBox(height: 10),
                                  Text("Gender", style: heading),
                                  Text(
                                    "${fakeStudents[index].gender.name}",
                                    style: description,
                                  ),
                                  SizedBox(height: 10),
                                  Text("Address", style: heading),
                                  Text(
                                    "Street: ${fakeStudents[index].address.street}, City: ${fakeStudents[index].address.city}, Zip: ${fakeStudents[index].address.zip.toString()}, Country: ${fakeStudents[index].address.country.name}",
                                    style: description,
                                  ),
                                  SizedBox(height: 10),
                                  Text("Email", style: heading),
                                  SizedBox(height: 5),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.email_rounded,
                                        color: Colors.red,
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        "${fakeStudents[index].email}",
                                        style: description,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Text("GPA", style: heading),
                                  Text(
                                    "${fakeStudents[index].gpa.toStringAsFixed(1)}",
                                    style: description,
                                  ),
                                  SizedBox(height: 10),
                                  Text("Phone No", style: heading),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.phone_rounded,
                                        color: Colors.blueAccent,
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        "${fakeStudents[index].phone.toString()}",
                                        style: description,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Text("Courses", style: heading),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: List.generate(
                                      fakeStudents[index].courses.length,
                                      (index) {
                                        return Text(
                                          "• ${fakeStudents[index].courses[index]}",
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
