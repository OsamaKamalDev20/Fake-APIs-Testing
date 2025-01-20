import 'dart:convert';
import 'package:apis_demo/Fake%20APIs%20Tutorial/fake_apis_styles.dart';
import 'package:apis_demo/Fake%20APIs%20Tutorial/models/fake_users_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FakeUserAPI extends StatefulWidget {
  const FakeUserAPI({super.key});

  @override
  State<FakeUserAPI> createState() => _FakeUserAPIState();
}

class _FakeUserAPIState extends State<FakeUserAPI> {
  List<FakeUsersModel> fakeUsers = [];
  Future<List<FakeUsersModel>> getFakeUserAPI() async {
    final response =
        await http.get(Uri.parse("https://www.freetestapi.com/api/v1/users"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      fakeUsers.clear();
      for (Map<String, dynamic> i in data) {
        fakeUsers.add(FakeUsersModel.fromJson(i));
      }
      return fakeUsers;
    } else {
      throw Exception('Failed to load users');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Fake User APIs"),
      ),
      backgroundColor: bgColor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: getFakeUserAPI(),
                builder: ((context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else
                    return ListView.builder(
                      itemCount: fakeUsers.length,
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
                              child: Stack(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Name", style: heading),
                                      SizedBox(height: 5),
                                      Text(
                                        "${fakeUsers[index].name}",
                                        style: description,
                                      ),
                                      SizedBox(height: 15),
                                      Text("Age", style: heading),
                                      SizedBox(height: 5),
                                      Text(
                                        "${fakeUsers[index].age.toString()} Years old.",
                                        style: description,
                                      ),
                                      SizedBox(height: 15),
                                      Text("User Name", style: heading),
                                      SizedBox(height: 5),
                                      Text(
                                        "${fakeUsers[index].username}",
                                        style: description,
                                      ),
                                      SizedBox(height: 15),
                                      Text("Email", style: heading),
                                      SizedBox(height: 5),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.email_rounded,
                                            color: Colors.red,
                                          ),
                                          SizedBox(width: 5),
                                          Text(
                                            "${fakeUsers[index].email}",
                                            style: description,
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 15),
                                      Text("Address", style: heading),
                                      SizedBox(height: 5),
                                      Text(
                                        "Street: ${fakeUsers[index].address.street}, City: ${fakeUsers[index].address.city.name}, Zip Code: ${fakeUsers[index].address.zip.toString()},",
                                        style: description,
                                      ),
                                      SizedBox(height: 15),
                                      Text("Websites 🌐", style: heading),
                                      SizedBox(width: 5),
                                      Text(
                                        "${fakeUsers[index].website}",
                                        style: description,
                                      ),
                                      SizedBox(height: 15),
                                      Text("Occupation", style: heading),
                                      SizedBox(height: 5),
                                      Text(
                                        "${fakeUsers[index].occupation}",
                                        style: description,
                                      ),
                                      SizedBox(height: 15),
                                      Text("Hobbies", style: heading),
                                      SizedBox(height: 5),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: List.generate(
                                          fakeUsers[index].hobbies.length,
                                          (index) {
                                            return Text(
                                              "- ${fakeUsers[index].hobbies[index]}",
                                              style: description,
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  Positioned(
                                    right: 5,
                                    child: Container(
                                      width: 30,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        color: Colors.blue[700],
                                        shape: BoxShape.circle,
                                      ),
                                      child: Center(
                                        child: Text(
                                          "${fakeUsers[index].id}",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            color: Colors.white,
                                          ),
                                        ),
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
