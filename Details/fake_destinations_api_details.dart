import 'package:apis_demo/Fake%20APIs%20Tutorial/custom_widget.dart';
import 'package:apis_demo/Fake%20APIs%20Tutorial/fake_apis_styles.dart';
import 'package:apis_demo/Fake%20APIs%20Tutorial/models/fake_destinations_model.dart';
import 'package:flutter/material.dart';

class FakeDestinationsDetails extends StatelessWidget {
  final FakeDestinationsModel destinations;
  const FakeDestinationsDetails({
    super.key,
    required this.destinations,
  });

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
                  tag: destinations.image,
                  child: Image.network(
                    "${destinations.image}",
                    height: 300,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 6),
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
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${destinations.name}", style: heading),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${destinations.country}",
                        style: TextStyle(
                          fontSize: 16,
                          color: descriptionColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text("${destinations.continent.name}",
                          style: description),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text("Description", style: heading),
                  SizedBox(height: 5),
                  Text("${destinations.description}", style: description),
                  SizedBox(height: 10),
                  Wrap(
                    spacing: 10,
                    runSpacing: 15,
                    children: [
                      CustomSpecification(
                        title: "Best Time to Visit",
                        value: "${destinations.bestTimeToVisit}",
                        color: Color(0XFFE4003A),
                      ),
                      CustomSpecification(
                        title: "Populations",
                        value: "${destinations.population}",
                        color: Color(0XFFE4003A),
                      ),
                      CustomSpecification(
                        title: "Currency",
                        value: "${destinations.currency}",
                        color: Color(0XFFE4003A),
                      ),
                      CustomSpecification(
                        title: "Language",
                        value: "${destinations.language}",
                        color: Color(0XFFE4003A),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text("Tourists Attractions", style: heading),
                  SizedBox(height: 5),
                  Wrap(
                    runSpacing: 15,
                    spacing: 10,
                    children: List.generate(
                      destinations.topAttractions.length,
                      (index) {
                        return Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                          decoration: BoxDecoration(
                            color: Color(0XFFE4003A).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Color(0XFFE4003A).withOpacity(.3),
                              width: 1,
                            ),
                          ),
                          child: Text(
                            "${destinations.topAttractions[index]}",
                            style: TextStyle(
                              color: Color(0XFFE4003A),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 10),
                  Text("Famous Dishes", style: heading),
                  SizedBox(height: 5),
                  Wrap(
                    runSpacing: 15,
                    spacing: 10,
                    children: List.generate(
                      destinations.localDishes.length,
                      (index) {
                        return Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                          decoration: BoxDecoration(
                            color: Color(0XFFE4003A).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Color(0XFFE4003A).withOpacity(.3),
                              width: 1,
                            ),
                          ),
                          child: Text(
                            "${destinations.localDishes[index]}",
                            style: TextStyle(
                              color: Color(0XFFE4003A),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 10),
                  Text("Activities", style: heading),
                  SizedBox(height: 5),
                  Wrap(
                    runSpacing: 15,
                    spacing: 10,
                    children: List.generate(
                      destinations.activities.length,
                      (index) {
                        return Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                          decoration: BoxDecoration(
                            color: Color(0XFFE4003A).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Color(0XFFE4003A).withOpacity(.3),
                              width: 1,
                            ),
                          ),
                          child: Text(
                            "${destinations.activities[index]}",
                            style: TextStyle(
                              color: Color(0XFFE4003A),
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
