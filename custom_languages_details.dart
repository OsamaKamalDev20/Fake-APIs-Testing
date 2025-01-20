import 'package:apis_demo/Fake%20APIs%20Tutorial/fake_apis_styles.dart';
import 'package:flutter/material.dart';

class CustomLanguagesDetails extends StatelessWidget {
  final title;
  final value;
  const CustomLanguagesDetails({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: heading,
        ),
        Text(
          value,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 16,
            color: descriptionColor,
          ),
        ),
      ],
    );
  }
}
