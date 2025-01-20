import 'package:apis_demo/Fake%20APIs%20Tutorial/fake_apis_styles.dart';
import 'package:apis_demo/Fake%20APIs%20Tutorial/models/fake_authors_model.dart';
import 'package:flutter/material.dart';

class FakeAuthorsDetails extends StatelessWidget {
  final FakeAuthorsModel authors;
  const FakeAuthorsDetails({super.key, required this.authors});

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
                  tag: "${authors.id}, ${authors.image}",
                  child: Image.network(
                    authors.image,
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
                        "${authors.name}",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: headingColor,
                        ),
                      ),
                      Text(
                        "(${authors.birthYear} - ${authors.deathYear ?? 'Present'})",
                        style: TextStyle(
                          fontSize: 14,
                          color: descriptionColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "${authors.nationality}",
                    style: description,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Biography",
                    style: heading,
                  ),
                  SizedBox(height: 5),
                  Text(
                    "${authors.biography}",
                    style: description,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Famous Novels",
                    style: heading,
                  ),
                  SizedBox(height: 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(
                      authors.notableWorks.length,
                      (index) {
                        return Text(
                          "➤ ${authors.notableWorks[index]}.",
                          style: description,
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Genre",
                    style: heading,
                  ),
                  SizedBox(height: 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(
                      authors.genre.length,
                      (index) {
                        return Text(
                          "➤ ${authors.genre[index]}.",
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
                    "${authors.award}.",
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
