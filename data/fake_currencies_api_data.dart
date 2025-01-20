import 'dart:convert';

import 'package:apis_demo/Fake%20APIs%20Tutorial/Details/fake_currencies_api_details.dart';
import 'package:apis_demo/Fake%20APIs%20Tutorial/custom_widget.dart';
import 'package:apis_demo/Fake%20APIs%20Tutorial/fake_apis_styles.dart';
import 'package:apis_demo/Fake%20APIs%20Tutorial/models/fake_currencies_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FakeCurrenciesAPIs extends StatefulWidget {
  const FakeCurrenciesAPIs({super.key});

  @override
  State<FakeCurrenciesAPIs> createState() => _FakeCurrenciesAPIsState();
}

class _FakeCurrenciesAPIsState extends State<FakeCurrenciesAPIs> {
  List<FakeCurrenciesModel> fakeCurrencies = [];
  Future<List<FakeCurrenciesModel>> getCurrencies() async {
    final response = await http
        .get(Uri.parse("https://www.freetestapi.com/api/v1/currencies"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      fakeCurrencies.clear();
      for (Map<String, dynamic> i in data) {
        fakeCurrencies.add(FakeCurrenciesModel.fromJson(i));
      }
      return fakeCurrencies;
    } else {
      throw Exception('Failed to load currencies');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: Text("Fake Currencies APIs"),
        centerTitle: true,
        backgroundColor: Colors.pink,
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: getCurrencies(),
                builder: ((context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: fakeCurrencies.length,
                      itemBuilder: ((context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          child: Container(
                            height: 327,
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
                              child: Stack(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: ((context) =>
                                                  FakeCurrenciesDetails(
                                                    currencies:
                                                        fakeCurrencies[index],
                                                  )),
                                            ),
                                          );
                                        },
                                        child: Container(
                                          height: 150,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                "${fakeCurrencies[index].image}",
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        "${fakeCurrencies[index].name}",
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: headingColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "${fakeCurrencies[index].code}",
                                        style: description,
                                      ),
                                      Row(
                                        children: [
                                          CustomSpecification(
                                            title: "Exchange Rate",
                                            value:
                                                "${fakeCurrencies[index].exchangeRate.toStringAsFixed(2)}",
                                            color: Colors.red,
                                          ),
                                          SizedBox(width: 15),
                                          CustomSpecification(
                                            title: "Symbol",
                                            value:
                                                "${fakeCurrencies[index].symbol}",
                                            color: Colors.lightBlue,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Positioned(
                                    bottom: 5,
                                    right: 5,
                                    child: Container(
                                      width: 30,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        color: Colors.redAccent[700],
                                        shape: BoxShape.circle,
                                      ),
                                      child: Center(
                                        child: Text(
                                          "${fakeCurrencies[index].id}",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
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
