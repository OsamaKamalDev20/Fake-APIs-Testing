import 'package:apis_demo/Fake%20APIs%20Tutorial/fake_apis_styles.dart';
import 'package:apis_demo/Fake%20APIs%20Tutorial/models/fake_movies_model.dart';
import 'package:flutter/material.dart';

class FakeMoviesDetails extends StatelessWidget {
  final FakeMoviesModel movie;
  const FakeMoviesDetails({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.network(
                  movie.poster,
                  height: 300,
                  width: double.infinity,
                  fit: BoxFit.cover,
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
                            color: Colors.black,
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
                  Text("${movie.title}", style: heading),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${movie.year}",
                        style: description,
                      ),
                      Text(
                        "${movie.country.name}",
                        style: TextStyle(
                          fontSize: 18,
                          color: headingColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Text(
                    "Plot",
                    style: heading,
                  ),
                  SizedBox(height: 5),
                  Text(
                    "${movie.plot}",
                    style: description,
                  ),
                  SizedBox(height: 15),
                  Text(
                    "Director",
                    style: heading,
                  ),
                  RichText(
                    text: TextSpan(
                      text:
                          "${movie.title} was an ${movie.language.name} movie which was directed by: ",
                      style: TextStyle(
                        fontSize: 14,
                        color: descriptionColor,
                        fontFamily: 'Poppins',
                      ),
                      children: [
                        TextSpan(
                          text: "${movie.director}.",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: headingColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    "Running Time",
                    style: heading,
                  ),
                  Text(
                    "Running time was ${movie.runtime} mins.",
                    style: description,
                  ),
                  SizedBox(height: 15),
                  Text(
                    "Casts",
                    style: heading,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(
                      movie.actors.length,
                      (index) {
                        return Text(
                          "➤ ${movie.actors[index]}.",
                          style: description,
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    "Production",
                    style: heading,
                  ),
                  RichText(
                    text: TextSpan(
                      text: "${movie.title} was produced by ",
                      style: TextStyle(
                        fontSize: 14,
                        color: descriptionColor,
                        fontFamily: 'Poppins',
                      ),
                      children: [
                        TextSpan(
                          text: "${movie.production}.",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: headingColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    "Box Office",
                    style: heading,
                  ),
                  Text(
                    "${movie.title} makes whopping price of ${movie.boxOffice.toString()} in BoxOffice.",
                    style: description,
                  ),
                  SizedBox(height: 15),
                  Text(
                    "Awards 🏆",
                    style: heading,
                  ),
                  Text(
                    "${movie.title} won ${movie.awards}.",
                    style: description,
                  ),
                  SizedBox(height: 15),
                  Text(
                    "Websites 🌐",
                    style: heading,
                  ),
                  RichText(
                    text: TextSpan(
                      text:
                          "Visit the website to watch the details about the movie",
                      style: TextStyle(
                        fontSize: 14,
                        color: descriptionColor,
                        fontFamily: 'Poppins',
                      ),
                      children: [
                        TextSpan(
                          text: "\n ${movie.website}.",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: headingColor,
                          ),
                        ),
                      ],
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
