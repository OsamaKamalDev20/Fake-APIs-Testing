import 'package:apis_demo/Fake%20APIs%20Tutorial/fake_apis_styles.dart';
import 'package:apis_demo/Fake%20APIs%20Tutorial/models/fake_actors_model.dart';
import 'package:flutter/material.dart';

class FakeActorsDetails extends StatelessWidget {
  final FakeActorsModel actors;
  const FakeActorsDetails({super.key, required this.actors});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Hero(
                  tag: actors.image,
                  child: Image.network(
                    actors.image,
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
                        "${actors.name}",
                        style: TextStyle(
                          fontSize: 20,
                          color: headingColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "(${actors.birthYear} - ${actors.deathYear ?? 'Present'})",
                        style: TextStyle(
                          fontSize: 14,
                          color: descriptionColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "${actors.nationality}",
                    style: description,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Biography",
                    style: heading,
                  ),
                  SizedBox(height: 5),
                  Text(
                    "${actors.biography}",
                    style: description,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Known For",
                    style: heading,
                  ),
                  SizedBox(height: 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(
                      actors.knownFor.length,
                      (index) {
                        return Text(
                          "➤ ${actors.knownFor[index]}.",
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(
                      actors.awards.length,
                      (index) {
                        return Text(
                          "➤ ${actors.awards[index]}.",
                          style: description,
                        );
                      },
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
