import 'package:apis_demo/Fake%20APIs%20Tutorial/fake_apis_styles.dart';
import 'package:apis_demo/Fake%20APIs%20Tutorial/models/fake_currencies_model.dart';
import 'package:flutter/material.dart';

class FakeCurrenciesDetails extends StatelessWidget {
  final FakeCurrenciesModel currencies;
  const FakeCurrenciesDetails({super.key, required this.currencies});

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
                tag: currencies.image,
                child: Image.network(
                  currencies.image,
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
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${currencies.name}", style: heading),
                Text("${currencies.code}", style: description),
                SizedBox(height: 15),
                Text("Description", style: heading),
                SizedBox(height: 5),
                Text("${currencies.description}", style: description),
                SizedBox(height: 15),
                Text("Countries", style: heading),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(
                    currencies.countries.length,
                    (index) {
                      return Text(
                        "➤ ${currencies.countries[index]}.",
                        style: description,
                      );
                    },
                  ),
                ),
                SizedBox(height: 1),
                Text("Subunits", style: heading),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(
                    currencies.subunits.length,
                    (index) {
                      return Text(
                        "➤ ${currencies.subunits[index]}.",
                        style: description,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
