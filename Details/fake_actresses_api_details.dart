import 'package:apis_demo/Fake%20APIs%20Tutorial/fake_apis_styles.dart';
import 'package:apis_demo/Fake%20APIs%20Tutorial/models/fake_actresses_model.dart';
import 'package:flutter/material.dart';

class FakeActressesDetails extends StatelessWidget {
  final FakeActressesModel actresses;
  const FakeActressesDetails({super.key, required this.actresses});

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
                  tag: actresses.image,
                  child: Image.network(
                    actresses.image,
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
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${actresses.name}",
                        style: TextStyle(
                          fontSize: 20,
                          color: headingColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "(${actresses.birthYear} - ${actresses.deathYear ?? 'Present'})",
                        style: TextStyle(
                          fontSize: 14,
                          color: descriptionColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "${actresses.nationality}",
                    style: description,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Biography",
                    style: heading,
                  ),
                  SizedBox(height: 5),
                  Text(
                    "${actresses.biography}",
                    style: description,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Most Famous Movies",
                    style: heading,
                  ),
                  SizedBox(height: 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(
                      actresses.mostFamousMovies.length,
                      (index) {
                        return Text(
                          "➤ ${actresses.mostFamousMovies[index]}.",
                          style: description,
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Awards 🏆",
                    style: heading,
                  ),
                  SizedBox(height: 5),
                  Text(
                    "◉ ${actresses.awards}.",
                    style: description,
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
