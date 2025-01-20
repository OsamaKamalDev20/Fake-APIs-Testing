import 'package:apis_demo/Fake%20APIs%20Tutorial/custom_languages_details.dart';
import 'package:apis_demo/Fake%20APIs%20Tutorial/fake_apis_styles.dart';
import 'package:apis_demo/Fake%20APIs%20Tutorial/models/fake_languages_model.dart';
import 'package:flutter/material.dart';

class FakeLanguagesDetails extends StatelessWidget {
  final FakeLanguagesModel languages;
  const FakeLanguagesDetails({super.key, required this.languages});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(languages.name),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomLanguagesDetails(
                title: "Name",
                value: "${languages.name}",
              ),
              SizedBox(height: 15),
              CustomLanguagesDetails(
                title: "Speakers",
                value: "${languages.speakers} speakers around the world.",
              ),
              SizedBox(height: 15),
              CustomLanguagesDetails(
                title: "Region",
                value: "${languages.region}.",
              ),
              SizedBox(height: 15),
              CustomLanguagesDetails(
                title: "Script",
                value: "${languages.script}.",
              ),
              SizedBox(height: 15),
              CustomLanguagesDetails(
                title: "Family",
                value: "${languages.family}.",
              ),
              SizedBox(height: 15),
              CustomLanguagesDetails(
                title: "Notes",
                value: "${languages.notes}",
              ),
              SizedBox(height: 15),
              CustomLanguagesDetails(
                title: "Official Status",
                value: "${languages.officialStatus}",
              ),
              SizedBox(height: 15),
              CustomLanguagesDetails(
                title: "Language History",
                value: "${languages.languageHistory}",
              ),
              SizedBox(height: 15),
              CustomLanguagesDetails(
                title: "Writing System",
                value: "${languages.writingSystem}",
              ),
              SizedBox(height: 15),
              CustomLanguagesDetails(
                title: "Language Status",
                value: "${languages.languageStatus}",
              ),
              SizedBox(height: 15),
              Text(
                "Dialects",
                style: heading,
              ),
              SizedBox(height: 5),
              Wrap(
                runSpacing: 15,
                spacing: 10,
                children: List.generate(
                  languages.dialects.length,
                  (index) {
                    return Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.purple.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.purple.withOpacity(.3),
                          width: 1,
                        ),
                      ),
                      child: Text(
                        "${languages.dialects[index]}",
                        style: TextStyle(
                          color: Colors.purple,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 15),
              Text(
                "Related Languages",
                style: heading,
              ),
              SizedBox(height: 5),
              Wrap(
                runSpacing: 15,
                spacing: 10,
                children: List.generate(
                  languages.relatedLanguages.length,
                  (index) {
                    return Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.purple.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.purple.withOpacity(.3),
                          width: 1,
                        ),
                      ),
                      child: Text(
                        "${languages.relatedLanguages[index]}",
                        style: TextStyle(
                          color: Colors.purple,
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
      ),
    );
  }
}
