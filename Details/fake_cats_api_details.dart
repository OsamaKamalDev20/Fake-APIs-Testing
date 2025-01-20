import 'package:apis_demo/Fake%20APIs%20Tutorial/models/fake_cats_model.dart';
import 'package:flutter/material.dart';

import '../fake_apis_styles.dart';

class FakeCatsDetails extends StatelessWidget {
  final FakeCatsModel cats;
  const FakeCatsDetails({super.key, required this.cats});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Hero(
                  tag: "${cats.id}, ${cats.image}",
                  child: Image.network(
                    cats.image,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${cats.name}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: headingColor,
                        ),
                      ),
                      Text(
                        "${cats.temperament}",
                        style: TextStyle(
                          fontSize: 14,
                          color: descriptionColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text("Description", style: heading),
                  SizedBox(height: 5),
                  Text(
                    "${cats.description}",
                    style: TextStyle(
                      fontSize: 14,
                      color: descriptionColor,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text("Colors", style: heading),
                  SizedBox(height: 10),
                  Wrap(
                    runSpacing: 15,
                    spacing: 10,
                    children: List.generate(
                      cats.colors.length,
                      (index) {
                        return Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                          decoration: BoxDecoration(
                            color: Colors.pinkAccent.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.pinkAccent.withOpacity(.3),
                              width: 1,
                            ),
                          ),
                          child: Text(
                            "${cats.colors[index]}",
                            style: TextStyle(
                              color: Colors.pinkAccent,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 10),
                  Text("Origin", style: heading),
                  SizedBox(height: 5),
                  Text(
                    "${cats.origin}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.blueAccent[700],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
