import 'package:apis_demo/Fake%20APIs%20Tutorial/custom_Widget.dart';
import 'package:apis_demo/Fake%20APIs%20Tutorial/fake_apis_styles.dart';
import 'package:apis_demo/Fake%20APIs%20Tutorial/models/fake_birds_model.dart';
import 'package:flutter/material.dart';

class FakeBirdsDetails extends StatelessWidget {
  final FakeBirdsModel birds;
  const FakeBirdsDetails({super.key, required this.birds});

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
                  tag: "${birds.id}, ${birds.image}",
                  child: Image.network(
                    birds.image,
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${birds.name}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: headingColor,
                            ),
                          ),
                          Text(
                            "${birds.species}",
                            style: TextStyle(
                              fontSize: 14,
                              color: descriptionColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text("Description", style: heading),
                  SizedBox(height: 5),
                  Text(
                    "${birds.description}",
                    style: TextStyle(
                      fontSize: 14,
                      color: descriptionColor,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text("Details", style: heading),
                  Wrap(
                    runSpacing: 15,
                    spacing: 10,
                    children: [
                      CustomSpecification(
                        title: "Habitat",
                        value: "${birds.habitat}",
                        color: Colors.amberAccent[700],
                      ),
                      if (birds.wingspanCm != null)
                        CustomSpecification(
                          title: "WingSpan",
                          value: "${birds.wingspanCm} cm",
                          color: Colors.blueAccent[700],
                        ),
                      CustomSpecification(
                        title: "Weight",
                        value: "${birds.weightKg.toStringAsFixed(1)} kg",
                        color: Colors.redAccent[700],
                      ),
                      if (birds.heightCm != null)
                        CustomSpecification(
                          title: "Height",
                          value: "${birds.heightCm} cm",
                          color: Colors.pinkAccent,
                        ),
                      CustomSpecification(
                        title: "Diet",
                        value: "${birds.diet}",
                        color: Colors.greenAccent[700],
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text("Places of Found", style: heading),
                  SizedBox(height: 5),
                  Text(
                    "${birds.placeOfFound}",
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
