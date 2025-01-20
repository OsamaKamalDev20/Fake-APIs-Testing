import 'dart:convert';

import 'package:apis_demo/Fake%20APIs%20Tutorial/Details/fake_products_api_details.dart';
import 'package:apis_demo/Fake%20APIs%20Tutorial/fake_apis_styles.dart';
import 'package:apis_demo/Fake%20APIs%20Tutorial/models/fake_products_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FakeProductsAPIs extends StatefulWidget {
  const FakeProductsAPIs({super.key});

  @override
  State<FakeProductsAPIs> createState() => _FakeProductsAPIsState();
}

class _FakeProductsAPIsState extends State<FakeProductsAPIs> {
  List<FakeProductsModel> fakeProducts = [];
  Future<List<FakeProductsModel>> getFakeProducts() async {
    final response = await http
        .get(Uri.parse("https://www.freetestapi.com/api/v1/products"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      fakeProducts.clear();
      for (Map<String, dynamic> i in data) {
        fakeProducts.add(FakeProductsModel.fromJson(i));
      }
      return fakeProducts;
    } else {
      throw Exception('Failed to load products');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Text("Fake Products APIs"),
      ),
      backgroundColor: bgColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Expanded(
                child: FutureBuilder(
                  future: getFakeProducts(),
                  builder: ((context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return ListView.builder(
                        itemCount: fakeProducts.length,
                        itemBuilder: ((context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(vertical: 15),
                            child: Material(
                              elevation: 4,
                              borderRadius: BorderRadius.circular(12),
                              child: Container(
                                height: 300,
                                decoration: BoxDecoration(
                                  color: cardColor,
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 1,
                                      spreadRadius: 1,
                                      color: Colors.black.withOpacity(.3),
                                      offset: Offset(1, 1),
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: ((context) =>
                                                    FakeProductsDetails(
                                                      products:
                                                          fakeProducts[index],
                                                    )),
                                              ),
                                            );
                                          },
                                          child: Hero(
                                            tag: "${fakeProducts[index].image}",
                                            child: Container(
                                              height: 200,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                image: DecorationImage(
                                                  image: NetworkImage(
                                                    "${fakeProducts[index].image}",
                                                  ),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        "${fakeProducts[index].name}",
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
                                            "${fakeProducts[index].brand}",
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: descriptionColor,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Icon(Icons.star_rounded,
                                                  color: Colors.amber,
                                                  size: 24),
                                              Text(
                                                "${fakeProducts[index].rating.toString()}",
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
