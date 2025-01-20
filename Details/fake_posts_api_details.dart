import 'package:apis_demo/Fake%20APIs%20Tutorial/fake_apis_styles.dart';
import 'package:apis_demo/Fake%20APIs%20Tutorial/models/fake_posts_model.dart';
import 'package:flutter/material.dart';

class FakePostDetail extends StatelessWidget {
  final FakePostsModel posts;

  const FakePostDetail({Key? key, required this.posts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: Text("Fake Posts Detail"),
        backgroundColor: Colors.lightGreen[700],
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("${posts.title}", style: heading),
            SizedBox(height: 5),
            Text(
              "Author: ${posts.author}",
              style: TextStyle(
                fontSize: 16,
                color: descriptionColor,
              ),
            ),
            SizedBox(height: 10),
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
                    Text("${posts.content}", style: description),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Date: ",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Date: ${posts.timestamp.toLocal()}"
                                  .split(' ')[1],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Colors.red[700],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(
                          Icons.thumb_up_rounded,
                          size: 34,
                          color: Colors.blue,
                        ),
                        SizedBox(width: 5),
                        Text(
                          "${posts.likes}",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Comments:",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    posts.comments.isEmpty
                        ? Text(
                            "No comments yet.",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: posts.comments.length,
                            itemBuilder: (context, index) {
                              final comment = posts.comments[index];
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${comment.author}",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green[700],
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    "${comment.text}",
                                    style: description,
                                  ),
                                  SizedBox(height: 10),
                                ],
                              );
                            },
                          ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
