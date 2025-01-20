import 'package:apis_demo/Fake%20APIs%20Tutorial/custom_widget.dart';
import 'package:apis_demo/Fake%20APIs%20Tutorial/fake_apis_styles.dart';
import 'package:apis_demo/Fake%20APIs%20Tutorial/models/fake_dogs_model.dart';
import 'package:flutter/material.dart';

class FakeDogsDetails extends StatelessWidget {
  final FakeDogsModel dogs;
  const FakeDogsDetails({super.key, required this.dogs});

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
                  tag: "${dogs.id}, ${dogs.image}",
                  child: Image.network(
                    dogs.image,
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
                            "${dogs.name}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: headingColor,
                            ),
                          ),
                          Text(
                            "${dogs.breedGroup}",
                            style: TextStyle(
                              fontSize: 14,
                              color: descriptionColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "${dogs.origin}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.blueAccent[700],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text("Description", style: heading),
                  SizedBox(height: 5),
                  Text(
                    "${dogs.description}",
                    style: TextStyle(
                      fontSize: 14,
                      color: descriptionColor,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text("Qualities", style: heading),
                  Wrap(
                    runSpacing: 15,
                    spacing: 10,
                    children: [
                      CustomSpecification(
                        title: "LifeSpan",
                        value: "${dogs.lifespan}",
                        color: Colors.blueAccent[700],
                      ),
                      CustomSpecification(
                        title: "Size",
                        value: "${dogs.size}",
                        color: Colors.redAccent[700],
                      ),
                      CustomSpecification(
                        title: "Temperament",
                        value: "${dogs.temperament}",
                        color: Colors.greenAccent[700],
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text("Colors", style: heading),
                  SizedBox(height: 10),
                  Wrap(
                    runSpacing: 15,
                    spacing: 10,
                    children: List.generate(
                      dogs.colors.length,
                      (index) {
                        return Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                          decoration: BoxDecoration(
                            color: Colors.deepOrange.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.deepOrange.withOpacity(.3),
                              width: 1,
                            ),
                          ),
                          child: Text(
                            "${dogs.colors[index]}",
                            style: TextStyle(
                              color: Colors.deepOrange,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
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
