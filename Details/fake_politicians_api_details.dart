import 'package:apis_demo/Fake%20APIs%20Tutorial/custom_widget.dart';
import 'package:apis_demo/Fake%20APIs%20Tutorial/fake_apis_styles.dart';
import 'package:apis_demo/Fake%20APIs%20Tutorial/models/fake_politicians_model.dart';
import 'package:flutter/material.dart';

class FakePoliticiansDetails extends StatelessWidget {
  final FakePoliticianModel politicians;
  const FakePoliticiansDetails({super.key, required this.politicians});

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
                  tag: politicians.image,
                  child: Image.network(
                    politicians.image,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Image.network(
                        "https://rfkhumanrights.org/wp-content/uploads/2023/12/President-of-Ukraine-e1717448862735.jpeg",
                        fit: BoxFit.cover,
                      );
                    },
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
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${politicians.name}",
                    style: TextStyle(
                      fontSize: 20,
                      color: headingColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${politicians.country}",
                        style: TextStyle(
                          fontSize: 16,
                          color: descriptionColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text("${politicians.dob}", style: description),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text("Description", style: heading),
                  SizedBox(height: 5),
                  Text("${politicians.biography}", style: description),
                  SizedBox(height: 10),
                  Text("Carrier", style: heading),
                  SizedBox(height: 10),
                  Wrap(
                    spacing: 10,
                    runSpacing: 15,
                    children: [
                      CustomSpecification(
                        title: "Political Party",
                        value: "${politicians.party}",
                        color: Colors.deepPurpleAccent[700],
                      ),
                      CustomSpecification(
                        title: "Party Position",
                        value: "${politicians.position}",
                        color: Colors.deepPurpleAccent[700],
                      ),
                      CustomSpecification(
                        title: "Year in Office",
                        value: "${politicians.yearsInOffice}",
                        color: Colors.deepPurpleAccent[700],
                      ),
                    ],
                  ),
                  SizedBox(width: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
