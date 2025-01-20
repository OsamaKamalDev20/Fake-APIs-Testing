import 'package:apis_demo/Fake%20APIs%20Tutorial/custom_widget.dart';
import 'package:apis_demo/Fake%20APIs%20Tutorial/fake_apis_styles.dart';
import 'package:apis_demo/Fake%20APIs%20Tutorial/models/fake_animals_model.dart';
import 'package:flutter/material.dart';

class FakeAnimalsDetails extends StatelessWidget {
  final FakeAnimalsModel animals;
  const FakeAnimalsDetails({super.key, required this.animals});

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
                Image.network(
                  animals.image,
                  height: 250,
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
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${animals.name}", style: heading),
                  Text("${animals.family}", style: description),
                  SizedBox(height: 15),
                  Text("Description", style: heading),
                  SizedBox(height: 5),
                  Text("${animals.description}", style: description),
                  SizedBox(height: 15),
                  Wrap(
                    runSpacing: 15,
                    children: [
                      CustomSpecification(
                        title: "Weight in kg",
                        value: "${animals.weightKg.toStringAsFixed(0)} kg",
                        color: Colors.blue,
                      ),
                      SizedBox(width: 15),
                      CustomSpecification(
                        title: "Height in cm",
                        value: "${animals.heightCm.toStringAsFixed(0)} cm",
                        color: Colors.greenAccent[400],
                      ),
                      CustomSpecification(
                        title: "Places Found",
                        value: "${animals.placeOfFound}.",
                        color: Colors.amber,
                      ),
                      SizedBox(width: 15),
                      CustomSpecification(
                        title: "Diet",
                        value: "${animals.diet.name}",
                        color: Colors.redAccent[700],
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text("Species", style: heading),
                  Text("◉ ${animals.species}.", style: description),
                  SizedBox(height: 10),
                  Text("Habitat", style: heading),
                  Text("◉ ${animals.habitat}.", style: description),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
