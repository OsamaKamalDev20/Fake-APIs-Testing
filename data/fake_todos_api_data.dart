import 'dart:convert';

import 'package:apis_demo/Fake%20APIs%20Tutorial/fake_apis_styles.dart';
import 'package:apis_demo/Fake%20APIs%20Tutorial/models/fake_todos_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FakeTodosAPIs extends StatefulWidget {
  const FakeTodosAPIs({super.key});

  @override
  State<FakeTodosAPIs> createState() => _FakeTodosAPIsState();
}

class _FakeTodosAPIsState extends State<FakeTodosAPIs> {
  List<FakeTodosModel> fakeTodos = [];
  Future<List<FakeTodosModel>> getFakePosts() async {
    final response =
        await http.get(Uri.parse("https://www.freetestapi.com/api/v1/todos"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      fakeTodos.clear();
      for (Map<String, dynamic> i in data) {
        fakeTodos.add(FakeTodosModel.fromJson(i));
      }
      return fakeTodos;
    } else {
      throw Exception('Failed to load todos');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: Text("Fake Todos Testing"),
        centerTitle: true,
        backgroundColor: Colors.deepOrangeAccent[400],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: FutureBuilder(
                future: getFakePosts(),
                builder: ((context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else
                    return ListView.builder(
                      itemCount: fakeTodos.length,
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
                                  Text(
                                    "${fakeTodos[index].title}",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: headingColor,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    "${fakeTodos[index].description}",
                                    style: description,
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    "Priority: ${fakeTodos[index].priority.name}",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: headingColor,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Container(
                                    padding: EdgeInsets.all(6),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      color: fakeTodos[index].completed
                                          ? Color(0xff14a44d)
                                          : Color(0xffbb2124),
                                    ),
                                    child: Text(
                                      "${fakeTodos[index].completed}",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w800,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: Text(
                                      "Due Date: ${fakeTodos[index].dueDate.toLocal().toString().split(' ')[0]}",
                                      style: TextStyle(
                                        color: Colors.deepOrangeAccent[400],
                                        fontSize: 16,
                                        fontWeight: FontWeight.w800,
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
