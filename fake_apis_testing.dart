import 'package:apis_demo/Fake%20APIs%20Tutorial/data/fake_actors_api_data.dart';
import 'package:apis_demo/Fake%20APIs%20Tutorial/data/fake_actresses_api_data.dart';
import 'package:apis_demo/Fake%20APIs%20Tutorial/data/fake_airlines_api_data.dart';
import 'package:apis_demo/Fake%20APIs%20Tutorial/data/fake_airports_api_data.dart';
import 'package:apis_demo/Fake%20APIs%20Tutorial/data/fake_animals_api_data.dart';
import 'package:apis_demo/Fake%20APIs%20Tutorial/data/fake_authors_api_data.dart';
import 'package:apis_demo/Fake%20APIs%20Tutorial/data/fake_birds_api_data.dart';
import 'package:apis_demo/Fake%20APIs%20Tutorial/data/fake_books_api_data.dart';
import 'package:apis_demo/Fake%20APIs%20Tutorial/data/fake_cars_api_data.dart';
import 'package:apis_demo/Fake%20APIs%20Tutorial/data/fake_cats_api_data.dart';
import 'package:apis_demo/Fake%20APIs%20Tutorial/data/fake_countries_api_data.dart';
import 'package:apis_demo/Fake%20APIs%20Tutorial/data/fake_currencies_api_data.dart';
import 'package:apis_demo/Fake%20APIs%20Tutorial/data/fake_destinations_api_data.dart';
import 'package:apis_demo/Fake%20APIs%20Tutorial/data/fake_dogs_api_data.dart';
import 'package:apis_demo/Fake%20APIs%20Tutorial/data/fake_languages_api_data.dart';
import 'package:apis_demo/Fake%20APIs%20Tutorial/data/fake_movies_api_data.dart';
import 'package:apis_demo/Fake%20APIs%20Tutorial/data/fake_poets_api_data.dart';
import 'package:apis_demo/Fake%20APIs%20Tutorial/data/fake_politicians_api_data.dart';
import 'package:apis_demo/Fake%20APIs%20Tutorial/data/fake_products_api_data.dart';
import 'package:apis_demo/Fake%20APIs%20Tutorial/data/fake_students_api_data.dart';
import 'package:apis_demo/Fake%20APIs%20Tutorial/data/fake_teachers_api_data.dart';
import 'package:apis_demo/Fake%20APIs%20Tutorial/data/fake_todos_api_data.dart';
import 'package:apis_demo/Fake%20APIs%20Tutorial/data/fake_unitedStates_api_data.dart';
import 'package:apis_demo/Fake%20APIs%20Tutorial/data/fake_users_api_data.dart';
import 'package:apis_demo/Fake%20APIs%20Tutorial/data/fake_weathers_api_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'data/fake_posts_api_data.dart';

class FakeAPITestingTutorial extends StatelessWidget {
  const FakeAPITestingTutorial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fake API Testing"),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //Fake User APIs
              ListTile(
                leading: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(.2),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.person_rounded,
                    color: Colors.blue,
                    size: 34,
                  ),
                ),
                title: Text(
                  "Users API",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  "Fake Users API",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FakeUserAPI(),
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    size: 14,
                  ),
                ),
              ),
              //Fake Actors APIs
              ListTile(
                leading: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.red.withOpacity(.2),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    CupertinoIcons.film,
                    color: Colors.red,
                    size: 34,
                  ),
                ),
                title: Text(
                  "Actors API",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  "Fake Actors API",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FakeActorsAPI(),
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    size: 14,
                  ),
                ),
              ),
              //Fake Movies APIs
              ListTile(
                leading: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.deepOrange.withOpacity(.2),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.movie_creation_rounded,
                    color: Colors.deepOrange,
                    size: 34,
                  ),
                ),
                title: Text(
                  "Movies API",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  "Fake Actors API",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FakeMoviesAPIs(),
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    size: 14,
                  ),
                ),
              ),
              //Fake Authors APIs
              ListTile(
                leading: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(.2),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.person_2_rounded,
                    color: Colors.green,
                    size: 34,
                  ),
                ),
                title: Text(
                  "Author API",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  "Fake Authors API",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FakeAuthorsAPIs(),
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    size: 14,
                  ),
                ),
              ),
              //Fake Books APIs
              ListTile(
                leading: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple.withOpacity(.2),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    CupertinoIcons.book_solid,
                    color: Colors.deepPurple,
                    size: 34,
                  ),
                ),
                title: Text(
                  "Books API",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  "Fake Books API",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FakeBooksAPIs(),
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    size: 14,
                  ),
                ),
              ),
              //Fake Countries APIs
              ListTile(
                leading: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.amber.withOpacity(.2),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.language_rounded,
                    color: Colors.amber,
                    size: 34,
                  ),
                ),
                title: Text(
                  "Countries API",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  "Fake Countries API",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FakeCountriesAPIs(),
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    size: 14,
                  ),
                ),
              ),
              //Fake Actresses APIs
              ListTile(
                leading: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.teal.withOpacity(.2),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    CupertinoIcons.film,
                    color: Colors.teal,
                    size: 34,
                  ),
                ),
                title: Text(
                  "Actresses API",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  "Fake Actresses API",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FakeActressesAPIs(),
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    size: 14,
                  ),
                ),
              ),
              //Fake Animals APIs
              ListTile(
                leading: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.cyan.withOpacity(.2),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.pets_rounded,
                    color: Colors.cyan,
                    size: 34,
                  ),
                ),
                title: Text(
                  "Animals API",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  "Fake Animals API",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FakeAnimalsAPIs(),
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    size: 14,
                  ),
                ),
              ),
              //Fake Currencies APIs
              ListTile(
                leading: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.pink.withOpacity(.2),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.money_rounded,
                    color: Colors.pink,
                    size: 34,
                  ),
                ),
                title: Text(
                  "Currencies API",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  "Fake Currencies API",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FakeCurrenciesAPIs(),
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    size: 14,
                  ),
                ),
              ),
              //Fake Students APIs
              ListTile(
                leading: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.brown.withOpacity(.2),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.person_3_rounded,
                    color: Colors.brown,
                    size: 34,
                  ),
                ),
                title: Text(
                  "Students API",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  "Fake Students API",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FakeStudentsAPIs(),
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    size: 14,
                  ),
                ),
              ),
              //Fake Poets APIs
              ListTile(
                leading: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.indigoAccent.withOpacity(.2),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.person_4_rounded,
                    color: Colors.indigoAccent,
                    size: 34,
                  ),
                ),
                title: Text(
                  "Poets API",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  "Fake Poets API",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FakePoetsAPIs(),
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    size: 14,
                  ),
                ),
              ),
              //Fake Cars APIs
              ListTile(
                leading: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.yellow.withOpacity(.2),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    CupertinoIcons.car_detailed,
                    color: Colors.yellow,
                    size: 34,
                  ),
                ),
                title: Text(
                  "Cars API",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  "Fake Cars API",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FakeCarsAPIs(),
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    size: 14,
                  ),
                ),
              ),
              //Fake Teachers APIs
              ListTile(
                leading: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.limeAccent.withOpacity(.2),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.person_4_rounded,
                    color: Colors.limeAccent,
                    size: 34,
                  ),
                ),
                title: Text(
                  "Teachers API",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  "Fake Teachers API",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FakeTeachersAPIs(),
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    size: 14,
                  ),
                ),
              ),
              //Fake Dogs APIs
              ListTile(
                leading: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.lightBlueAccent.withOpacity(.2),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.pets_rounded,
                    color: Colors.lightBlueAccent,
                    size: 34,
                  ),
                ),
                title: Text(
                  "Dogs API",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  "Fake Dogs API",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FakeDogsAPIs(),
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    size: 14,
                  ),
                ),
              ),
              //Fake Cats APIs
              ListTile(
                leading: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey.withOpacity(.2),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.pets_rounded,
                    color: Colors.blueGrey,
                    size: 34,
                  ),
                ),
                title: Text(
                  "Cats API",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  "Fake Cats API",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FakeCatsAPIs(),
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    size: 14,
                  ),
                ),
              ),
              //Fake Birds APIs
              ListTile(
                leading: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.lightGreenAccent.shade100.withOpacity(.4),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.pets_rounded,
                    color: Colors.lightGreenAccent[400],
                    size: 34,
                  ),
                ),
                title: Text(
                  "Birds API",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  "Fake Birds API",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FakeBirdsAPIs(),
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    size: 14,
                  ),
                ),
              ),
              //Fake Languages APIs
              ListTile(
                leading: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.purple.withOpacity(.2),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.language_rounded,
                    color: Colors.purple,
                    size: 34,
                  ),
                ),
                title: Text(
                  "Languages API",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  "Fake Languages API",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FakeLanguagesAPIs(),
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    size: 14,
                  ),
                ),
              ),
              //Fake United States APIs
              ListTile(
                leading: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.orange.withOpacity(.2),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.location_city_rounded,
                    color: Colors.orange[900],
                    size: 34,
                  ),
                ),
                title: Text(
                  "United States API",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  "Fake United States API",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FakeUnitedStatesAPIs(),
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    size: 14,
                  ),
                ),
              ),
              //Fake Weather APIs
              ListTile(
                leading: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.yellowAccent.withOpacity(.2),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.wb_sunny_rounded,
                    color: Colors.yellowAccent[700],
                    size: 34,
                  ),
                ),
                title: Text(
                  "Weather API",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  "Fake Weather API",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FakeWeatherAPIs(),
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    size: 14,
                  ),
                ),
              ),
              //Fake Posts APIs
              ListTile(
                leading: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.lightGreen.withOpacity(.2),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.post_add_sharp,
                    color: Colors.lightGreen[700],
                    size: 34,
                  ),
                ),
                title: Text(
                  "Posts API",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  "Fake Posts API",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PostListScreen(),
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    size: 14,
                  ),
                ),
              ),
              //Fake Products APIs
              ListTile(
                leading: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.pinkAccent.withOpacity(.2),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.shopping_cart_rounded,
                    color: Colors.pinkAccent,
                    size: 34,
                  ),
                ),
                title: Text(
                  "Products API",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  "Fake Products API",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FakeProductsAPIs(),
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    size: 14,
                  ),
                ),
              ),
              //Fake Airports APIs
              ListTile(
                leading: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.redAccent.withOpacity(.2),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.airplanemode_on_rounded,
                    color: Colors.redAccent[700],
                    size: 34,
                  ),
                ),
                title: Text(
                  "Airports API",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  "Fake Airports API",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FakeAirportsAPIs(),
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    size: 14,
                  ),
                ),
              ),
              //Fake Airlines APIs
              ListTile(
                leading: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.blueAccent.withOpacity(.2),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.airplanemode_active_rounded,
                    color: Colors.blueAccent[700],
                    size: 34,
                  ),
                ),
                title: Text(
                  "Airlines API",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  "Fake Airlines API",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FakeAirlinesAPIs(),
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    size: 14,
                  ),
                ),
              ),
              //Fake Todos APIs
              ListTile(
                leading: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.deepOrangeAccent.withOpacity(.2),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.note_add_rounded,
                    color: Colors.deepOrangeAccent[400],
                    size: 34,
                  ),
                ),
                title: Text(
                  "Todos API",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  "Fake Todos API",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FakeTodosAPIs(),
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    size: 14,
                  ),
                ),
              ),
              //Fake Politicians APIs
              ListTile(
                leading: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.deepPurpleAccent.withOpacity(.2),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    CupertinoIcons.person_alt,
                    color: Colors.deepPurpleAccent[700],
                    size: 34,
                  ),
                ),
                title: Text(
                  "Politicians API",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  "Fake Politicians API",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FakePoliticiansAPIs(),
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    size: 14,
                  ),
                ),
              ),
              //Fake Countries APIs
              ListTile(
                leading: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Color(0XFFE4003A).withOpacity(.2),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.location_on_rounded,
                    color: Color(0XFFE4003A),
                    size: 34,
                  ),
                ),
                title: Text(
                  "Destinations API",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  "Fake Destinations API",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FakeDestinationsAPIs(),
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    size: 14,
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
