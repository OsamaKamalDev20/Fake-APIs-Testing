import 'package:apis_demo/Fake%20APIs%20Tutorial/custom_widget.dart';
import 'package:apis_demo/Fake%20APIs%20Tutorial/fake_apis_styles.dart';
import 'package:apis_demo/Fake%20APIs%20Tutorial/models/fake_products_model.dart';
import 'package:flutter/material.dart';

class FakeProductsDetails extends StatelessWidget {
  final FakeProductsModel products;
  const FakeProductsDetails({super.key, required this.products});

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
                  tag: "${products.image}",
                  child: Image.network(
                    products.image,
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.arrow_back_ios_new_rounded,
                                color: Colors.white,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.white24,
                              ),
                              padding: EdgeInsets.all(6),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.star_rate_rounded,
                                    color: Colors.amber,
                                  ),
                                  Text(
                                    "${products.rating.toString()}",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w800,
                                      color: cardColor,
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
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${products.name}", style: heading),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${products.brand}",
                        style: TextStyle(
                          fontSize: 16,
                          color: descriptionColor,
                        ),
                      ),
                      Text(
                        "\$${products.price.toStringAsFixed(2)}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.pinkAccent[700],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text("${products.description}", style: description),
                  SizedBox(height: 15),
                  Text("Custom Features", style: heading),
                  SizedBox(height: 10),
                  Wrap(
                    runSpacing: 10,
                    spacing: 15,
                    children: [
                      CustomSpecification(
                        title: "Connectivity",
                        value: "${products.connectivity ?? 'Not Specified'}",
                        color: Colors.red,
                      ),
                      CustomSpecification(
                        title: "Color",
                        value: "${products.color ?? 'Not Specified'}",
                        color: Colors.blue,
                      ),
                      CustomSpecification(
                        title: "Wireless",
                        value: "${products.wireless ?? 'Not Specified'}",
                        color: Colors.amber,
                      ),
                      CustomSpecification(
                        title: "Weight",
                        value: "${products.weight ?? 'Not Specified'}",
                        color: Colors.green,
                      ),
                      CustomSpecification(
                        title: "Compatibility",
                        value: "${products.compatibility ?? 'Not Specified'}",
                        color: Colors.deepPurple,
                      ),
                      CustomSpecification(
                        title: "Screen Size",
                        value: "${products.screenSize ?? 'Not Specified'}",
                        color: Colors.pink,
                      ),
                      CustomSpecification(
                        title: "Storage",
                        value: "${products.storage ?? 'Not Specified'}",
                        color: Colors.deepOrange,
                      ),
                      CustomSpecification(
                        title: "RAM",
                        value: "${products.ram ?? 'Not Specified'}",
                        color: Colors.teal,
                      ),
                      CustomSpecification(
                        title: "Resolution",
                        value: "${products.resolution ?? 'Not Specified'}",
                        color: Colors.cyan,
                      ),
                      CustomSpecification(
                        title: "Output Power",
                        value: "${products.outputPower ?? 'Not Specified'}",
                        color: Colors.brown,
                      ),
                      CustomSpecification(
                        title: "Suction Power",
                        value: "${products.suctionPower ?? 'Not Specified'}",
                        color: Colors.limeAccent[700],
                      ),
                      CustomSpecification(
                        title: "Battery Life",
                        value: "${products.batteryLife ?? 'Not Specified'}",
                        color: Colors.yellowAccent[700],
                      ),
                      CustomSpecification(
                        title: "Heart Rate Monitor",
                        value:
                            "${products.heartRateMonitor ?? 'Not Specified'}",
                        color: Colors.indigoAccent[700],
                      ),
                      CustomSpecification(
                        title: "Water Proof",
                        value: "${products.waterproof ?? 'Not Specified'}",
                        color: Colors.lightGreenAccent[700],
                      ),
                      CustomSpecification(
                        title: "Display",
                        value: "${products.display ?? 'Not Specified'}",
                        color: Colors.pink[700],
                      ),
                      CustomSpecification(
                        title: "Games Included",
                        value: "${products.gamesIncluded ?? 'Not Specified'}",
                        color: Colors.grey[700],
                      ),
                      CustomSpecification(
                        title: "Sensors",
                        value: "${products.sensor ?? 'Not Specified'}",
                        color: Colors.purpleAccent[700],
                      ),
                      CustomSpecification(
                        title: "Mapping Technology",
                        value:
                            "${products.mappingTechnology ?? 'Not Specified'}",
                        color: Colors.cyanAccent[700],
                      ),
                      CustomSpecification(
                        title: "Storage Capacity",
                        value: "${products.storageCapacity ?? 'Not Specified'}",
                        color: Colors.deepOrange[700],
                      ),
                      CustomSpecification(
                        title: "Fake Products Interface",
                        value:
                            "${products.fakeProductsModelInterface ?? 'Not Specified'}",
                        color: Colors.redAccent[700],
                      ),
                      CustomSpecification(
                        title: "Max Speed",
                        value: "${products.maxSpeed ?? 'Not Specified'}",
                        color: Colors.blue[700],
                      ),
                      CustomSpecification(
                        title: "Range",
                        value: "${products.range ?? 'Not Specified'}",
                        color: Colors.greenAccent[700],
                      ),
                      CustomSpecification(
                        title: "Weight Capacity",
                        value: "${products.weightCapacity ?? 'Not Specified'}",
                        color: Colors.orangeAccent[700],
                      ),
                      CustomSpecification(
                        title: "Power",
                        value: "${products.power ?? 'Not Specified'}",
                        color: Colors.pink[700],
                      ),
                    ],
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
