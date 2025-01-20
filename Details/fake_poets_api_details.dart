import 'package:apis_demo/Fake%20APIs%20Tutorial/fake_apis_styles.dart';
import 'package:apis_demo/Fake%20APIs%20Tutorial/models/fake_poets_model.dart';
import 'package:flutter/material.dart';

class FakePoetsDetails extends StatelessWidget {
  final FakePoetsModel poets;
  const FakePoetsDetails({super.key, required this.poets});

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
                  tag: "${poets.id}, ${poets.image}",
                  child: Image.network(
                    poets.image,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${poets.name}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: headingColor,
                        ),
                      ),
                      Text(
                        "(${poets.birthYear} - ${poets.deathYear ?? 'Present'})",
                        style: TextStyle(
                          fontSize: 14,
                          color: descriptionColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "${poets.nationality}",
                    style: description,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Biography",
                    style: heading,
                  ),
                  SizedBox(height: 5),
                  Text(
                    "${poets.biography}",
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
                      poets.notableWorks.length,
                      (index) {
                        return Text(
                          "➤ ${poets.notableWorks[index]}.",
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
                      poets.genre.length,
                      (index) {
                        return Text(
                          "➤ ${poets.genre[index]}.",
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
                    "${poets.award}.",
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
