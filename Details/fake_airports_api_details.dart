import 'package:apis_demo/Fake%20APIs%20Tutorial/custom_widget.dart';
import 'package:apis_demo/Fake%20APIs%20Tutorial/fake_apis_styles.dart';
import 'package:apis_demo/Fake%20APIs%20Tutorial/models/fake_airports_model.dart';
import 'package:flutter/material.dart';

class FakeAirportsDetails extends StatelessWidget {
  final FakeAirportModel airports;
  const FakeAirportsDetails({super.key, required this.airports});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent[700],
        title: Text("Airports Detail"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${airports.name}", style: heading),
              SizedBox(height: 5),
              Text("${airports.timezone}", style: description),
              SizedBox(height: 10),
              Text(
                "${airports.name} is located in the city of ${airports.city} in the country ${airports.country}. It is situated at Latitude ${airports.location.latitude.toStringAsFixed(2)}° and Longitude ${airports.location.longitude.toStringAsFixed(2)}°.",
                style: TextStyle(
                  fontSize: 16,
                  color: descriptionColor,
                ),
              ),
              SizedBox(height: 10),
              Wrap(
                runSpacing: 15,
                spacing: 15,
                children: [
                  CustomSpecification(
                    title: "Country",
                    value: "${airports.country}",
                    color: Colors.redAccent[700],
                  ),
                  CustomSpecification(
                    title: "City",
                    value: "${airports.city}",
                    color: Colors.redAccent[700],
                  ),
                  CustomSpecification(
                    title: "Latitude",
                    value: "${airports.location.latitude.toStringAsFixed(3)}°",
                    color: Colors.redAccent[700],
                  ),
                  CustomSpecification(
                    title: "Longitude",
                    value: "${airports.location.longitude.toStringAsFixed(3)}°",
                    color: Colors.redAccent[700],
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text("Airlines", style: heading),
              SizedBox(height: 5),
              Wrap(
                runSpacing: 10,
                spacing: 10,
                children: List.generate(
                  airports.airlines.length,
                  (index) {
                    return Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.redAccent.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.redAccent.withOpacity(.3),
                          width: 1,
                        ),
                      ),
                      child: Text(
                        "${airports.airlines[index]}",
                        style: TextStyle(
                          color: Colors.redAccent[700],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 10),
              Text("Services at Airport", style: heading),
              SizedBox(height: 5),
              Wrap(
                runSpacing: 10,
                spacing: 10,
                children: List.generate(
                  airports.services.length,
                  (index) {
                    return Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.redAccent.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.redAccent.withOpacity(.3),
                          width: 1,
                        ),
                      ),
                      child: Text(
                        "${airports.services[index].name}",
                        style: TextStyle(
                          color: Colors.redAccent[700],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 10),
              Text("Contact Info", style: heading),
              SizedBox(height: 5),
              Material(
                elevation: 4,
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  padding: EdgeInsets.all(6),
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: cardColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.phone_rounded,
                            size: 30,
                            color: Colors.redAccent[700],
                          ),
                          SizedBox(width: 8),
                          Text(
                            "Phone No",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: headingColor,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "${airports.contactInfo.phone}.",
                        style: TextStyle(
                          fontSize: 16,
                          color: descriptionColor,
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Icon(
                            Icons.email_rounded,
                            size: 30,
                            color: Colors.redAccent[700],
                          ),
                          SizedBox(width: 8),
                          Text(
                            "Email",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: headingColor,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "${airports.contactInfo.email}.",
                        style: TextStyle(
                          fontSize: 16,
                          color: descriptionColor,
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Icon(
                            Icons.language_outlined,
                            size: 30,
                            color: Colors.redAccent[700],
                          ),
                          SizedBox(width: 8),
                          Text(
                            "Website",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: headingColor,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "${airports.contactInfo.website}.",
                        style: TextStyle(
                          fontSize: 16,
                          color: descriptionColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
