import 'package:apis_demo/Fake%20APIs%20Tutorial/custom_features.dart';
import 'package:apis_demo/Fake%20APIs%20Tutorial/fake_apis_styles.dart';
import 'package:apis_demo/Fake%20APIs%20Tutorial/models/fake_cars_model.dart';
import 'package:flutter/material.dart';

class FakeCarsDetails extends StatelessWidget {
  final FakeCarsModel cars;
  const FakeCarsDetails({super.key, required this.cars});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Hero(
                  tag: "${cars.id}, ${cars.image}",
                  child: Image.network(
                    cars.image,
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
                            color: Colors.grey,
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
                            "${cars.model}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: headingColor,
                            ),
                          ),
                          Text(
                            "${cars.make}",
                            style: TextStyle(
                              fontSize: 14,
                              color: descriptionColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "\$${cars.price}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.redAccent[700],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text("Specifications", style: heading),
                  SizedBox(height: 15),
                  Wrap(
                    runSpacing: 15,
                    children: [
                      CustomFeatures(
                        image: "assets/images/carSpeedIcon.png",
                        label: "Mileage",
                        value: "${cars.mileage} km/L",
                        color: Colors.redAccent[700],
                      ),
                      SizedBox(width: 15),
                      CustomFeatures(
                        image: "assets/images/carFuelTankIcon.png",
                        label: "Fuel Type",
                        value: "${cars.fuelType.name}",
                        color: Colors.blue[800],
                      ),
                      SizedBox(width: 15),
                      CustomFeatures(
                        image: "assets/images/transmissionIcon.png",
                        label: "Transmission",
                        value: "${cars.transmission.name}",
                        color: Colors.greenAccent[700],
                      ),
                      SizedBox(width: 15),
                      CustomFeatures(
                        image: "assets/images/carEngineIcon.png",
                        label: "Engine",
                        value: "${cars.engine}",
                        color: Colors.amber[600],
                      ),
                      SizedBox(width: 15),
                      CustomFeatures(
                        image: "assets/images/carHorsePowerIcon.png",
                        label: "Horse Power",
                        value: "${cars.horsepower.toString()} Hp",
                        color: Colors.deepPurple[700],
                      ),
                      SizedBox(width: 15),
                      CustomFeatures(
                        image: "assets/images/colorIcon.png",
                        label: "Color of Car",
                        value: "${cars.color}",
                        color: Colors.pink[600],
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Text("Features", style: heading),
                  Wrap(
                    runSpacing: 15,
                    spacing: 10,
                    children: List.generate(
                      cars.features.length,
                      (index) {
                        return Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                          decoration: BoxDecoration(
                            color: Colors.pink.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.pink.withOpacity(.3),
                              width: 1,
                            ),
                          ),
                          child: Text(
                            "${cars.features[index]}",
                            style: TextStyle(
                              color: Colors.pink,
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
