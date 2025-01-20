import 'package:apis_demo/Fake%20APIs%20Tutorial/fake_apis_styles.dart';
import 'package:apis_demo/Fake%20APIs%20Tutorial/models/fake_countries_model.dart';
import 'package:flutter/material.dart';

class FakeCountriesDetails extends StatelessWidget {
  final FakeCountriesModel countries;
  const FakeCountriesDetails({super.key, required this.countries});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Hero(
                tag: countries.flag,
                child: Image.network(
                  countries.flag,
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
                Text("${countries.name}", style: heading),
                Text("${countries.capital}", style: description),
                SizedBox(height: 10),
                Text(
                  "Total Area: ${countries.landArea.toStringAsFixed(0)} m²",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.red,
                  ),
                ),
                Text(
                  "Density: ${countries.density} /km2",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.blue,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Total Area: ${countries.population}",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.purple,
                  ),
                ),
                Text(
                  "Currency: ${countries.currency}.",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.green,
                  ),
                ),
                SizedBox(height: 15),
                Text("Description", style: heading),
                SizedBox(height: 5),
                Text(
                    "${countries.name} has an area of ${countries.landArea.toStringAsFixed(0)} m² and density about ${countries.density} /km2. It has a population about ${countries.population} and the currency of this ${countries.name} is ${countries.currency}. ${countries.capital} is the capital of ${countries.name}. ",
                    style: description),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
